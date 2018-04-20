using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payments : System.Web.UI.Page
{
    bool allPaid = true;
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
            }

            
            if (Session["appIDS"] == null)
            {
                Response.Redirect("Dashboard.aspx");
            }
            current_user = HttpContext.Current.User.Identity.GetUserId();
        }

    }



    

    protected void continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Choices.aspx");
    }

    

    

    
}