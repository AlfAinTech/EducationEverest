using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Personal_Details
/// </summary>
public partial class Personal_Details
{
   public string DateOfBirth
    {
        set { }
        get
        {
           if(DOB != null)
            {
               return this.DOB.Value.ToString("dd-mm-yyyy", CultureInfo.InvariantCulture);
            }
           else
            {
                return "";
            }
        }
    }
}