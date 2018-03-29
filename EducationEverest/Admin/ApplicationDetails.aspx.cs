using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ApplicationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!(HttpContext.Current.User.Identity.IsAuthenticated))
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
            }
            if (Request.QueryString["appID"] != null)
            {
                int applicationID = Convert.ToInt32(Request.QueryString["appID"]);
                ApplicationDetails.BindData(applicationID);
            }

        }
    }
}