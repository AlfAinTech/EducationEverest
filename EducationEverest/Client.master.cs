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
        CompletionCheck();
        //if (Session["IMGPD"] != null)
        //{
        //    imgTickPersonalDetails.Visible = true;
        //}
        //if (Session["IMGC"] != null)
        //{
        //    imgTickChoices.Visible = true;
        //}
        //if (Session["IMGED"] != null)
        //{
        //    imgTickEducationDetails.Visible = true;
        //}
        //if (Session["IMGTR"] != null)
        //{
        //    imgTickTestResults.Visible = true;
        //}
        //if (Session["IMGUD"] != null)
        //{
        //    imgTickDocuments.Visible = true;
        //}


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

    protected void CompletionCheck()
    {
        if (db.Personal_Details.Any(q => q.User_ID == current_user))
        {
            imgTickPersonalDetails.Visible = true;
        }
        if (db.MakeChoices.Any(q => q.User_ID == current_user))
        {
            imgTickChoices.Visible = true;
        }
        if (db.Matriculation_Education.Any(q => q.User_ID == current_user) && db.Intermediate_Education.Any(q => q.User_ID == current_user))
        {
            imgTickEducationDetails.Visible = true;
        }
        if(db.Test_Results.Where(q=>q.User_ID == current_user).Count() == db.MakeChoices.Where(q=>q.User_ID==current_user).GroupBy(q=>q.Uni_ID).Count() && (db.Test_Results.Where(q => q.User_ID == current_user).Count() >0))
        {
            imgTickTestResults.Visible = true;
        }
        if(db.Documents.Any(q=>q.userID == current_user))
        {
            imgTickDocuments.Visible = true;
        }
        List<int> appids = db.Applications.Where(q => q.UserID == current_user).Select(q => q.id).ToList();
        if(db.Payments.Where(q=>appids.Contains(q.ApplicationID)).Count() == appids.Count() && (db.Payments.Where(q => appids.Contains(q.ApplicationID)).Count() > 0))
        {
            imgTickPayments.Visible = true;
        } 
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Response.Redirect("Filter_Results.aspx");
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search_Results.aspx?searchBox=" + TextBox1.Text);
    }

    }
