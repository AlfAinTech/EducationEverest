using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payments : System.Web.UI.Page
{
    bool allPaid = true;
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
            }
            if (Request.QueryString["apps"] == null && Session["appID"] == null)
            {
                Response.Redirect("Dashboard.aspx");
            }
            current_user = HttpContext.Current.User.Identity.GetUserId();
            int newApps = 1;
            if (Request.QueryString["apps"] != null)
            {
                newApps = Convert.ToInt32(Request.QueryString["apps"]);

            }
            Guid appID = Guid.Empty;
            if (Session["appID"] != null)
            {
                appID = new Guid(Session["appID"].ToString());
            }
            if (db.Applications.Any(a => a.UserID == current_user))
            {
                if (appID != Guid.Empty)
                {
                    List<Application> applicationList = db.Applications.Where(a => a.UserID == current_user && a.appID == appID).ToList();
                    ChoicesList.DataSource = applicationList;
                    ChoicesList.DataBind();
                    totalInvoice.Text = applicationList.Select(q => q.Fees).DefaultIfEmpty(0).Sum().ToString();
                }
                else
                {
                    List<int> universityIDs = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).Take(newApps).Select(a => a.Uni_ID).ToList();
                    List<Application> applicationList = db.Applications.Where(q => q.UserID == current_user && universityIDs.Contains(q.University.id)).ToList();
                    ChoicesList.DataSource = applicationList;
                    ChoicesList.DataBind();
                    totalInvoice.Text = applicationList.Select(q => q.Fees).DefaultIfEmpty(0).Sum().ToString();
                }
                

            }
            else
            {
                ChoicesList.DataSource = null;
                ChoicesList.DataBind();
            }
            
            if (allPaid)
            {
                btn_MakeTotalPayment.Style.Add("display", "none");
            }
        }
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);

    }



    protected void SubmitTrackingID_Click(object sender, EventArgs e)
    {
        
        List<Application> apps = db.Applications.Where(q => q.UserID == current_user).ToList();
        if (TrackingID.Value != "" && !String.IsNullOrWhiteSpace(TrackingID.Value))
        {
            int firstApplicationID = 0;
            foreach (Application app in apps)
            {
                if (apps.First() == app)
                {
                    firstApplicationID = app.id;
                }
                if (!db.Payments.Any(q => q.ApplicationID == app.id))
                {
                    Payment p = new Payment()
                    {
                        TrackingID = TrackingID.Value.ToString(),
                        ApplicationID = app.id,
                    };
                    app.CurrentStatus = "In Progress";
                    db.Payments.Add(p);
                    db.SaveChanges();
                }
            }
            if (firstApplicationID != 0)
            {
                //create a notification for user
                SystemNotification newNotification = new SystemNotification();
                newNotification.User_ID = current_user;
                newNotification.AppID = firstApplicationID;
                newNotification.Read = false;
                newNotification.Type = "Payment";
                newNotification.TriggeredBy = "System";
                newNotification.DateTime = DateTime.Now;
                newNotification.Title = "Your Payment against tracking Id :" + TrackingID.Value + " is sent to Education Everest team.You'll get confirmation message soon";

                db.SystemNotifications.Add(newNotification);
                db.SaveChanges();
            }
        }

    }

    protected void continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Choices.aspx");
    }

    protected void SinglePayment_Click(object sender, EventArgs e)
    {
        if (paymentAppID.Value != "")
        {
            Application app = db.Applications.Where(q => q.id.ToString() == paymentAppID.Value).FirstOrDefault();
            if (!db.Payments.Any(q => q.ApplicationID == app.id))
            {
                Payment p = new Payment()
                {
                    TrackingID = SingleTrackingId.Value.ToString(),
                    ApplicationID = app.id,
                };
                app.CurrentStatus = "In Progress";
                db.Payments.Add(p);
                db.SaveChanges();
                //create new notification
                //create a notification for user
                SystemNotification newNotification = new SystemNotification();
                newNotification.User_ID = current_user;
                newNotification.AppID = app.id;
                newNotification.Read = false;
                newNotification.Type = "Payment";
                newNotification.TriggeredBy = "System";
                newNotification.DateTime = DateTime.Now;
                newNotification.Title = "Your Payment against tracking Id :" + p.TrackingID + " is sent to Education Everest team.You'll get confirmation message soon";

                db.SystemNotifications.Add(newNotification);
                db.SaveChanges();
                

            }
        }
        SingleTrackingId.Value = "";
        Response.Redirect(Request.RawUrl);
        }

    protected void ChoicesList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
        if (e.Item.DataItem is Application)
        {
            Application dataItem = e.Item.DataItem as Application;
            UniversityMedia um = db.UniversityMedias.Where(q => q.UniversityId == dataItem.UnivID).FirstOrDefault();
            if (um != null)
            {
                Image im = (Image)e.Item.FindControl("logo");
                im.ImageUrl = um.Path;
            }
            if(dataItem.TrackingID != null && dataItem.TrackingID != "" && dataItem.TrackingID != "No payment")
            {
                System.Web.UI.HtmlControls.HtmlButton button = e.Item.FindControl("btn_MakePayment") as System.Web.UI.HtmlControls.HtmlButton;
                button.Style.Add("display", "none");
            }
            else
            {
                allPaid = false;
            }

        }
        
    }

    
}