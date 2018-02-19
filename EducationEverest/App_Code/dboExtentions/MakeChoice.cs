using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MakeChoice
/// </summary>
public partial class MakeChoice
{
   string departmentName
    {
        get
        {
            //EducationEverestEntities db = new EducationEverestEntities();
            return this.Department.Department_Name;
        }
        set { }
    }
    string campusName
    {
        get
        {
            //EducationEverestEntities db = new EducationEverestEntities();
            return this.Campus.Campus_Name;
        }
        set { }
    }
    string catagory
    {
        get
        {
            //EducationEverestEntities db = new EducationEverestEntities();
            return this.ProgrammCategory.Category.Category_Name;
        }
        set { }
    }
}