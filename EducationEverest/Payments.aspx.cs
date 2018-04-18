﻿using Microsoft.AspNet.Identity;
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

            
            if (Session["appIDS"] == null)
            {
                Response.Redirect("Dashboard.aspx");
            }
            current_user = HttpContext.Current.User.Identity.GetUserId();
            if (Session["appIDS"] != null)
            {
                List<int> applicationIDS = (List<int>)Session["appIDS"];
                List<Application> applications = db.Applications.Where(a => applicationIDS.Contains(a.id)).ToList();
                ChoicesList.DataSource = applications;
                ChoicesList.DataBind();
                totalInvoice.Text = applications.Select(q => q.Fees).DefaultIfEmpty(0).Sum().ToString();
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

        if (Session["appIDS"] != null)
        {
            List<int> applicationIDS = (List<int>)Session["appIDS"];
            List<Application> applications = db.Applications.Where(a => applicationIDS.Contains(a.id)).ToList();
            if (TrackingID.Value != "" && !String.IsNullOrWhiteSpace(TrackingID.Value))
            {
                foreach (Application app in applications)
                {
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
                        //create a notification for user
                        SystemNotification newNotification = new SystemNotification();
                        newNotification.User_ID = current_user;
                        newNotification.AppID = app.id;
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
            TrackingID.Value = "";
            Response.Redirect(Request.RawUrl);
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
            if(dataItem.TrackingID != null && dataItem.TrackingID != "" && dataItem.TrackingID != "No Tracking Id")
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