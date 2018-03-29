using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ApplicationDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!(HttpContext.Current.User.Identity.IsAuthenticated))
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
            }
           
        }
    }
    public void BindData(int applicationID)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        if (db.Applications.Any(a => a.id == applicationID))
        {
            Application application = db.Applications.Where(a => a.id == applicationID).FirstOrDefault();

            lbl_appID.Text = application.appID.ToString();
            lbl_LastDate.Text = application.ApplicationDate;
            lbl_UniDeadline.Text = application.University.deadLine;
            lbl_CurrentStatus.Text = application.CurrentStatus_;
            lbl_UniName.Text = application.University.Name;
            lbl_CurrentStatus01.Text = application.CurrentStatus;
            if(application.CurrentStatus_ == "rejected" || application.CurrentStatus_ == "pending")
            {
                currentStatusField.Attributes.Remove("class");
                currentStatusField.Attributes.Add("class", "rejected_text pull-right");
            }else
            {
                currentStatusField.Attributes.Remove("class");
                currentStatusField.Attributes.Add("class", "progress_text pull-right");
            }
            UniversityMedia um = db.UniversityMedias.Where(q => q.UniversityId == application.UnivID).FirstOrDefault();
                if (um != null)
                {
                    Image im = logo;
                    im.ImageUrl = um.Path;
                }

                //bind Application detail data
                //personal detail
                Personal_Details pd = application.AspNetUser.Personal_Details.FirstOrDefault();
                if (pd != null)
                {
                    Name.Text = pd.Name == null ? "" : pd.Name;
                    FatherName.Text = pd.Father_Name == null ? "" : pd.Father_Name;
                    StudentCNIC.Text = pd.CNIC == null ? "" : pd.CNIC;
                    FatherCNIC.Text = pd.Father_CNIC == null ? "" : pd.Father_CNIC;
                    DOB.Text = pd.DateOfBirth;
                    Nationality.Text = pd.Nationality == null ? "" : pd.Nationality;
                    Medium media = application.AspNetUser.Media.FirstOrDefault();
                    if (media != null)
                    {
                        Image image = user_Image;
                        image.ImageUrl = media.Path;

                    }
                }
                ContactInformation ci = application.AspNetUser.ContactInformations.FirstOrDefault();
                if (ci != null)
                {
                    
                    CurrentAddress.Text = ci.Current_Address == null ? "" : ci.Current_Address;
                    ParmanentAddress.Text = ci.Permanent_Address == null ? "" : ci.Permanent_Address;
                    
                    phoneStudent.Text = ci.Phone == null ? "" : ci.Phone;
                    
                    phoneFather.Text = ci.Phone_Father == null ? "" : ci.Phone_Father;
                    
                    landLine.Text = ci.Landline == null ? "" : ci.Landline;
                    
                    PostalCode.Text = ci.Zip == null ? "" : ci.Zip;
                }
            //preferences Detail
            
                if (application.deptID != null)

                    PreferencesList.DataSource = db.MakeChoices.Where(q => q.User_ID == application.UserID && q.Uni_ID == application.UnivID && q.Department_Id == application.deptID).ToList();
                else
                    PreferencesList.DataSource = db.MakeChoices.Where(q => q.User_ID == application.UserID && q.Uni_ID == application.UnivID).ToList();
                PreferencesList.DataBind();
                //Educational Detail
                Matriculation_Education me = db.Matriculation_Education.Where(q => q.User_ID == application.UserID).FirstOrDefault();
                if (me != null)
                {
                    
                    MetricBoard.Text = me.Board == null ? "" : me.Board;
                    
                    MetricRollNo.Text = me.Rollno == null ? "" : me.Rollno;
                    
                    MetricYear.Text = me.Passing_Year == null ? "" : me.Passing_Year;
                    
                    MetricTotalMarks.Text = me.Total_Marks == null ? "" : me.Total_Marks;
                    
                    MetricObtainedMarks.Text = me.Obtained_Marks == null ? "" : me.Obtained_Marks;
                    
                    MetricPercentage.Text = me.Percentage == null ? "" : me.Percentage;
                    
                    MetricGrades.Text = me.Division == null ? "" : me.Division;
                }
                Intermediate_Education ie = db.Intermediate_Education.Where(q => q.User_ID == application.UserID).FirstOrDefault();
                if (ie != null)
                {
                    
                    InterBoard.Text = ie.Board == null ? "" : ie.Board;
                    
                    InterRollNo.Text = ie.Rollno == null ? "" : ie.Rollno;
                    
                    InterYear.Text = ie.Passing_Year == null ? "" : ie.Passing_Year;
                    
                    InterTotalMarks.Text = ie.Total_Marks == null ? "" : ie.Total_Marks;
                    
                    InterObtainedMarks.Text = ie.Obtained_Marks == null ? "" : ie.Obtained_Marks;
                    
                    InterPercentage.Text = ie.Percentage == null ? "" : ie.Percentage;
                    
                    InterGrades.Text = ie.Division == null ? "" : ie.Division;
                }
                //Test Results Detail
                
                TestResultList.DataSource = db.Test_Results.Where(q => q.User_ID == application.UserID).ToList();
                TestResultList.DataBind();
                //Documents detail 
                
                studentCNICList.DataSource = db.Documents.Where(q => q.documentType == "StudentCNIC").ToList();
                studentCNICList.DataBind();
                
                FatherCNICList.DataSource = db.Documents.Where(q => q.documentType == "FatherCNIC").ToList();
                FatherCNICList.DataBind();
                
                FatherIncomeCertiList.DataSource = db.Documents.Where(q => q.documentType == "FatherIncomeCerti").ToList();
                FatherIncomeCertiList.DataBind();
                
                MatricCertiList.DataSource = db.Documents.Where(q => q.documentType == "MatricCerti").ToList();
                MatricCertiList.DataBind();
                
                InterCertiList.DataSource = db.Documents.Where(q => q.documentType == "IntermediateCerti").ToList();
                InterCertiList.DataBind();
                

                List<int> universities = new List<int>();
                if (application.deptID != null)
                    universities = db.MakeChoices.Where(q => q.User_ID == application.UserID && q.Uni_ID == application.UnivID && q.Department_Id == application.deptID).Select(q => q.Uni_ID).ToList();
                else
                    universities = db.MakeChoices.Where(q => q.User_ID == application.UserID && q.Uni_ID == application.UnivID).Select(q => q.Uni_ID).ToList();

                TestResultDocList.DataSource = db.UniversityProfiles.Where(q => universities.Contains(q.UniversityID)).ToList();
                TestResultDocList.DataBind();
            
        }
        else
        {
            //no details found
        }
    }

    protected void TestResultDocList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
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