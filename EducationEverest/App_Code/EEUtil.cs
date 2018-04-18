using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EEUtil
/// </summary>
public class EEUtil
{
    public EEUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string FromEmail = "www.hahisb@gmail.com";
    public static string FromPassword = "EducationEverest";
    public static int totalStaticDocumentFields = 5;
    public static string calcDivision(int percentage)
    {
        if (percentage >= 0 && percentage <= 32)
        {
            return "Fail";
        }
        if (percentage >= 33 && percentage <= 35)
        {
            return "Third";
        }
        if (percentage >= 36 && percentage <= 59)
        {
            return "Second";
        }
        if (percentage >= 60 && percentage <= 100)
        {
            return "First";
        }
        return "none";
    }
}