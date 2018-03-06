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

public partial class My_Profile : System.Web.UI.Page
{
    
    EducationEverestEntities db = new EducationEverestEntities();
    // public static string current_user = HttpContext.Current.User.Identity.GetUserId(); //to be used later
    //public static string current_user = "b7f8e747-9167-4340-8c23-b914eda6d11f";
    string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }

        if (current_user == null)
        {
            Response.Redirect("Login.aspx");
        }

        UserProfile up = new UserProfile();

        //code to show user information

      var logged=  db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { em =q.Email, fn = q.FirstName, ln = q.LastName, c =q.City, p=q.Phone }).FirstOrDefault();
        email.Text = logged.em;
        email2.Text = logged.em;

        firstName.Text = logged.fn;
        lastName.Text = logged.ln;
        city.Text = logged.c;
        city2.Text = logged.c;
        contact.Text = logged.p;

       
        //show user first name
        lblLoggedUser.Text = logged.fn;
        ChoicesList.DataSource = db.Applications.Where(q => q.UserID == current_user).ToList();
        ChoicesList.DataBind();
        PaymentsList.DataSource = db.Applications.Where(q => q.UserID == current_user).ToList();
        PaymentsList.DataBind();

    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
        Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search_Results.aspx");
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search_Results.aspx?searchBox=" + TextBox1.Text);
    }


    protected void SendEmail_Click(object sender, EventArgs e)
    {
        //string var2 = Session["username"].ToString();

        using (MailMessage mm = new MailMessage("www.hahisb@gmail.com", txtEmailSend.Text))  //here ID changed 02-feb-18
        {
            UserProfile up = new UserProfile();

            var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new {  fn = q.FirstName, ln = q.LastName, eml=q.Email }).FirstOrDefault();


            mm.Subject = "Education Everest Invitation from"+" "+logged.eml;
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
            NetworkCredential NetworkCred = new NetworkCredential("www.hahisb@gmail.com", "EducationEverest"); // here ID and password changed 02-feb-18
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
        Response.Redirect("Personal_Detail.aspx");
    }
    protected void PaymentsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.DataItem is Application)
        {
            Application dataItem = e.Item.DataItem as Application;
            UniversityMedia um = db.UniversityMedias.Where(q => q.UniversityId == dataItem.UnivID).FirstOrDefault();
            if (um != null)
            {
                Image im = (Image)e.Item.FindControl("logo");
                im.ImageUrl = um.Path;
            }

        }
    }
    protected void ChoicesList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
        if (e.Item.DataItem is Application)
        {
            Application dataItem = e.Item.DataItem as Application;
            UniversityMedia um = db.UniversityMedias.Where(q => q.UniversityId == dataItem.UnivID).FirstOrDefault();
            if (um != null)
            {
                Image im = (Image)e.Item.FindControl("logo");
                im.ImageUrl = um.Path;
            }
            //bind Application detail data
            //personal detail
            Personal_Details pd = dataItem.AspNetUser.Personal_Details.FirstOrDefault();
            if (pd != null)
            {
                Label Name = (Label)e.Item.FindControl("Name");
                Name.Text = pd.Name==null?"":pd.Name;
                Label FatherName = (Label)e.Item.FindControl("FatherName");
                FatherName.Text = pd.Father_Name == null ? "" : pd.Father_Name;
                Label StudentCNIC = (Label)e.Item.FindControl("StudentCNIC");
                StudentCNIC.Text = pd.CNIC == null ? "" : pd.CNIC;
                Label FatherCNIC = (Label)e.Item.FindControl("FatherCNIC");
                FatherCNIC.Text = pd.Father_CNIC == null ? "" : pd.Father_CNIC;
                Label DOB = (Label)e.Item.FindControl("DOB");
                DOB.Text = pd.DateOfBirth;
                Label Nationality = (Label)e.Item.FindControl("Nationality");
                Nationality.Text = pd.Nationality==null?"":pd.Nationality;
            }
            ContactInformation ci = dataItem.AspNetUser.ContactInformations.FirstOrDefault();
            if(ci != null)
            {  
                Label CurrentAddress = (Label)e.Item.FindControl("CurrentAddress");
                CurrentAddress.Text = ci.Current_Address == null ? "" : ci.Current_Address;
                Label ParmanentAddress = (Label)e.Item.FindControl("ParmanentAddress");
                ParmanentAddress.Text = ci.Permanent_Address == null ? "" : ci.Permanent_Address;
                Label phoneStudent = (Label)e.Item.FindControl("phoneStudent");
                phoneStudent.Text = ci.Phone == null ? "" : ci.Phone;
                Label phoneFather = (Label)e.Item.FindControl("phoneFather");
                phoneFather.Text = ci.Phone_Father == null ? "" : ci.Phone_Father;
                Label landLine = (Label)e.Item.FindControl("landLine");
                landLine.Text = ci.Landline == null ? "" : ci.Landline;
                Label PostalCode = (Label)e.Item.FindControl("PostalCode");
                PostalCode.Text = ci.Zip == null ? "" : ci.Zip;
            }
            //preferences Detail
            Repeater PreferencesList = (Repeater)e.Item.FindControl("PreferencesList");
            if (dataItem.deptID != null)

                PreferencesList.DataSource = db.MakeChoices.Where(q => q.User_ID == current_user && q.Uni_ID == dataItem.UnivID && q.Department_Id == dataItem.deptID).ToList();
            else
                PreferencesList.DataSource = db.MakeChoices.Where(q => q.User_ID == current_user && q.Uni_ID == dataItem.UnivID).ToList();
            PreferencesList.DataBind();
            //Educational Detail
            Matriculation_Education me = db.Matriculation_Education.Where(q => q.User_ID == current_user).FirstOrDefault();
            if(me != null)
            {
                Label MetricBoard = (Label)e.Item.FindControl("MetricBoard");
                MetricBoard.Text = me.Board== null ? "" :me.Board;
                Label MetricRollNo = (Label)e.Item.FindControl("MetricRollNo");
                MetricRollNo.Text = me.Rollno == null ? "" : me.Rollno;
                Label MetricYear = (Label)e.Item.FindControl("MetricYear");
                MetricYear.Text = me.Passing_Year == null ? "" : me.Passing_Year;
                Label MetricTotalMarks = (Label)e.Item.FindControl("MetricTotalMarks");
                MetricTotalMarks.Text = me.Total_Marks == null ? "" : me.Total_Marks;
                Label MetricObtainedMarks = (Label)e.Item.FindControl("MetricObtainedMarks");
                MetricObtainedMarks.Text = me.Obtained_Marks == null ? "" : me.Obtained_Marks;
                Label MetricPercentage = (Label)e.Item.FindControl("MetricPercentage");
                MetricPercentage.Text = me.Percentage == null ? "" : me.Percentage;
                Label MetricGrades = (Label)e.Item.FindControl("MetricGrades");
                MetricGrades.Text = me.Division == null ? "" : me.Division;
            }
            Intermediate_Education ie = db.Intermediate_Education.Where(q => q.User_ID == current_user).FirstOrDefault();
            if (ie != null)
            {
                Label InterBoard = (Label)e.Item.FindControl("InterBoard");
                InterBoard.Text = ie.Board == null ? "" : ie.Board;
                Label InterRollNo = (Label)e.Item.FindControl("InterRollNo");
                InterRollNo.Text = ie.Rollno == null ? "" : ie.Rollno;
                Label InterYear = (Label)e.Item.FindControl("InterYear");
                InterYear.Text = ie.Passing_Year == null ? "" : ie.Passing_Year;
                Label InterTotalMarks = (Label)e.Item.FindControl("InterTotalMarks");
                InterTotalMarks.Text = ie.Total_Marks == null ? "" : ie.Total_Marks;
                Label InterObtainedMarks = (Label)e.Item.FindControl("InterObtainedMarks");
                InterObtainedMarks.Text = ie.Obtained_Marks == null ? "" : ie.Obtained_Marks;
                Label InterPercentage = (Label)e.Item.FindControl("InterPercentage");
                InterPercentage.Text = ie.Percentage == null ? "" : ie.Percentage;
                Label InterGrades = (Label)e.Item.FindControl("InterGrades");
                InterGrades.Text = ie.Division == null ? "" : ie.Division;
            }
            //Test Results Detail
            Repeater TestResultList = (Repeater)e.Item.FindControl("TestResultList");
            TestResultList.DataSource = db.Test_Results.Where(q => q.User_ID == current_user).ToList();
            TestResultList.DataBind();
            //Documents detail 
            Repeater studentCNICList = (Repeater)e.Item.FindControl("studentCNICList");
            studentCNICList.DataSource = db.Documents.Where(q => q.documentType == "StudentCNIC").ToList();
            studentCNICList.DataBind();
            Repeater FatherCNICList = (Repeater)e.Item.FindControl("FatherCNICList");
            FatherCNICList.DataSource = db.Documents.Where(q => q.documentType == "FatherCNIC").ToList();
            FatherCNICList.DataBind();
            Repeater FatherIncomeCertiList = (Repeater)e.Item.FindControl("FatherIncomeCertiList");
            FatherIncomeCertiList.DataSource = db.Documents.Where(q => q.documentType == "FatherIncomeCerti").ToList();
            FatherIncomeCertiList.DataBind();
            Repeater MatricCertiList = (Repeater)e.Item.FindControl("MatricCertiList");
            MatricCertiList.DataSource = db.Documents.Where(q => q.documentType == "MatricCerti").ToList();
            MatricCertiList.DataBind();
            Repeater InterCertiList = (Repeater)e.Item.FindControl("InterCertiList");
            InterCertiList.DataSource = db.Documents.Where(q => q.documentType == "IntermediateCerti").ToList();
            InterCertiList.DataBind();
            Repeater TestResultDocList = (Repeater)e.Item.FindControl("TestResultDocList");

            List<int> universities = new List<int>();
            if (dataItem.deptID != null)
                universities = db.MakeChoices.Where(q=>q.User_ID == current_user && q.Uni_ID == dataItem.UnivID && q.Department_Id == dataItem.deptID).Select(q => q.Uni_ID ).ToList();
            else
                universities = db.MakeChoices.Where(q => q.User_ID == current_user && q.Uni_ID == dataItem.UnivID).Select(q => q.Uni_ID).ToList();

            TestResultDocList.DataSource = db.UniversityProfiles.Where(q => universities.Contains(q.UniversityID)).ToList();
            TestResultDocList.DataBind();
        }
    }
    protected void TestResultDocList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem is UniversityProfile)
        {
            UniversityProfile dataItem = e.Item.DataItem as UniversityProfile;
            TestResult_Document td = db.TestResult_Document.Where(q => q.UniID == dataItem.UniversityID).FirstOrDefault();

            if (td != null)
            {
               
                Label ctrlsize =
                      e.Item.FindControl("documentSizeInKB") as Label;
                Label documentName =
                      e.Item.FindControl("documentName") as Label;
               

                if (ctrlsize != null)
                {
                    ctrlsize.Text = td.Document.documentSizeInKB.ToString();
                }
                if (documentName != null)
                {
                    documentName.Text = td.Document.documentName.ToString();
                }

            }
        }
    }
}