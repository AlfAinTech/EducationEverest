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
        if (db.Personal_Details.Any(q => q.User_ID == current_user))
        {
            imgTickPersonalDetails.Visible = true;
        }
        else
        {
            imgExcPersonalDetails.Visible = true;
        }
        if (Request.QueryString["NA"] != null && Request.QueryString["NA"] == "true")
        {
            imgTickChoices.Visible = false;
        }
        else
        {
            imgTickChoices.Visible = false;
            if (db.MakeChoices.Any(a => a.User_ID == current_user))
            {
                int universityID = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).First().Uni_ID;
                if (db.MakeChoices.Any(q => q.User_ID == current_user && q.Uni_ID == universityID))
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
        else
        {
            imgExcEducationDetails.Visible = true;
        }
        if (db.Test_Results.Where(q => q.User_ID == current_user).Count() == db.MakeChoices.Where(q => q.User_ID == current_user).GroupBy(q => q.Uni_ID).Count() && (db.Test_Results.Where(q => q.User_ID == current_user).Count() > 0))
        {
            imgTickTestResults.Visible = true;
        }
        else
        {
            imgExcTestResults.Visible = true;
        }
        if (db.Documents.Any(q => q.userID == current_user))
        {
            if (Request.QueryString["NA"] != null && Request.QueryString["NA"] == "true")
            {
                imgTickDocuments.Visible = false;
            }
            else
            {
                if (db.MakeChoices.Any(a => a.User_ID == current_user))
                {
                    int universityID = db.MakeChoices.Where(a => a.User_ID == current_user).OrderByDescending(u => u.id).First().Uni_ID;
                    List<Document> documents = db.Documents.Where(a => a.userID == current_user).ToList();
                    int staticDocsCount = documents.Count() - documents.Where(a => a.TestResult_Document.Any()).Count();
                    if (documents.Any(a => a.TestResult_Document.Any(x => x.UniID == universityID)) && staticDocsCount >= EEUtil.totalStaticDocumentFields)
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
        else
        {
            imgExcDocuments.Visible = true;
        }
        List<int> appids = db.Applications.Where(q => q.UserID == current_user).Select(q => q.id).ToList();
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