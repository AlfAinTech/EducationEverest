using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Programs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["Programs"] == null)
        {
            ViewState["Programs"] = 10;
        }
        if (!Page.IsPostBack)
        {
            populateProgramsData();
        }
        populateProgramTextboxes();
    }

    protected void populateProgramsData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }

        GridView1.DataSource = db.Programms.Where(a => a.Department_ID == DepartmentId).ToList();
        GridView1.DataBind();
    }

    protected void populateProgramTextboxes()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        ph_Programs.Controls.Clear();
        int departmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            departmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        if (departmentId != 0)
        {
            int program_textboxes = Convert.ToInt32(ViewState["Programs"]);
            for (int i = 0; i < program_textboxes; i++)
            {
                HtmlGenericControl NewControl = new HtmlGenericControl("div");
                NewControl.Attributes.Add("class", "col-md-12");

                TextBox MyTextBox = new TextBox();
                //np = new program

                MyTextBox.ID = "np" + i.ToString();
                MyTextBox.Text = string.Empty;
                MyTextBox.Attributes.Add("placeholder", "Enter Program Name " + (i + 1));
                MyTextBox.Attributes.Add("style", "margin-bottom:5px");
                MyTextBox.Attributes.Add("class", "form-control");
                MyTextBox.Attributes.Add("runat", "server");


                NewControl.Controls.Add(MyTextBox);
                ph_Programs.Controls.Add(NewControl);
            }
        }
    }

    protected void btn_newProgram_Click(object sender, EventArgs e)
    {
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        Response.Redirect("ProgramsPage.aspx?did="+DepartmentId);
    }

    protected void btn_bulkPrograms_Click(object sender, EventArgs e)
    {
        div_placeHolder.Visible = true;
        div_Buttons.Visible = false;
        div_Gridview.Visible = false;
        div_Search.Visible = false;
        populateProgramTextboxes();
    }

    protected void savePrograms_Click(object sender, EventArgs e)
    {
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        if (DepartmentId != 0)
        {
            EducationEverestEntities db = new EducationEverestEntities();
            foreach (Control ctrl in ph_Programs.Controls)
            {
                if (ctrl.Controls[0] is TextBox)
                {
                    TextBox txtb = (TextBox)ctrl.Controls[0];
                    string textboxID = txtb.ID;
                    if (txtb.Text != "")
                    {
                        //create new Program
                        Programm newProgram = new Programm();
                        newProgram.Program_Name = txtb.Text;
                        newProgram.Department_ID = DepartmentId;
                        newProgram.Status = false;

                        db.Programms.Add(newProgram);
                        db.SaveChanges();
                    }
                }
            }
        }

        div_placeHolder.Visible = false;
        div_Buttons.Visible = true;
        div_Gridview.Visible = true;
        div_Search.Visible = true;
        populateProgramsData();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        EducationEverestEntities db = new EducationEverestEntities();
        var a = TextBox1.Text;
        if (a == "")
        {
            populateProgramsData();
        }
        else
        {

            var k = db.Programms.Where(x => x.Program_Name.Contains(a) && x.Department_ID == DepartmentId).ToList();
            GridView1.DataSource = k;
            GridView1.DataBind();
        }
    }

    protected void Button3_Command(object sender, CommandEventArgs e)
    {
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        if (e.CommandName == "MyProgramID")
        {
            Response.Redirect("ProgramsPage.aspx?did=" + DepartmentId + "&pid=" + e.CommandArgument);
        }
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");
    }

    protected void lb_campuses_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        int universityId = db.Departments.Where(a => a.id == DepartmentId).First().Campus.Uni_ID;
        Response.Redirect("campuses.aspx?uid=" + universityId);
    }

    protected void lb_departments_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0;
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }
        int campusId = db.Departments.Where(a => a.id == DepartmentId).First().CampusID;
        Response.Redirect("Departments.aspx?cid=" + campusId);
    }
}