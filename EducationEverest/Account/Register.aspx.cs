using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using EducationEverest;

public partial class Account_Register : Page
{
    EducationEverestEntities db = new EducationEverestEntities();


    protected void CreateUser_Click(object sender, EventArgs e)

    {
        if (CheckBox1.Checked == true)
        {

            var manager = new UserManager();
            var user = new ApplicationUser() { UserName = Email.Text };
            IdentityResult result = manager.Create(user, password.Text);
            if (result.Succeeded)
            {
                UserProfile up = new UserProfile();
                up.FirstName = fName.Text;
                up.LastName = lName.Text;
                up.Phone = phone.Text;
                up.City = city.Text;
                up.AspNetUserID = user.Id;
                db.UserProfiles.Add(up);
                db.SaveChanges();
                //Label1.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Confirmation Link has been sent to your Emaild ID')", true);

                //IdentityHelper.SignIn(manager, user, isPersistent: false);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {

                //ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
        else
        {
            lblCheckBox.Visible = true;
        }
    }
   
       
    }

    
