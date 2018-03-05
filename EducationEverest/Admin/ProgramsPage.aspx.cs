using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_ProgramsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Super Admin"))))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        else if (!Page.IsPostBack)
        {
            
            populateProgramData();
        }
        populateCategories();
    }

    protected void populateCategories()
    {
        ph_Categories.Controls.Clear();
        EducationEverestEntities db = new EducationEverestEntities();
        int CampusId = 0, ProgramId = 0,departmentId = 0;
        if (Request.QueryString["pid"] != null)
        {
            ProgramId = Convert.ToInt32(Request.QueryString["pid"]);
            //get campus Id
            if (db.Programms.Any(a => a.id == ProgramId))
            {
                CampusId = db.Programms.Where(a => a.id == ProgramId).First().Department.CampusID;
            }
        }
        else if(Request.QueryString["did"] != null)
        {
            departmentId = Convert.ToInt32(Request.QueryString["did"]);
            //get campus Id
            if (db.Departments.Any(a => a.id == departmentId))
            {
                CampusId = db.Departments.Where(a => a.id == departmentId).First().CampusID;
            }
        }

        

        if (CampusId != 0)
        {
            List<Category> categories = db.Categories.Where(a => a.CampusID == CampusId).ToList();
            for (int i = 0; i < categories.Count; i++)
            {
                int CategoryID = categories[i].id;
                HtmlGenericControl NewControl = new HtmlGenericControl("div");
                NewControl.Attributes.Add("class", "col-md-12");

                CheckBox myChecbox = new CheckBox();

                myChecbox.ID = CategoryID.ToString();
                myChecbox.Text = categories[i].Category_Name;
                myChecbox.Attributes.Add("style", "margin-bottom:5px");
                myChecbox.Attributes.Add("runat", "server");
                myChecbox.Checked = true;

                if(ProgramId != 0 && !db.ProgrammCategories.Any(a => a.Programm_ID == ProgramId && a.Category_ID == CategoryID))
                {
                    myChecbox.Checked = false;
                }

                NewControl.Controls.Add(myChecbox);
                ph_Categories.Controls.Add(NewControl);
            }
        }
    }

    protected void populateProgramData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int ProgramId = 0;
        if (Request.QueryString["pid"] != null)
        {
            ProgramId = Convert.ToInt32(Request.QueryString["pid"]);
        }


        if (ProgramId != 0)
        {

            if (db.Programms.Any(a => a.id == ProgramId))
            {
                Programm program = db.Programms.Where(a => a.id == ProgramId).First();
                tb_ProgramName.Text = program.Program_Name;
                
                //populate program categories

            }
        }
    }

    protected void btn_Done_Click(object sender, EventArgs e)
    {
        //save program
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0, ProgramId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }

        if (Request.QueryString["pid"] != null)
        {
            ProgramId = Convert.ToInt32(Request.QueryString["pid"]);
        }

        if (DepartmentId != 0)
        {
            //save Program data
            if (ProgramId == 0)
            {
                Programm newPorgram = new Programm();
                newPorgram.Program_Name = tb_ProgramName.Text;
                newPorgram.Department_ID = DepartmentId;
                newPorgram.Status = true;
                db.Programms.Add(newPorgram);
                db.SaveChanges();

                
                foreach (Control ctrl in ph_Categories.Controls)
                {
                    if (ctrl.Controls[0] is CheckBox)
                    {
                        CheckBox cb = (CheckBox)ctrl.Controls[0];
                        string checkboxId = cb.ID;
                        if (cb.Checked)
                        {
                            //create new ProgramCateogry
                            ProgrammCategory newProgramCategory = new ProgrammCategory();
                            newProgramCategory.Category_ID = Convert.ToInt32(cb.ID);
                            newProgramCategory.Programm_ID = newPorgram.id;
                            
                            db.ProgrammCategories.Add(newProgramCategory);
                            db.SaveChanges();
                        }
                    }
                }

                ProgramId = newPorgram.id;
            }
            else
            {
                Programm existingProgram = db.Programms.Where(a => a.id == ProgramId).First();

                existingProgram.Program_Name = tb_ProgramName.Text;
                existingProgram.Status = true;

                db.SaveChanges();

                foreach (Control ctrl in ph_Categories.Controls)
                {
                    if (ctrl.Controls[0] is CheckBox)
                    {
                        CheckBox cb = (CheckBox)ctrl.Controls[0];
                        int CategoryId = 0;
                        string checkboxId = cb.ID;
                        CategoryId = Convert.ToInt32(checkboxId);
                        if (cb.Checked && !db.ProgrammCategories.Any(a => a.Category_ID == CategoryId && a.Programm_ID == existingProgram.id))
                        {
                            //create new ProgramCateogry
                            ProgrammCategory newProgramCategory = new ProgrammCategory();
                            newProgramCategory.Category_ID = CategoryId;
                            newProgramCategory.Programm_ID = existingProgram.id;

                            db.ProgrammCategories.Add(newProgramCategory);
                            db.SaveChanges();
                        }
                        if(!cb.Checked && db.ProgrammCategories.Any(a => a.Category_ID == CategoryId && a.Programm_ID == existingProgram.id)){

                            //remove this ProgramCateogry
                            ProgrammCategory ProgramCategory = db.ProgrammCategories.Where(a => a.Category_ID == CategoryId && a.Programm_ID == existingProgram.id).First();
                            
                            db.ProgrammCategories.Remove(ProgramCategory);
                            db.SaveChanges();
                        }
                    }
                }

            }

        }
        
        Response.Redirect("Programs.aspx?did="+DepartmentId);
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx"); Response.Redirect("Main_Uni.aspx");
    }

    protected void lb_campuses_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0, ProgramID = 0, universityID = 0;
        if (Request.QueryString["pid"] != null)
        {
            ProgramID = Convert.ToInt32(Request.QueryString["pid"]);
            universityID = db.Programms.Where(a => a.id == ProgramID).First().Department.Campus.Uni_ID;
        }
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
            universityID = db.Departments.Where(a => a.id == DepartmentId).First().Campus.Uni_ID;
        }
        Response.Redirect("campuses.aspx?uid=" + universityID);
    }

    protected void lb_departments_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0, CampusId = 0 ;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
            CampusId = db.Departments.Where(a => a.id == DepartmentId).First().CampusID;
        }
        Response.Redirect("Departments.aspx?cid=" + CampusId);
    }

    protected void lb_programs_Click(object sender, EventArgs e)
    {
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        Response.Redirect("Programs.aspx?did=" + DepartmentId);
    }
}