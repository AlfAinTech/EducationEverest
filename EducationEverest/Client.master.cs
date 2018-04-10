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

        populateNotifications();
    }
    protected void populateNotifications()
    {
        
        if(db.SystemNotifications.Any(a => a.User_ID == current_user && a.Read==false))
        {
            List<SystemNotification> notifications = db.SystemNotifications.Where(a => a.User_ID == current_user && a.Read==false).OrderByDescending(x => x.DateTime).ToList();
            lbl_Totalnotification.Text = notifications.Count(a => a.Read == false).ToString();
            rptr_Notifications.DataSource = notifications;
            rptr_Notifications.DataBind();
        }
        else
        {
            div_notfxnBell.Style.Add("display", "none");
            //no notification for you
            div_noNotification.Style.Add("display", "block");
        }
        
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
        }else
        {
            imgExcPersonalDetails.Visible = true;
        }
        if (Request.QueryString["NA"] != null && Request.QueryString["NA"]=="true")
        {
            imgTickChoices.Visible = false;
        }
        else
        {
            imgTickChoices.Visible = false;
            if (db.MakeChoices.Any(a => a.User_ID == current_user))
            {
                int universityID = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).First().Uni_ID;
                if (db.MakeChoices.Any(q => q.User_ID == current_user && q.Uni_ID == universityID))
                {
                    imgTickChoices.Visible = true;
                }
                else
                {
                    imgExcChoices.Visible = true;
                }
            }
        }
        if (db.Matriculation_Education.Any(q => q.User_ID == current_user) && db.Intermediate_Education.Any(q => q.User_ID == current_user))
        {
            imgTickEducationDetails.Visible = true;
        }
        else
        {
            imgExcEducationDetails.Visible = true;
        }
        if(db.Test_Results.Where(q=>q.User_ID == current_user).Count() == db.MakeChoices.Where(q=>q.User_ID==current_user).GroupBy(q=>q.Uni_ID).Count() && (db.Test_Results.Where(q => q.User_ID == current_user).Count() >0))
        {
            imgTickTestResults.Visible = true;
        }
        else
        {
            imgExcTestResults.Visible = true;
        }
        if(db.Documents.Any(q=>q.userID == current_user))
        {
            if (Request.QueryString["NA"] != null && Request.QueryString["NA"] == "true")
            {
                imgTickDocuments.Visible = false;
            }
            else
            {
                if (db.MakeChoices.Any(a => a.User_ID == current_user))
                {
                    int universityID = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).First().Uni_ID;
                    List<Document> documents = db.Documents.Where(a => a.userID == current_user).ToList();
                    int staticDocsCount = documents.Count() - documents.Where(a => a.TestResult_Document.Any()).Count();
                    if (documents.Any(a => a.TestResult_Document.Any(x => x.UniID == universityID)) && staticDocsCount >= EEUtil.totalStaticDocumentFields)
                    {
                        imgTickDocuments.Visible = true;
                    }
                    else
                    {
                        imgExcDocuments.Visible = true;
                    }
                }
                
            }
        }
        else
        {
            imgExcDocuments.Visible = true;
        }
        List<int> appids = db.Applications.Where(q => q.UserID == current_user).Select(q => q.id).ToList();
        if(db.Payments.Where(q=>appids.Contains(q.ApplicationID)).Count() == appids.Count() && (db.Payments.Where(q => appids.Contains(q.ApplicationID)).Count() > 0))
        {
            imgTickPayments.Visible = true;
        }
        else
        {
            imgExcPayments.Visible = true;
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


    protected void rptr_Notifications_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem is SystemNotification)
        {
            SystemNotification currentNotification = (SystemNotification) e.Item.DataItem;
            Image notificationImage = e.Item.FindControl("img_notfxn") as Image;
            if(currentNotification.Type == "Admin")
            {
                notificationImage.ImageUrl = "/images/admin_icon.png";
            }
            else if(currentNotification.Type == "Payment")
            {
                notificationImage.ImageUrl = "/images/notifi_payment_icon.png";
            }
            else if(currentNotification.Type == "Application")
            {
                notificationImage.ImageUrl = "/images/application_icon.png";
            }

            //change class if its unread
            Image readImage = e.Item.FindControl("img_Circle") as Image;
            if ((bool)currentNotification.Read)
            {
                readImage.Style.Add("display", "none");
            }
            else
            {
                readImage.Style.Add("display", "block");
            }
            Label lblTime = e.Item.FindControl("lbl_Time") as Label;
            lblTime.Text = currentNotification.DateTime.Value.ToString("d MMM yyyy HH:MM tt");
            if(currentNotification.DateTime.Value.Date == DateTime.Today.Date)
            {
                lblTime.Text = "Today"+currentNotification.DateTime.Value.ToString(" HH:MM tt");
            }
        }
    }

    protected void btn_notfxn_Click(object sender, EventArgs e)
    {
        int notificationID = Convert.ToInt32(hf1.Value);
        if(db.SystemNotifications.Any(a =>a.id == notificationID))
        {
            SystemNotification thisNotification = db.SystemNotifications.Where(a => a.id == notificationID).First();
            thisNotification.Read = true;
            db.SaveChanges();
            populateNotifications();
        }
    }
}
