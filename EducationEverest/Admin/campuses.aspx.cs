using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_campuses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            populateCampusesData();
        }
    }


    protected void populateCampusesData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        List<Campus> campuses = db.Campuses.ToList();
        foreach (var campus in campuses)
        {
            if (db.Departments.Any(a => a.CampusID == campus.id))
            {
                bool status = (bool)db.Departments.Where(a => a.CampusID== campus.id).First().Status;
                int count = db.Departments.Where(a => a.CampusID == campus.id).Select(a => a.Status).Distinct().Count();
                if (status && count == 1)
                {
                    campus.Status = true;
                }
                else
                {
                    campus.Status = false;
                }
                db.SaveChanges();
            }
        }

        GridView1.DataSource = db.Campuses.Where(a => a.Uni_ID == UniversityId).ToList();
        GridView1.DataBind();

    }

    protected void Search_Click(object sender, EventArgs e)
    {
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        EducationEverestEntities db = new EducationEverestEntities();
        var a = TextBox1.Text;
        if (a == "")
        {
            populateCampusesData();
        }
        else
        {

            var k = db.Campuses.Where(x => x.Campus_Name.Contains(a) && x.Uni_ID == UniversityId).ToList();
            GridView1.DataSource = k;
            GridView1.DataBind();
        }
    }

    protected void MyID_Click(object sender, CommandEventArgs e)
    {
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        if (e.CommandName == "MyCampusID")
        {
            Response.Redirect("CampusPage.aspx?uid="+UniversityId+"&cid=" + e.CommandArgument);
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        Response.Redirect("CampusPage.aspx?uid="+ UniversityId);
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
       
            Response.Redirect("Main_Uni.aspx");
        

    }
}