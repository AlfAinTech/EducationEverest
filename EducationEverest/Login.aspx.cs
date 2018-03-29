using EducationEverest;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;




public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("Dashboard.aspx");

        //Session["username"] = Email.Text;
    }
    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {
            
            // Validate the user password
            var manager = new UserManager();
            ApplicationUser user = manager.Find(Email.Text, Password.Text);
            if (user != null)
            {
                
                IdentityHelper.SignIn(manager, user, false);
                if (Request.QueryString["ReturnUrl"] != null)
                {
                    IdentityHelper.RedirectToReturnUrl("~/Dashboard.aspx?ReturnUrl=" + Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    IdentityHelper.RedirectToReturnUrl("~/Dashboard.aspx", Response);
                }
                    
                
            }
            else
            {
                //FailureText.Text = "Invalid username or password.";
                //ErrorMessage.Visible = true;

                div_Alert.Style.Add("visibility", "visible");
            }
            
        }
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/Register.aspx");
    }
}