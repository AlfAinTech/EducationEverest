using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Test_Results
/// </summary>
public partial class Test_Results
{
   public decimal Aggregate
    {
        set { }
        get
        {
            decimal PercentageInter = 70;
            decimal PercentageTest = 30;
            EducationEverestEntities db = new EducationEverestEntities();
            Intermediate_Education ie = db.Intermediate_Education.Where(q => q.User_ID == User_ID).FirstOrDefault();
            decimal aggregate = (ie.Obtained_Marks == null ? 0 : decimal.Parse(ie.Obtained_Marks)) / (ie.Total_Marks == null ? 0 : decimal.Parse(ie.Total_Marks)) * PercentageInter;
            aggregate += (ie.Obtained_Marks == null ? 0 : decimal.Parse(Obtained_Marks)) / (Total_Marks == null ? 0 : decimal.Parse(Total_Marks)) * PercentageTest;
            return  decimal.Round(aggregate,2);
        }
    }
}