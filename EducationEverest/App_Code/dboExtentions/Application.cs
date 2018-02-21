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
            if(up.ApplicationFeeSame.Value)
            {
                return int.Parse(up.ApplicationFee);
            }
            else
            {
                return int.Parse(Department.DepartmentProfiles.FirstOrDefault().ApplicationFee);
            }
            return 0;
        }
        set { }
    }
    public string Appstatus
    {
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();

            if(CurrentStatus == "0")
            {
                return "Pending";
            }
            else
            {
                if(CurrentStatus == "1")
                {
                    return "Progress";
                }
                else
                {
                    return "Confirmed";
                }
            }

        }
        set { }
    }
}