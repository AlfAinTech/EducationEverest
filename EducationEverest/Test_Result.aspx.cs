using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.UI.HtmlControls;

public partial class Test_Result : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();




    public void panels()
    {
        List<int> Univ =   db.MakeChoices.Where(a=>a.User_ID == current_user).Select(a => a.Uni_ID).ToList();

        Repeater1.DataSource = db.UniversityProfiles.Where(q => Univ.Contains(q.UniversityID)).ToList();
        Repeater1.DataBind();
        //getting recent make choice 'stest
        if ((Request.QueryString["NA"] != null) && (Request.QueryString["NA"] == "true"))
        {
            Repeater1.DataSource = null;
            Repeater1.DataBind();
        }
        else
        {
            int newApps = 1;
            if (Request.QueryString["apps"] != null && Request.QueryString["apps"] != "null")
            {
                newApps = Convert.ToInt32(Request.QueryString["apps"]);
            }
            Guid appID = Guid.Empty;
            if (Request.QueryString["appID"] != null)
            {
                appID = new Guid(Request.QueryString["appID"].ToString());
            }
            if (db.MakeChoices.Any(a => a.User_ID == current_user))
            {
                if (appID != Guid.Empty)
                {
                    //get a university id based on appID 
                    int UniversityID = (int) db.Applications.Where(a => a.UserID == current_user && a.appID == appID).First().UnivID;
                    Repeater1.DataSource = db.UniversityProfiles.Where(a => a.UniversityID == UniversityID).ToList();
                    Repeater1.DataBind();
                }
                else
                {
                    List<int> universityIDs = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).Take(newApps).Select(a => a.Uni_ID).ToList();
                    Repeater1.DataSource = db.UniversityProfiles.Where(q => universityIDs.Contains(q.University.id)).ToList();
                    Repeater1.DataBind();
                }
            }else
            {
                Repeater1.DataSource = null;
                Repeater1.DataBind();
            }
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        if (Request.QueryString["apps"] == null && Session["appID"] == null)
        {
            Response.Redirect("Dashboard.aspx");
        }
        if (!IsPostBack)
        {
            panels();
            populate_panels();
        }
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
    }


    public void populate_panels()
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label label = item.FindControl("Label12") as Label;

            //DropDownList board = ((DropDownList)item.FindControl("select_board"));
            TextBox roll_no = item.FindControl("roll_number") as TextBox;
            DropDownList passing_year = item.FindControl("year_of_passing") as DropDownList;
            TextBox total_marks = item.FindControl("total_marks") as TextBox;
            TextBox obtained_marks = item.FindControl("obtained_marks") as TextBox;
            HtmlInputText percentage = item.FindControl("percentage") as HtmlInputText;
            TextBox division = item.FindControl("division") as TextBox;

            if (db.Test_Results.Any(x => x.User_ID == current_user && x.Test_Name == label.Text))
            {
                var p = db.Test_Results.Single(x => x.User_ID == current_user && x.Test_Name == label.Text);
               // board.SelectedValue = p.Board;
                roll_no.Text = p.Rollno;
                //passing_year.Text = p.Passing_Year;
                passing_year.SelectedValue = p.Passing_Year;
                total_marks.Text = p.Total_Marks;
                obtained_marks.Text = p.Obtained_Marks;
                
                percentage.Value = p.Percentage;
                division.Text = p.Division;
            }
            //image of caution and success
            if (db.Test_Results.Any(a => (a.User_ID == current_user && a.Test_Name == label.Text) && (a.Rollno == null || a.Passing_Year == null || a.Total_Marks == null || a.Obtained_Marks == null || a.Percentage == null || a.Division == null)))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "showCaution();", true);
            }
            else if (db.Test_Results.Any(a => a.User_ID == current_user && a.Test_Name == label.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "showSuccess();", true);
            }
        }

     }

    protected void save_click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label label = item.FindControl("Label12") as Label;

            //DropDownList board = ((DropDownList)item.FindControl("select_board"));
            TextBox roll_no = item.FindControl("roll_number") as TextBox;
            DropDownList passing_year = item.FindControl("year_of_passing") as DropDownList;
            TextBox total_marks = item.FindControl("total_marks") as TextBox;
            TextBox obtained_marks = item.FindControl("obtained_marks") as TextBox;
            HtmlInputText percentage = item.FindControl("percentage") as HtmlInputText;
            TextBox division = item.FindControl("division") as TextBox;

            if (db.Test_Results.Any(x => x.User_ID == current_user && x.Test_Name == label.Text))
            {
                var p = db.Test_Results.Single(x => x.User_ID == current_user && x.Test_Name == label.Text);
               // p.Board = board.SelectedValue;
                p.Rollno = roll_no.Text;
                p.Passing_Year = passing_year.SelectedValue;
                p.Total_Marks = total_marks.Text;
                p.Obtained_Marks = obtained_marks.Text;
                p.Percentage = percentage.Value;
                p.Division = division.Text;

                db.SaveChanges();
            }

            else
            {
                Test_Results test_result = new Test_Results
                {
                    User_ID = current_user,
                    Test_Name = label.Text,
                    //Board = board.SelectedValue,
                    Rollno = roll_no.Text,
                    Passing_Year = passing_year.SelectedValue,
                    Total_Marks = total_marks.Text,
                    Obtained_Marks = obtained_marks.Text,
                    Percentage = percentage.Value,
                    Division = division.Text
                };

                db.Test_Results.Add(test_result);
                db.SaveChanges();
            }
        }

        HtmlImage imgpd = Master.FindControl("imgTickTestResults") as HtmlImage;


        if (imgpd != null)

        {

            imgpd.Visible = true;
            Session["IMGTR"] = "imgtr";

        }



        //button next click from Test Results to Document
        if (Request.QueryString["apps"] != null)
        {
            Response.Redirect("Upload_Documents.aspx?apps=" + Request.QueryString["apps"].ToString());
        }
        
        else
        {
            Response.Redirect("Upload_Documents.aspx");
        }


    }





    
}