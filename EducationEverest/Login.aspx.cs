using EducationEverest;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
               
                IdentityHelper.SignIn(manager, user, true);
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (Request.QueryString["ReturnUrl"] != null)
                    {
                        if (HttpContext.Current.User.IsInRole("Super Admin"))
                        {
                            IdentityHelper.RedirectToReturnUrl("~/Admin/Applications.aspx", Response);
                        }
                        else
                        {
                            if (Request.QueryString["ReturnUrl"].Contains("Admin"))
                            {
                                IdentityHelper.RedirectToReturnUrl("~/Dashboard.aspx", Response);
                            }
                            else
                            {
                                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                            }

                        }

                    }
                    else
                    {
                        if (HttpContext.Current.User.IsInRole("Super Admin"))
                        {
                            IdentityHelper.RedirectToReturnUrl("~/Admin/Applications.aspx", Response);
                        }
                        else
                        {
                            IdentityHelper.RedirectToReturnUrl("~/Dashboard.aspx", Response);
                        }
                    }
                }
                else
                {
                    FailureText.Text = "Something went wrong , please try again";
                    ErrorMessage.Visible = true;
                }
                
            }
            else
            {
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }
            
        }
    }
}