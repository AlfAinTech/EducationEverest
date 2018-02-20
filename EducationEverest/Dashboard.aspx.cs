using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Dashboard : System.Web.UI.Page
{
    // public static string current_user = HttpContext.Current.User.Identity.GetUserId(); 
    // public static string current_user = "b7f8e747-9167-4340-8c23-b914eda6d11f";
    string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void btnFileAdmission_Click(object sender, EventArgs e)
    {
        Response.Redirect("Personal_Detail.aspx");
    }
}