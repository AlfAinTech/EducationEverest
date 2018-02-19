using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Upload_Documents : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        { bindData();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
        }
    }

    public void bindData()
    {
        studentCNICList.DataSource = db.Documents.Where(q=>q.documentType == "StudentCNIC").ToList();
        studentCNICList.DataBind();
        FatherCNICList.DataSource = db.Documents.Where(q => q.documentType == "FatherCNIC").ToList();
        FatherCNICList.DataBind();
        FatherIncomeCertiList.DataSource = db.Documents.Where(q => q.documentType == "FatherIncomeCerti").ToList();
        FatherIncomeCertiList.DataBind();
        MatricCertiList.DataSource = db.Documents.Where(q => q.documentType == "MatricCerti").ToList();
        MatricCertiList.DataBind();
        List<int> universities = db.MakeChoices.Select(q => q.Uni_ID).ToList();
        TestResultDocList.DataSource = db.University_Tests.Where(q => universities.Contains(q.Uni_ID)).ToList();
        TestResultDocList.DataBind();
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);

    }
    protected void uploadStudentCNIc_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/UserDocuments/PersonalDocuments/"+ FileUploadStudentCNIC.PostedFile.FileName);
        FileUploadStudentCNIC.PostedFile.SaveAs(path);
        Personal_Details pd = db.Personal_Details.Where(q => q.User_ID == current_user).FirstOrDefault();
        if (pd != null)
        {
            Document d = new Document
            {
                documentName = FileUploadStudentCNIC.PostedFile.FileName,
                documentType = "StudentCNIC",
                userDetailID = pd.id,
                documentURL = path,
                documentSizeInKB = FileUploadStudentCNIC.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            db.SaveChanges();
        }
        bindData();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
    }

    protected void delete(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        int id = int.Parse(lb.CommandArgument.ToString());
        Document doc = db.Documents.Where(q => q.id == id).FirstOrDefault();
        if(db.TestResult_Document.Where(q=>q.documentID == id).Any())
        {
            List<TestResult_Document> TestDocs = db.TestResult_Document.Where(q => q.documentID == id).ToList();
            db.TestResult_Document.RemoveRange(TestDocs);
            db.SaveChanges();
        }
        if(doc!=null)
            db.Documents.Remove(doc);
        db.SaveChanges();
        bindData();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
    }

    protected void uploadFatherCNIC_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/UserDocuments/PersonalDocuments/" + FileUploadFatherCNIC.PostedFile.FileName);
        FileUploadFatherCNIC.PostedFile.SaveAs(path);
        Personal_Details pd = db.Personal_Details.Where(q => q.User_ID == current_user).FirstOrDefault();
        if (pd != null)
        {
            Document d = new Document
            {
                documentName = FileUploadFatherCNIC.PostedFile.FileName,
                documentType = "FatherCNIC",
                userDetailID = pd.id,
                documentURL = path,
                documentSizeInKB = FileUploadStudentCNIC.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            db.SaveChanges();
        }
        bindData();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
    }

    protected void studentCNICList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        //ScriptManager sp = (ScriptManager)Page.FindControl("ScriptManager1");
       // ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl((e.Item.FindControl("deleteStudentCNIC") as LinkButton));
        //sp.RegisterAsyncPostBackControl((e.Item.FindControl("deleteStudentCNIC") as LinkButton));
    }

    protected void uploadFatherIncomeCerti_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/UserDocuments/PersonalDocuments/" + FileUploadFatherIncomeCerti.PostedFile.FileName);
        FileUploadFatherIncomeCerti.PostedFile.SaveAs(path);
        Personal_Details pd = db.Personal_Details.Where(q => q.User_ID == current_user).FirstOrDefault();
        if (pd != null)
        {
            Document d = new Document
            {
                documentName = FileUploadFatherIncomeCerti.PostedFile.FileName,
                documentType = "FatherIncomeCerti",
                userDetailID = pd.id,
                documentURL = path,
                documentSizeInKB = FileUploadFatherIncomeCerti.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            db.SaveChanges();
        }
        bindData();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
    }

    protected void upoadMatricCerti_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/UserDocuments/EducationalDocuments/" + FileUploadMatricCerti.PostedFile.FileName);
        FileUploadMatricCerti.PostedFile.SaveAs(path);
        Personal_Details pd = db.Personal_Details.Where(q => q.User_ID == current_user).FirstOrDefault();
        if (pd != null)
        {
            Document d = new Document
            {
                documentName = FileUploadMatricCerti.PostedFile.FileName,
                documentType = "MatricCerti",
                userDetailID = pd.id,
                documentURL = path,
                documentSizeInKB = FileUploadMatricCerti.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            db.SaveChanges();
        }
        bindData();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenEducationPanel();", true);
    }

    protected void uploadIntermediateCerti_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/UserDocuments/EducationalDocuments/" + FileUploadIntermediateCerti.PostedFile.FileName);
        FileUploadIntermediateCerti.PostedFile.SaveAs(path);
        Personal_Details pd = db.Personal_Details.Where(q => q.User_ID == current_user).FirstOrDefault();
        if (pd != null)
        {
            Document d = new Document
            {
                documentName = FileUploadIntermediateCerti.PostedFile.FileName,
                documentType = "IntermediateCerti",
                userDetailID = pd.id,
                documentURL = path,
                documentSizeInKB = FileUploadIntermediateCerti.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            db.SaveChanges();
        }
        bindData(); ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenEducationPanel();", true);
    }
    

    protected void uploadTest_Click(object sender, EventArgs e)
    {

    }

    protected void TestResultDocList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       if(e.CommandName == "Add")
        {
            FileUpload fp = (FileUpload)e.Item.FindControl("FileUploadTest");
            Button lb = (Button)e.Item.FindControl("uploadTest");
            int idTest = int.Parse(lb.CommandArgument);
            string path = Server.MapPath("~/UserDocuments/TestResults/" + fp.PostedFile.FileName);
            FileUploadIntermediateCerti.PostedFile.SaveAs(path);
            Personal_Details pd = db.Personal_Details.Where(q => q.User_ID == current_user).FirstOrDefault();
            if (pd != null)
            {
                Document d = new Document
                {
                    documentName = fp.PostedFile.FileName,
                    documentType = "Test",
                    userDetailID = pd.id,
                    documentURL = path,
                    documentSizeInKB = fp.PostedFile.ContentLength / 1000,
                };
                db.Documents.Add(d);
                db.SaveChanges();
                TestResult_Document dt = new TestResult_Document
                {
                    documentID = d.id,
                    UniTestID = idTest
                };
                db.TestResult_Document.Add(dt);
                db.SaveChanges();
            }
            bindData();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenTestPanel();", true);
        }
    }

    protected void TestResultDocList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem is University_Tests)
        {
            University_Tests dataItem = e.Item.DataItem as University_Tests;
            Repeater ctrl =
                  e.Item.FindControl("testRepeater") as Repeater;
            if (ctrl != null)
            {
                ctrl.DataSource = dataItem.TestResult_Document;
                ctrl.DataBind();
            } }
    }

    protected void testRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
    }

    protected void SubmitToNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Payments.aspx");
    }
}