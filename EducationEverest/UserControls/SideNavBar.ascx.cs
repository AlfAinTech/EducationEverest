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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        CompletionCheck();
    }
    protected void CompletionCheck()
    {
        string current_user = HttpContext.Current.User.Identity.GetUserId();
    // 1 or greater= normal , 0 =filing new apps 
    int actionStatus = 0;
        if(Session["appIDS"] != null )
        {
            List<int> applicationIDS = (List < int >) Session["appIDS"];
            actionStatus = applicationIDS.Count();
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
            if (Session["appIDS"] != null)
            {
                List<int> applicationIDS = (List<int>)Session["appIDS"];
                List<int> universityIDs = db.Applications.Where(a => applicationIDS.Contains(a.id)).Select(a => a.University.id).ToList();
                List<string> testNames = db.UniversityProfiles.Where(a => universityIDs.Contains(a.UniversityID)).Select(a => a.TestName).ToList();
                foreach (string testname in testNames)
                {
                    if (db.Test_Results.Any(a => a.Test_Name == testname && a.User_ID == current_user))
                    {
                        imgTickTestResults.Visible = true;
                    }
                    else
                    {
                        imgExcTestResults.Visible = true;
                        imgTickTestResults.Visible = false;
                        break;
                    }
                }
            }
        }
        else if (actionStatus > 0)
        {
            imgExcTestResults.Visible = true;
        }
        if (db.Documents.Any(q => q.userID == current_user) && actionStatus != 0)
        {
            if (Session["appIDS"] != null)
            {
                List<int> applicationIDS = (List<int>)Session["appIDS"];
                List<int> universityIDs = db.Applications.Where(a => applicationIDS.Contains(a.id)).Select(a => a.University.id).ToList();
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
        else if (actionStatus > 0)
        {
            imgExcDocuments.Visible = true;
        }
        if(db.Applications.Any(a => a.UserID == current_user) && actionStatus != 0)
        {
            if (Session["appIDS"] != null)
            {
                List<int> applicationIDS = (List<int>)Session["appIDS"];
                if (db.Payments.Where(q => applicationIDS.Contains(q.ApplicationID)).Count() == applicationIDS.Count() && (db.Payments.Where(q => applicationIDS.Contains(q.ApplicationID)).Count() > 0))
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