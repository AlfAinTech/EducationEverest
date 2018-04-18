using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Application
/// </summary>
public partial class Application
{
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    public string ApplicationDate
    {
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();

            return SubmittedOn.Value.ToString("dd MMM yyyy", CultureInfo.InvariantCulture);

        }
        set { }
    }
    public string CurrentStatus_
    {

        set { }
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();
            
            Application apps = db.Applications.Where(q => q.id == id).FirstOrDefault();
            if(apps.CurrentStatus.ToLower() == "pending" && apps.University.UniversityProfiles.FirstOrDefault().LastDate < System.DateTime.Now)
            {
                apps.CurrentStatus = "rejected";
                db.SaveChanges();
                //create a notification for user
                SystemNotification newNotification = new SystemNotification();
                newNotification.User_ID = current_user;
                newNotification.AppID = apps.id;
                newNotification.Read = false;
                newNotification.Type = "Application";
                newNotification.TriggeredBy = "System";
                newNotification.DateTime = DateTime.Now;
                newNotification.Title = "Your Application with Application ID : " + apps.appID + " is rejected because deadline is passed";

                db.SystemNotifications.Add(newNotification);
                db.SaveChanges();
            }
            return apps.CurrentStatus;
        }
    }
    public int Fees
    {
        get {
            EducationEverestEntities db = new EducationEverestEntities();
           UniversityProfile up = db.UniversityProfiles.Where(q => q.UniversityID == UnivID).FirstOrDefault();
            if(up.ApplicationFeeSame != null && up.ApplicationFeeSame.Value)
            {
                if (up.ApplicationFee != null && up.ApplicationFee != "")
                {
                    return int.Parse(up.ApplicationFee);
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                if(Department != null)
                {
                    if (Department.DepartmentProfiles.FirstOrDefault().ApplicationFee != null && Department.DepartmentProfiles.FirstOrDefault().ApplicationFee != "")
                    {
                        return int.Parse(Department.DepartmentProfiles.FirstOrDefault().ApplicationFee);
                    }
                    else
                    {
                        return 0;
                    }
                }
                    
            }
            return 0;
        }
        set { }
    }

    public string TrackingID
    {
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();
            
            Payment payment = db.Payments.Where(q => q.ApplicationID == this.id).FirstOrDefault();
            if (payment != null && payment.TrackingID != null)
                return payment.TrackingID;
            else
                return "No Tracking Id";

        }
        set { }
    }

    public string CandidateID
    {
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();

            UserProfile userProfile = db.UserProfiles.Where(a => a.AspNetUserID == this.UserID).FirstOrDefault();
            if (userProfile != null)
            {
                return userProfile.CandidateID;
            }
            else
                return "CandidateID missing";

        }
        set { }
    }

}