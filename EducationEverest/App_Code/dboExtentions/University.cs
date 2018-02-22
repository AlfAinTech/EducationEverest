using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for University
/// </summary>
public partial class University
{
    public string deadLine
    {
        get
        {
            EducationEverestEntities db = new EducationEverestEntities();
            UniversityProfile up = db.UniversityProfiles.Where(q => q.UniversityID == this.id).FirstOrDefault();
            if (up.LastDate != null)
                return up.LastDate.Value.ToString("dd MMM yyyy", CultureInfo.InvariantCulture);
            else
                return "No last date";

        }
        set { }
    }
    
}