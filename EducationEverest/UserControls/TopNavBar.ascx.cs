using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_TopNavBar : System.Web.UI.UserControl
{
    EducationEverestEntities db = new EducationEverestEntities();
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
        current_user = HttpContext.Current.User.Identity.GetUserId();
        UserProfile up = new UserProfile();

        //code to show user information
        var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { em = q.Email, fn = q.FirstName, ln = q.LastName, c = q.City, p = q.Phone }).FirstOrDefault();
        //show user first name
        if (logged != null)
            lblLoggedUser.Text = logged.fn;

        populateNotifications();
        if (!IsPostBack)
        {
            if (Request.QueryString["searchBox"] != null)
            {
                TextBox1.Text = Request.QueryString["searchBox"].ToString();
            }
        }
    }
    protected void populateNotifications()
    {

        if (db.SystemNotifications.Any(a => a.User_ID == current_user && a.Read == false))
        {
            List<SystemNotification> notifications = db.SystemNotifications.Where(a => a.User_ID == current_user && a.Read == false).OrderByDescending(x => x.DateTime).ToList();
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
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Response.Redirect("Filter_Results.aspx?searchBox=" + TextBox1.Text);
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Filter_Results.aspx?searchBox=" + TextBox1.Text);
    }
    protected void btn_notfxn_Click(object sender, EventArgs e)
    {
        int notificationID = Convert.ToInt32(hf1.Value);
        if (db.SystemNotifications.Any(a => a.id == notificationID))
        {
            SystemNotification thisNotification = db.SystemNotifications.Where(a => a.id == notificationID).First();
            thisNotification.Read = true;
            db.SaveChanges();
            populateNotifications();
        }
    }
    protected void rptr_Notifications_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem is SystemNotification)
        {
            SystemNotification currentNotification = (SystemNotification)e.Item.DataItem;
            Image notificationImage = e.Item.FindControl("img_notfxn") as Image;
            if (currentNotification.Type == "Admin")
            {
                notificationImage.ImageUrl = "/images/admin_icon.png";
            }
            else if (currentNotification.Type == "Payment")
            {
                notificationImage.ImageUrl = "/images/notifi_payment_icon.png";
            }
            else if (currentNotification.Type == "Application")
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
            if (currentNotification.DateTime.Value.Date == DateTime.Today.Date)
            {
                lblTime.Text = "Today" + currentNotification.DateTime.Value.ToString(" HH:MM tt");
            }
        }
    }
}