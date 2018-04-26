using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

using System.IO;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using ImageProcessor;

public partial class My_Profile : System.Web.UI.Page
{

    EducationEverestEntities db = new EducationEverestEntities();
    // public static string current_user = HttpContext.Current.User.Identity.GetUserId(); //to be used later
    //public static string current_user = "b7f8e747-9167-4340-8c23-b914eda6d11f";
    string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }

        if (current_user == null)
        {
            Response.Redirect("Login.aspx");
        }

        
        UserProfile up = new UserProfile();
        //code to show user information

        var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { em = q.Email, fn = q.FirstName, ln = q.LastName, c = q.City, p = q.Phone }).FirstOrDefault();
        email.Text = logged.em;
        email2.Text = logged.em;

        firstName.Text = logged.fn;
        lastName.Text = logged.ln;
        city.Text = logged.c;
        city2.Text = logged.c;
        contact.Text = logged.p;
        if(db.Media.Any(a => a.User_ID == current_user && a.Type== "Profile Image"))
        {
            ibtn_FileUpload.ImageUrl = db.Media.Where(a => a.User_ID == current_user && a.Type == "Profile Image").First().Path;
        }
        saveUploadedFile();

    }
    protected void saveUploadedFile()
    {
        if (FileUpload1.PostedFile != null)
        {

            if (FileUpload1.PostedFile.FileName.Length > 0 && (FileUpload1.PostedFile.ContentType == "image/png" || FileUpload1.PostedFile.ContentType == "image/jpg" || FileUpload1.PostedFile.ContentType == "image/jpeg"))
            {
                FileUpload1.SaveAs(Server.MapPath("~/Content/UsersMedia/") + FileUpload1.PostedFile.FileName);

                string imagePath = Server.MapPath("~/Content/UsersMedia/") + FileUpload1.PostedFile.FileName;

                byte[] photoBytes = File.ReadAllBytes(imagePath); // change imagePath with a valid image path

                // Format is automatically detected though can be changed.
                int quality = 70;
                Size size = new Size(80, 80);
                using (MemoryStream inStream = new MemoryStream(photoBytes))
                {
                    using (MemoryStream outStream = new MemoryStream())
                    {
                        // Initialize the ImageFactory using the overload to preserve EXIF metadata.
                        using (ImageFactory imageFactory = new ImageFactory(preserveExifData: true))
                        {
                            // Load, resize, set the format and quality and save an image.

                            imageFactory.Load(inStream)
                                        .Resize(size)
                                        .Quality(quality)
                                        .Save(imagePath);
                        }
                        // Do something with the stream.
                    }
                }


                ibtn_FileUpload.ImageUrl = "~/Content/UsersMedia/" + FileUpload1.PostedFile.FileName;
                ViewState["ImagePath"] = "~/Content/UsersMedia/" + FileUpload1.PostedFile.FileName;
                ViewState["ImageName"] = FileUpload1.PostedFile.FileName;
            }
            if (db.Media.Any(a => a.User_ID == current_user && a.Type=="Profile Image"))
            {
                Medium media = db.Media.Where(a => a.User_ID == current_user && a.Type == "Profile Image").First();
                if (ViewState["ImagePath"] != null && ViewState["ImagePath"].ToString() != "")
                {
                    media.Path = ViewState["ImagePath"].ToString();
                }

                db.SaveChanges();
            }
            else
            {

                Medium newMedia = new Medium();
                newMedia.User_ID = current_user;
                if (ViewState["ImagePath"] != null && ViewState["ImagePath"].ToString() != "")
                {

                    newMedia.Path = ViewState["ImagePath"].ToString();
                }
                else
                {
                    newMedia.Path = "~/Content/UsersMedia/ee_UserDefault.png";
                }
                newMedia.Type = "Profile Image";
                db.Media.Add(newMedia);
                db.SaveChanges();
            }
        }
    }
    protected void SendEmail_Click(object sender, EventArgs e)
    {
        //string var2 = Session["username"].ToString();

        using (MailMessage mm = new MailMessage(EEUtil.FromEmail, txtEmailSend.Text))  //here ID changed 02-feb-18
        {
            UserProfile up = new UserProfile();

            var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { fn = q.FirstName, ln = q.LastName, eml = q.Email }).FirstOrDefault();


            mm.Subject = "Education Everest Invitation from " + logged.eml;
            string Body = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/EmailContent.html"));
            Body = Body.Replace("{title}", "Education Everest Invitation");
            Body = Body.Replace("{fullName}", txtEmailSend.Text.Trim());
            Body = Body.Replace("{body}", "I would like to invite you to visit Education Everest");
            Body = Body.Replace("{ButtonText}", "" + "Education Everest");
            Body = Body.Replace("{href}", "" + "http://" + HttpContext.Current.Request.Url.Authority + "/Login.aspx" + "" + "");
            
            mm.Body = Body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential(EEUtil.FromEmail, EEUtil.FromPassword); // here ID and password changed 02-feb-18
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
        // string var1 = Session["username"].ToString();
        UserProfile up = new UserProfile();

        var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { userid = q.AspNetUserID }).FirstOrDefault();

        Contact_Us cs = new Contact_Us();
        cs.Message = txtMessage.Text;
        cs.User_Email = txtMessageEmail.Text;
        cs.User_ID = logged.userid;
        db.Contact_Us.Add(cs);
        db.SaveChanges();

        ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' Your message is recorded successfully ');", true);
        txtMessage.Text = "";
        txtMessageEmail.Text = "";
    }

    protected void btnFileAdmission_Click(object sender, EventArgs e)
    {
        Session["appIDS"] = new List<int>();
        Session["EditMode"] = null;
        Session["UniversityID"] = null;
        Response.Redirect("Personal_Detail.aspx");
    }
    protected void btn_UplaodImage_Click(object sender, EventArgs e)
    {
        //save university logo 
        string filePath = "";
        if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.ContentLength > 0)
        {

            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string folder = Server.MapPath("~/Content/UsersMedia/");
            filePath = Path.Combine(folder, fileName);
            FileUpload1.PostedFile.SaveAs(filePath);
            try
            {
                Console.WriteLine("File uploaded successfully!!");
            }
            catch
            {
                Console.WriteLine("File uploading failed!!");
                filePath = null;
            }
        }

        ibtn_FileUpload.ImageUrl = filePath;
    }
}