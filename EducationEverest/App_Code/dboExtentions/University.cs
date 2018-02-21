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
            DateTime date = db.UniversityProfiles.Where(q => q.UniversityID == this.id).FirstOrDefault().LastDate.Value;
            return date.ToString("dd MMM yyyy", CultureInfo.InvariantCulture);

        }
        set { }
    }
    
}