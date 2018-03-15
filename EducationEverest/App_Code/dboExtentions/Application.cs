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
    public string ApplicationDate
    {
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();
            
            return SubmittedOn.Value.ToString("dd MMM yyyy", CultureInfo.InvariantCulture);

        }
        set { }
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
                return "No payment";

        }
        set { }
    }

}