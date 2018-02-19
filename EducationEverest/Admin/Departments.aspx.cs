using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Departments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["Departments"] == null)
        {
            ViewState["Departments"] = 10;
        }
        if (!Page.IsPostBack)
        {
            populateDepartmentsData();
        }
        populateDepartmentTextboxes();
    }

    protected void btn_newDepart_Click(object sender, EventArgs e)
    {
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        Response.Redirect("DepartmentPage.aspx?cid="+CampusId);
    }

    protected void btn_bulkDeparts_Click(object sender, EventArgs e)
    {
        div_placeHolder.Visible = true;
        div_Buttons.Visible = false;
        div_Gridview.Visible = false;
        div_Search.Visible = false;
        populateDepartmentTextboxes();
    }

    protected void populateDepartmentTextboxes()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        ph_Departments.Controls.Clear();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        if (CampusId != 0)
        {
            int department_textboxes = Convert.ToInt32(ViewState["Departments"]);
            for (int i = 0; i < department_textboxes; i++)
            {
                HtmlGenericControl NewControl = new HtmlGenericControl("div");
                NewControl.Attributes.Add("class", "col-md-12");

                TextBox MyTextBox = new TextBox();
                //nd = new department

                MyTextBox.ID = "nd" + i.ToString();
                MyTextBox.Text = string.Empty;
                MyTextBox.Attributes.Add("placeholder", "Enter Department Name " + (i + 1));
                MyTextBox.Attributes.Add("style", "margin-bottom:5px");
                MyTextBox.Attributes.Add("class", "form-control");
                MyTextBox.Attributes.Add("runat", "server");


                NewControl.Controls.Add(MyTextBox);
                ph_Departments.Controls.Add(NewControl);
            }
        }
    }

    protected void populateDepartmentsData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        List<Department> departments = db.Departments.ToList();
        foreach (var department in departments)
        {
            if(db.Programms.Any(a => a.Department_ID == department.id))
            {
                bool status = (bool) db.Programms.First().Status;
                int count = db.Programms.Select(a => a.Status).Distinct().Count();
                if(status && count == 1)
                {
                    department.Status = true;
                    
                }
                else
                {
                    department.Status = false;
                }
                db.SaveChanges();
            }
        }
        GridView1.DataSource = db.Departments.Where(a => a.CampusID == CampusId).ToList();
        GridView1.DataBind();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        EducationEverestEntities db = new EducationEverestEntities();
        var a = TextBox1.Text;
        if (a == "")
        {
            populateDepartmentsData();
        }
        else
        {

            var k = db.Departments.Where(x => x.Department_Name.Contains(a) && x.CampusID == CampusId).ToList();
            GridView1.DataSource = k;
            GridView1.DataBind();
        }
    }

    protected void MyID_Click(object sender, CommandEventArgs e)
    {
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        if (e.CommandName == "MyDepartmentID")
        {
            Response.Redirect("DepartmentPage.aspx?cid=" + CampusId + "&did=" + e.CommandArgument);
        }

    }

    protected void saveDepartments_Click(object sender, EventArgs e)
    {
        
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        if (CampusId != 0)
        {
            EducationEverestEntities db = new EducationEverestEntities();
            foreach (Control ctrl in ph_Departments.Controls)
            {
                if (ctrl.Controls[0] is TextBox)
                {
                    TextBox txtb = (TextBox)ctrl.Controls[0];
                    string textboxID = txtb.ID;
                    if (txtb.Text != "")
                    {
                        //create new Department
                        Department newDepartment = new Department();
                        newDepartment.Department_Name = txtb.Text;
                        newDepartment.CampusID = CampusId;
                        newDepartment.Status = false;
                        db.Departments.Add(newDepartment);
                        db.SaveChanges();
                    }
                }
            }
        }

        div_placeHolder.Visible = false;
        div_Buttons.Visible = true;
        div_Gridview.Visible = true;
        div_Search.Visible = true;
        populateDepartmentsData();
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");
    }

    protected void lb_campuses_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        int universityId = db.Campuses.Where(a => a.id == CampusId).First().Uni_ID;
        Response.Redirect("campuses.aspx?uid=" + universityId);
    }
}