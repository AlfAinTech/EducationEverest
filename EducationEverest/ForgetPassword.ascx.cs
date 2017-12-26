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
        status.Visible = false;
    }

    protected string send_mail(string currentuser_id)
    {
        try
        {
            string Body = System.IO.File.ReadAllText(Server.MapPath("~/PasswordRecovery.html"));
            Body = Body.Replace("{DynamicContent}", "https://www.cargoreadiness.com/ResetPassword?verificationID=" + currentuser_id + "");
            EducationEverestEntities db = new EducationEverestEntities();
            AspNetUser dup = db.AspNetUsers.Where(q => q.Id == currentuser_id).First();
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(dup.Email);
            mailMessage.From = new MailAddress("wajidhussain.alfain@gmail.com");
            mailMessage.Subject = "Reset your password";
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = Body;//"http://localhost:64671/Components/Account/ResetPassword?verificationID=" + currentuser_id + "";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential("xyz", "xyz");
            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            ServicePointManager.ServerCertificateValidationCallback =
         delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
            smtpClient.Send(mailMessage);
            return "E-mail sent!";
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
        var user = db.AspNetUsers.Where(q => q.Email == Email.Text);
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
        if (message == "E-mail sent!")
        {
            status_text.ForeColor = System.Drawing.Color.ForestGreen;
            forget_panel.Visible = false;
        }
    }
}