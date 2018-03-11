using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using EducationEverest;

using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.IO;



public partial class Account_Register : Page
{
    EducationEverestEntities db = new EducationEverestEntities();


    protected void CreateUser_Click(object sender, EventArgs e)

    {
        string userId;



        if (CheckBox1.Checked == true)
        {
            if (db.UserProfiles.Any(o => o.Email == Email.Text))  //check duplicate ID
            {
                lblDuplicateID.Visible = true;
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' This Email ID is already registered, Please choose different Emaild ID ');", true);
            }
            else
            {

                var manager = new UserManager();
                var user = new ApplicationUser() { UserName = Email.Text };
                IdentityResult result = manager.Create(user, password.Text);
                if (result.Succeeded)
                {

                    UserProfile up = new UserProfile();


                    up.AspNetUserID = user.Id;
                    userId = up.AspNetUserID;

                    
                    SendActivationEmail(userId);

                    
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' Email sent ');", true);
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        else
        {
            lblCheckBox.Visible = true;
        }
    }
    private void SendActivationEmail(string userId)
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        string activationCode = Guid.NewGuid().ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    //cmd.Parameters.AddWithValue("@AspNetUserID", AspNetUserID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    //insert profile
                    UserProfile up = new UserProfile();
                    up.FirstName = fName.Text;
                    up.LastName = lName.Text;
                    up.Phone = phone.Text;
                    up.City = city.Text;
                    up.AspNetUserID = userId;
                    up.Email = Email.Text;
                    db.UserProfiles.Add(up);
                    db.SaveChanges();
                    con.Close();
                }
            }
        }

        using (MailMessage mm = new MailMessage("www.hahisb@gmail.com", Email.Text))  //here ID changed 02-feb-18
        {
            mm.Subject = "Account Activation";
            string body = "Hello " + Email.Text.Trim() + ",";
            body += "<br /><br />Please click the following link to activate your account";
            body += "<br /><a href = '" + "http://localhost:65465/Account/CS_Activation.aspx?ActivationCode=" + activationCode + "'>Click here to activate your account.</a>";
            body += "<br /><br />Thanks";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("www.hahisb@gmail.com", "EducationEverest"); // here ID and password changed 02-feb-18
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }

    //Label1.Visible = true;
   // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Confirmation Link has been sent to your Emaild ID')", true);

                //IdentityHelper.SignIn(manager, user, isPersistent: false);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            
            
        
      }

    
   
       
    


    
