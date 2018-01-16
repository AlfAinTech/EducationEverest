using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
        Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect(CGMUtil.authServiceUri + "?client_id=" + CGMUtil.clientId + "&scope=" + CGMUtil.scopes + "&response_type=code" + "&redirect_uri=" + CGMUtil.redirectUri);
    }
}
