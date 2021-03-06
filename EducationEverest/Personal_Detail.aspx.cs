﻿using System;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using System.IO;
using System.Drawing;
using ImageProcessor;
using System.Web.UI.HtmlControls;
using System.Web.UI;
public partial class Personal_Detail : System.Web.UI.Page
{
    string jsString = ""; string jsString2 = "";
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();

    public void populate_personal_details()
    {
        if (db.Personal_Details.Any(x => x.User_ID == current_user))
        {
            var personal = db.Personal_Details.Where(x => x.User_ID == current_user).First();
            student_name.Value = personal.Name;
            father_name.Value = personal.Father_Name;
            student_cnic.Value = personal.CNIC;
            father_cnic.Value = personal.Father_CNIC;

            dob.Value = personal.DOB.Value.ToString("yyyy-MM-dd");

            // DateTime s = DateTime.ParseExact(personal.DOB, "MM/dd/yyyy", null);
            // nationality.Value = personal.Nationality; need dropdown list here
            if (ddlnationality.Items.FindByText(personal.Nationality) != null)
            {
                ddlnationality.SelectedValue = ddlnationality.Items.FindByText(personal.Nationality).Value;
            }
            //ddlnationality.SelectedItem.Text = personal.Nationality;
        }
        if (db.Media.Any(a => a.User_ID == current_user && a.Type== "Personal Detail"))
        {
            Medium media = db.Media.Where(a => a.User_ID == current_user && a.Type == "Personal Detail").First();
            ibtn_FileUpload.ImageUrl = media.Path;

        }
        //image of caution and success
        if (db.Personal_Details.Any(a => (a.User_ID == current_user) && (a.Father_CNIC == null || a.Name == null || a.Father_Name == null || a.CNIC == null || a.Father_CNIC == null || a.DOB == null || a.Nationality == null)))
        {
            jsString = "showCaution();";
        }
        else if(db.Personal_Details.Any(a => a.User_ID == current_user))
        {
            jsString = "showSuccess();";
        }
    }

    public void populate_contact_information()
    {
        if (db.ContactInformations.Any(x => x.User_ID == current_user))
        {
            var info = db.ContactInformations.Where(x => x.User_ID == current_user).First();
            current_address.Value = info.Current_Address;
            permanent_address.Value = info.Permanent_Address;
            email.Value = info.Email;
            //landline.Value = info.Landline;
            phone.Value = info.Phone;
            father_phone.Value = info.Phone_Father;
            zip.Value = info.Zip;
        }
        //image of caution and success
        if (db.ContactInformations.Any(a => (a.User_ID == current_user) && (a.Current_Address == null || a.Permanent_Address == null || a.Email == null  || a.Phone == null || a.Phone_Father == null || a.Zip == null)))
        {
            jsString2 = "showCaution2();";
        }
        else if (db.ContactInformations.Any(a => a.User_ID == current_user))
        {
            jsString2 = "showSuccess2();";
        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        if(Session["appIDS"] == null)
        {
            Response.Redirect("Dashboard.aspx");
        }
        if (!IsPostBack)
        {
            populate_personal_details();
            populate_contact_information();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "text", jsString+jsString2, true);
        }
        saveUploadedFile();
    }
    protected void saveUploadedFile()
    {
        if (FileUpload1.PostedFile != null)
        {
            
            if (FileUpload1.PostedFile.FileName.Length > 0 && (FileUpload1.PostedFile.ContentType == "image/png"|| FileUpload1.PostedFile.ContentType == "image/jpg" || FileUpload1.PostedFile.ContentType == "image/jpeg") )
            {
                FileUpload1.SaveAs(Server.MapPath("~/Content/UsersMedia/") + FileUpload1.PostedFile.FileName);
                
                string imagePath = Server.MapPath("~/Content/UsersMedia/") + FileUpload1.PostedFile.FileName;
                
                byte[] photoBytes = File.ReadAllBytes(imagePath); // change imagePath with a valid image path

                // Format is automatically detected though can be changed.
                int quality = 70;
                Size size = new Size(100, 100);
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
                                        .BackgroundColor(Color.WhiteSmoke)
                                        .Save(imagePath);
                        }
                        // Do something with the stream.
                    }
                }

                
                ibtn_FileUpload.ImageUrl = "~/Content/UsersMedia/" + FileUpload1.PostedFile.FileName;
                ViewState["ImagePath"] = "~/Content/UsersMedia/" + FileUpload1.PostedFile.FileName;
                ViewState["ImageName"] = FileUpload1.PostedFile.FileName;
            }
        }
    }
    protected void next_click(object sender, EventArgs e)

    {
        if (db.Personal_Details.Any(x => x.User_ID == current_user))
        {
            var x = db.Personal_Details.Where(y => y.User_ID == current_user).First();

            x.Name = student_name.Value;
            x.Father_Name = father_name.Value;
            x.CNIC = student_cnic.Value;
            x.Father_CNIC = father_cnic.Value;
            x.DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null);
           // x.DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null);
            //x.DOB = Convert.ToDateTime(dob.Value);
            x.DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null);
            //x.Nationality = nationality.Value; need dropdown list here
            x.Nationality = ddlnationality.SelectedItem.Text;
           
            // save the image

            db.SaveChanges();

            //student_name.Value = string.Empty;
            //father_name.Value = "";
            //student_cnic.Value = "";
            //father_cnic.Value = "";
            //dob.Value = "";
            //nationality.Value = "";
            
        }
        else
        {
            Personal_Details pds = new Personal_Details
            {

                Name = student_name.Value,
                Father_Name = father_name.Value,
                CNIC = student_cnic.Value,
                Father_CNIC = father_cnic.Value,
                DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null),

               // Nationality = nationality.Value, need dropdown list here
               Nationality= ddlnationality.SelectedItem.Text,


            User_ID = current_user

            };
            try { 
            db.Personal_Details.Add(pds);
            db.SaveChanges();
            }
            catch (Exception ex) { }

        }

        if(db.Media.Any(a => a.User_ID == current_user && a.Type == "Personal Detail"))
        {
            Medium media = db.Media.Where(a => a.User_ID == current_user).First();
            if(ViewState["ImagePath"] != null && ViewState["ImagePath"].ToString() != "")
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
            newMedia.Type = "Personal Detail";
            db.Media.Add(newMedia);
            db.SaveChanges();
        }

        if (db.ContactInformations.Any(x => x.User_ID == current_user))
        {
            var x = db.ContactInformations.Where(y => y.User_ID == current_user).First();
            x.Current_Address = current_address.Value;
            x.Permanent_Address = permanent_address.Value;
            x.Email = email.Value;
            //x.Landline = landline.Value;
            x.Phone = phone.Value;
            x.Phone_Father = father_phone.Value;
            x.Zip = zip.Value;
            db.SaveChanges();

            HtmlImage imgpd = Master.FindControl("imgTickPersonalDetails") as HtmlImage;


            if (imgpd != null)

            {

                imgpd.Visible = true;
                Session["IMGPD"] = "imgpd";
                //Response.Redirect("Choices.aspx?imgpd=" + imgpd);
            }


        }
        else
        {
            ContactInformation ci = new ContactInformation
            {
                User_ID = current_user,
                Current_Address = current_address.Value,
                Permanent_Address = permanent_address.Value,
                Email = email.Value,
                //Landline = landline.Value,
                Phone = phone.Value,
                Phone_Father = father_phone.Value,
                Zip = zip.Value

            };
            db.ContactInformations.Add(ci);
            db.SaveChanges();
        }

        //code here for user leaves in between
        App_Start aps= new App_Start();
        aps.AspNetUserID = current_user;
        aps.Email = email.Value;
        aps.datetime = DateTime.Now;
        aps.incompleteEmailSent = false;
        aps.ApplicationAdded = false;
        db.App_Start.Add(aps);
        db.SaveChanges();


        //button next click from Personal Details to Choice
        Response.Redirect("Choices.aspx");
        
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