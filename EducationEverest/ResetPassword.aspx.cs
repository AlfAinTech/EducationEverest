﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using EducationEverest;
using System.Web.Security;
//using System;
//using System.Collections.Generic;
//using System.Linq;


public partial class ResetPassword : System.Web.UI.Page
{
    //string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SetPassword_Click(object sender, EventArgs e)
    {
        string verificationID = Request.QueryString["idPasswordReset"];
        var manager = new UserManager();
        EducationEverestEntities db = new EducationEverestEntities();
        AspNetUser user = db.AspNetUsers.Where(q => q.Id == verificationID).First();
        if (user != null)

        {

            ApplicationUser userpassword = manager.Find(user.UserName, txtPassword.Text);//if same password, then show message 
            if (userpassword == null)
            {

                //AspNetUser current_user = (AspNetUser)user.First();
                ApplicationUser app_user = manager.FindById(user.Id);
                //app_user
                user.PasswordHash = manager.PasswordHasher.HashPassword(txtPassword.Text);
                db.SaveChanges();
                //IdentityHelper.SignIn(manager, app_user, isPersistent: false);
                Response.Redirect("Login.aspx");
                //lblSuccess.Visible = true;
            }
            else
            {
                lblsamepassword.Visible = true;
            }
        }
        //UserManager manager = new UserManager();
        //IdentityResult result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);

        //if (result.Succeeded)
        //{
        //    var user = manager.FindById(User.Identity.GetUserId());
        //    IdentityHelper.SignIn(manager, user, isPersistent: false);
        //    Response.Redirect("~/Account/Manage?m=ChangePwdSuccess");
        //}
        else
        {
            lblFailure.Visible = true;
            // AddErrors(result);
        }

    }
}