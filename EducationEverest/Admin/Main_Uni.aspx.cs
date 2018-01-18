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
        var q = from University in db.Universities
                select University;
        GridView1.DataSource = q.ToList();
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
        int count = (from University in db.Universities select University.id).Count();

        if (count == 0)
        {
            Session["value"] = 1;
            Response.Redirect("Universities.aspx");
        }
        else
        {
            var max_id = db.Universities.OrderByDescending(i => i.id).FirstOrDefault();
            int Id = Convert.ToInt32(max_id.id) + 1;
            Session["value"] = Id;
            Response.Redirect("Universities.aspx");
        }
    }


    protected void MyID_Click(object sender, CommandEventArgs e)
    {
        if(e.CommandName == "MyID")
        {
            Session["value"] = e.CommandArgument;
            Response.Redirect("Universities.aspx");
        }

    }






    }


