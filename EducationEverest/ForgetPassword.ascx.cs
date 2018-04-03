using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!(HttpContext.Current.User.Identity.IsAuthenticated))
        //{
        //    Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        //}

        //status.Visible = false;
    }

    protected string send_mail(string currentuser_id)
    {
        try
        {
            EducationEverestEntities db = new EducationEverestEntities();
            AspNetUser dup = db.AspNetUsers.Where(q => q.Id == currentuser_id).First();
            string Body = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/EmailContent.html"));
            Body = Body.Replace("{title}", "Reset your password");
            Body = Body.Replace("{fullName}", dup.UserProfiles.First().FirstName + " " + dup.UserProfiles.First().LastName);
            Body = Body.Replace("{body}", "Click below link to reset your password");
            Body = Body.Replace("{ButtonText}", "" + "Reset Password");
            Body = Body.Replace("{href}", "" + "http://" + Request.Url.Authority + "/ResetPassword.aspx?idPasswordReset=" + currentuser_id + "");

            
            
            
            
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(dup.UserName);
            mailMessage.From = new MailAddress(EEUtil.FromEmail);
            mailMessage.Subject = "Reset your password";
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = Body;
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential(EEUtil.FromEmail, EEUtil.FromPassword);
            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            ServicePointManager.ServerCertificateValidationCallback =
         delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
            smtpClient.Send(mailMessage);
            return "Email sent! Sign in to your Email account and click on Reset Password";
        }
        catch (Exception ex)
        {
            Response.Write("Could not send the e-mail - error: " + ex.Message);
            return ex.Message;
        }
    }

    protected void send_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        var user = db.AspNetUsers.Where(q => q.UserName == Email.Text);
        if (user.Count() != 0)
        {
            AspNetUser required_user = (AspNetUser)user.First();
            ShowResult(send_mail(required_user.Id));
        }
        else
        {
            ShowResult("Email not Exist");
        }


    }
    protected void ShowResult(String message)
    {
        status.Visible = true;
        status_text.Text = message;
        if (message == "Email sent! Sign in to your Email account and click on Reset Password")
        {
            status_text.ForeColor = System.Drawing.Color.ForestGreen;
            forget_panel.Visible = false;
        }
    }
    protected void btn_register_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}