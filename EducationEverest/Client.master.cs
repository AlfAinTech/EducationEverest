using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Client : System.Web.UI.MasterPage
{
    EducationEverestEntities db = new EducationEverestEntities();
     public static string current_user = HttpContext.Current.User.Identity.GetUserId(); 
    // public static string current_user = "b7f8e747-9167-4340-8c23-b914eda6d11f";
    protected void Page_Load(object sender, EventArgs e)
    {
        current_user = HttpContext.Current.User.Identity.GetUserId();

        if (Session["IMGPD"] != null)
        {
            imgTickPersonalDetails.Visible = true;
        }
        if (Session["IMGC"] != null)
        {
            imgTickChoices.Visible = true;
        }
        if (Session["IMGED"] != null)
        {
            imgTickEducationDetails.Visible = true;
        }
        if (Session["IMGTR"] != null)
        {
            imgTickTestResults.Visible = true;
        }
        if (Session["IMGUD"] != null)
        {
            imgTickDocuments.Visible = true;
        }


        //if (Request.QueryString["imgpd"] != null && Request.QueryString["imgpd"] != string.Empty)
        //{
        //    imgTickPersonalDetails.Visible = true;


        //}
        //if( current_user==null)
        //{
        //    Response.Redirect("Login.aspx");
        //}
        UserProfile up = new UserProfile();

        //code to show user information
        var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { em = q.Email, fn = q.FirstName, ln = q.LastName, c = q.City, p = q.Phone }).FirstOrDefault();
        //show user first name
        if(logged !=null)
            lblLoggedUser.Text = logged.fn;
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
        Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search_Results.aspx");
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search_Results.aspx?searchBox=" + TextBox1.Text);
    }

    }
