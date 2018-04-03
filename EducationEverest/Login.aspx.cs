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
            EducationEverestEntities db = new EducationEverestEntities();
            if(user != null && db.UserActivations.Any(a => a.UserId == user.Id)) {
                FailureText.Text = "Please Activate your account first.";
                ErrorMessage.Visible = true;
    
            }
            else if (user != null)
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
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }
            
        }
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/Register.aspx");
    }
    //webmethod for facebook login
    [System.Web.Services.WebMethod]
    public static Array loginUsingFB(string fbfirstname, string fblastname, string fbemail)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        string fbfirstname_ = fbfirstname;
        string fblastname_ = fblastname;
        string fbemail_ = fbemail;
        if (!db.AspNetUsers.Any(a => a.Email == fbemail_ || a.UserName == fbemail_))
        {
            var manager = new UserManager();
            var user = new ApplicationUser() { UserName = fbemail_ };
            IdentityResult result = manager.Create(user);
            if (result.Succeeded)
            {
                AspNetUser anu = new AspNetUser();
                anu.UserName = fbemail_;


                UserProfile up = new UserProfile();
                up.FirstName = fbfirstname;
                up.LastName = fblastname;
                up.Email = fbemail_;
                up.AspNetUserID = user.Id;
                db.UserProfiles.Add(up);
                db.SaveChanges();


               

            }

        }
        else
        {
            //Console.WriteLine("email already registered");

        }
        //redirect to dashboard

       // HttpContext.Current.Response.Redirect("Dashboard.aspx");

        string[] array = new string[3];
        array[0] = fbfirstname_;
        array[1] = fblastname_;
        array[2] = fbemail_;
        return array;

        
        
    }


    //webmethod for Google Plus login
    [System.Web.Services.WebMethod]
    public static Array loginUsingGP(string gpfirstname, string gplastname, string gpemail)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        string gpfirstname_ = gpfirstname;
        string gplastname_ = gplastname;
        string gpemail_ = gpemail;
        if (!db.AspNetUsers.Any(a => a.Email == gpemail_ || a.UserName == gpemail_))
        {
            var manager = new UserManager();
            var user = new ApplicationUser() { UserName = gpemail_ };
            IdentityResult result = manager.Create(user);
            if (result.Succeeded)
            {
                AspNetUser anu = new AspNetUser();
                anu.UserName = gpemail_;


                UserProfile up = new UserProfile();
                up.FirstName = gpfirstname;
                up.LastName = gplastname;
                up.Email = gpemail;
                up.AspNetUserID = user.Id;
                db.UserProfiles.Add(up);
                db.SaveChanges();

                IdentityHelper.SignIn(manager, user, false);

            }

        }
        else
        {
            var manager = new UserManager();

            AspNetUser currentUser = db.AspNetUsers.Where(a => a.UserName == gpemail_).First();

            ApplicationUser user = manager.FindById(currentUser.Id);

            IdentityHelper.SignIn(manager, user, false);


        }




        //HttpContext.Current.Response.Redirect("Dashboard.aspx");





        string[] array = new string[3];
        array[0] = gpfirstname_;
        array[1] = gplastname_;
        array[2] = gpemail_;
        return array;





    }
   
                    
                
            
}