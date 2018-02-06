using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class My_Profile : System.Web.UI.Page
{
    
    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string varr = Session["username"].ToString();

        //using (var ctx = new EducationEverestEntities())
        //{
        //    //var studentName = ctx.UserProfiles.SqlQuery("Select studentid, studentname, standardId from Student where studentname='Bill'").FirstOrDefault<Student>();
        //    ctx.UserProfiles.SqlQuery("select FirstName, LastName,City from UserProfile where Email='varr'").FirstOrDefault<UserProfile>();
        //}

        if (Session["username"] == null)
        {

            Response.Redirect("Login.aspx");
        }
        else
        {
        }

        string var = Session["username"].ToString();

        UserProfile up = new UserProfile();

        //code to show user information
      var logged=  db.UserProfiles.Where(q => q.Email == var).Select(q => new { em =q.Email, fn = q.FirstName, ln = q.LastName, c =q.City, p=q.Phone }).FirstOrDefault();
        email.Text = logged.em;
        email2.Text = logged.em;
        firstName.Text = logged.fn;
        lastName.Text = logged.ln;
        city.Text = logged.c;
        city2.Text = logged.c;
        contact.Text = logged.p;



    }
 
    protected void SendEmail_Click(object sender, EventArgs e)
    {
        string var2 = Session["username"].ToString();

        using (MailMessage mm = new MailMessage("www.hahisb@gmail.com", txtEmailSend.Text))  //here ID changed 02-feb-18
        {
            UserProfile up = new UserProfile();

            var logged = db.UserProfiles.Where(q => q.Email == var2).Select(q => new {  fn = q.FirstName, ln = q.LastName }).FirstOrDefault();


            mm.Subject = "Education Everest Invitation from"+" "+var2;
            string body = "Hello " + txtEmailSend.Text.Trim() + ",";
            body += "<br /><br />I would like to invite you to visit Education Everest";
            body += "<br /><a href = '" + "http://localhost:65465/My_Profile.aspx" + "'>Click here to visit Education Everest.</a>";
            body += "<br /><br />Thanks & regards";
            body += "<br /><br />"+logged.fn+" "+logged.ln;
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("www.hahisb@gmail.com", "educationeverest"); // here ID and password changed 02-feb-18
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' Invitation Email sent successfully ');", true);
            txtEmailSend.Text = "";
        }

    }


    protected void btnMessage_Click(object sender, EventArgs e)
    {
        string var1 = Session["username"].ToString();
        UserProfile up = new UserProfile();

        var logged = db.UserProfiles.Where(q => q.Email == var1).Select(q => new { userid = q.AspNetUserID }).FirstOrDefault();

        Contact_Us cs = new Contact_Us();
        cs.Message = txtMessage.Text;
        cs.User_Email = txtMessageEmail.Text;
        cs.User_ID = logged.userid;
        db.Contact_Us.Add(cs);
        db.SaveChanges();

        ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' Your message is recorded successfully ');", true);
    }
}