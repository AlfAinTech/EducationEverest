using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_SideNavBar : System.Web.UI.UserControl
{
    EducationEverestEntities db = new EducationEverestEntities();
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
        CompletionCheck();
    }
    protected void CompletionCheck()
    {
        // 1 or greater= normal , 0 =filing new apps 
        int actionStatus = 1;
        if(Request.QueryString["apps"] != null && Request.QueryString["apps"] != "null")
        {
            actionStatus = Convert.ToInt32(Request.QueryString["apps"]);
        }
        if (db.Personal_Details.Any(q => q.User_ID == current_user))
        {
            imgTickPersonalDetails.Visible = true;
        }
        else if(actionStatus >0)
        {
            imgExcPersonalDetails.Visible = true;
        }
        if (actionStatus == 0)
        {
            imgTickChoices.Visible = false;
        }
        else
        {
            imgTickChoices.Visible = false;
            if (db.MakeChoices.Any(a => a.User_ID == current_user))
            {
                List<int> universityIDs = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).Take(actionStatus).Select(a => a.Uni_ID).ToList();
                if (db.MakeChoices.Any(q => q.User_ID == current_user && universityIDs.Contains(q.University.id)))
                {
                    imgTickChoices.Visible = true;
                }
                else
                {
                    imgExcChoices.Visible = true;
                }
            }
        }
        if (db.Matriculation_Education.Any(q => q.User_ID == current_user) && db.Intermediate_Education.Any(q => q.User_ID == current_user))
        {
            imgTickEducationDetails.Visible = true;
        }
        else if (actionStatus > 0)
        {
            imgExcEducationDetails.Visible = true;
        }
        if (db.Test_Results.Any(a => a.User_ID == current_user) && actionStatus != 0)
        {
            Guid appID = Guid.Empty;
            if (Request.QueryString["appID"] != null)
            {
                appID = new Guid(Request.QueryString["appID"].ToString());
            }
            if(appID != Guid.Empty)
            {
                //get a university id based on appID
                if (db.Applications.Any(a => a.UserID == current_user && a.appID == appID))
                {
                    int UniversityID = (int)db.Applications.Where(a => a.UserID == current_user && a.appID == appID).First().UnivID;
                    string testName = db.UniversityProfiles.Where(a => a.UniversityID == UniversityID).First().TestName;
                    if (db.Test_Results.Any(a => a.Test_Name == testName))
                    {
                        imgTickTestResults.Visible = true;
                    }
                    else
                    {
                        imgExcTestResults.Visible = true;
                    }
                }
            }
            else 
            {
                List<int> universityIDs = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).Take(actionStatus).Select(a => a.Uni_ID).ToList();
                List<string> testNames = db.UniversityProfiles.Where(a => universityIDs.Contains(a.UniversityID)).Select(a => a.TestName).ToList();
                foreach(string testname in testNames)
                {
                    if (db.Test_Results.Any(a => a.Test_Name == testname && a.User_ID == current_user))
                    {
                        imgTickTestResults.Visible = true;
                    }
                    else
                    {   
                        imgExcTestResults.Visible = true;
                        break;
                    }
                }
            }
        }
        else if (actionStatus > 0)
        {
            imgExcTestResults.Visible = true;
        }
        if (db.Documents.Any(q => q.userID == current_user))
        {
            if (actionStatus == 0)
            {
                imgTickDocuments.Visible = false;
            }
            else
            {
                if (db.MakeChoices.Any(a => a.User_ID == current_user))
                {
                    Guid appID = Guid.Empty;
                    if (Request.QueryString["appID"] != null)
                    {
                        appID = new Guid(Request.QueryString["appID"].ToString());
                    }
                    if (appID != Guid.Empty)
                    {
                        if (db.Applications.Any(a => a.UserID == current_user && a.appID == appID))
                        {
                            //get a university id based on appID 
                            int UniversityID = (int)db.Applications.Where(a => a.UserID == current_user && a.appID == appID).First().UnivID;
                            List<Document> documents = db.Documents.Where(a => a.userID == current_user).ToList();
                            int staticDocsCount = documents.Count() - documents.Where(a => a.TestResult_Document.Any()).Count();
                            if (documents.Any(a => a.TestResult_Document.Any(x => x.UniID == UniversityID)) && staticDocsCount >= EEUtil.totalStaticDocumentFields)
                            {
                                imgTickDocuments.Visible = true;
                            }
                            else
                            {
                                imgExcDocuments.Visible = true;
                            }
                        }
                    }
                    else
                    {
                        List<int> universityIDs = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).Take(actionStatus).Select(a => a.Uni_ID).ToList();
                        List<Document> documents = db.Documents.Where(a => a.userID == current_user).ToList();
                        int staticDocsCount = documents.Count() - documents.Where(a => a.TestResult_Document.Any()).Count();
                        if (documents.Any(a => a.TestResult_Document.Any(x => universityIDs.Contains(x.UniID))) && staticDocsCount >= EEUtil.totalStaticDocumentFields)
                        {
                            imgTickDocuments.Visible = true;
                        }
                        else
                        {
                            imgExcDocuments.Visible = true;
                        }
                    }
                }

            }
        }
        else if (actionStatus > 0)
        {
            imgExcDocuments.Visible = true;
        }
        if(db.Applications.Any(a => a.UserID == current_user) && actionStatus != 0) {
            Guid appID = Guid.Empty;
            if (Request.QueryString["appID"] != null)
            {
                appID = new Guid(Request.QueryString["appID"].ToString());
            }
            if(appID != Guid.Empty)
            {
                int applicationID = db.Applications.Where(a => a.appID == appID).First().id;
                if(db.Payments.Any(a => a.ApplicationID == applicationID))
                {
                    imgTickPayments.Visible = true;
                }
                else
                {
                    imgExcPayments.Visible = true;
                }
            }else
            {
                List<int> universityIDs = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).Take(actionStatus).Select(a => a.Uni_ID).ToList();
                List<int> appids = db.Applications.Where(q => q.UserID == current_user && universityIDs.Contains(q.University.id)).Select(q => q.id).ToList();

                if (db.Payments.Where(q => appids.Contains(q.ApplicationID)).Count() == appids.Count() && (db.Payments.Where(q => appids.Contains(q.ApplicationID)).Count() > 0))
                {
                    imgTickPayments.Visible = true;
                }
                else
                {
                    imgExcPayments.Visible = true;
                }
            }
            
        }
        else if (actionStatus > 0)
        {
            imgExcPayments.Visible = true;
        }
    }
}