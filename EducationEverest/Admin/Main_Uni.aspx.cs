using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main_Uni : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    public void show()
    {
        var Universities = db.Universities.ToList();
        List<University> universities = db.Universities.ToList();
        foreach (var university in universities)
        {
            if (db.Campuses.Any(a => a.Uni_ID == university.id))
            {
                bool status = (bool)db.Campuses.First().Status;
                int count = db.Campuses.Select(a => a.Status).Distinct().Count();
                if (status && count == 1)
                {
                    university.Status = true;
                }
                else
                {
                    university.Status = false;
                }
                db.SaveChanges();
            }
        }
        GridView1.DataSource = Universities;
        GridView1.DataBind();
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            show();
        }

    }


    protected void Search_Click(object sender, EventArgs e)
    {
        var a = TextBox1.Text;
        if (a == "")
        {
            show();
        }
        else
        {

            var k = db.Universities.Where(x => x.Name.Contains(a)).ToList();
            GridView1.DataSource = k;
            GridView1.DataBind();
        }
    }

    protected void AddUni_Click(object sender, EventArgs e)
    {
        Response.Redirect("UniversityPage.aspx");
    }


    protected void MyID_Click(object sender, CommandEventArgs e)
    {
        if(e.CommandName == "MyID")
        {
            Response.Redirect("UniversityPage.aspx?uid=" +e.CommandArgument);
        }

    }






    }


