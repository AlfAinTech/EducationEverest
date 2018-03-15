using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Upload_Documents : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!((HttpContext.Current.User.Identity.IsAuthenticated) || (HttpContext.Current.User.IsInRole("Super Admin"))))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }

        if (!Page.IsPostBack)
        { bindData();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
        }
    }

    public void bindData()
    {
        studentCNICList.DataSource = db.Documents.Where(q=>q.documentType == "StudentCNIC" && q.userID == current_user).ToList();
        studentCNICList.DataBind();
        FatherCNICList.DataSource = db.Documents.Where(q => q.documentType == "FatherCNIC" && q.userID == current_user).ToList();
        FatherCNICList.DataBind();
        FatherIncomeCertiList.DataSource = db.Documents.Where(q => q.documentType == "FatherIncomeCerti" && q.userID == current_user).ToList();
        FatherIncomeCertiList.DataBind();
        MatricCertiList.DataSource = db.Documents.Where(q => q.documentType == "MatricCerti" && q.userID == current_user).ToList();
        MatricCertiList.DataBind();
        InterCertiList.DataSource = db.Documents.Where(q => q.documentType == "IntermediateCerti" && q.userID == current_user).ToList();
        InterCertiList.DataBind();
        List<int> universities = db.MakeChoices.Where(q=>q.User_ID == current_user).Select(q => q.Uni_ID).ToList();
        TestResultDocList.DataSource = db.UniversityProfiles.Where(q => universities.Contains(q.UniversityID)).ToList();
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
                userID = current_user,
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
                userID = current_user,
                documentURL = path,
                documentSizeInKB = FileUploadStudentCNIC.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            try { db.SaveChanges(); }
            catch (Exception ex)
            {

            }
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
                userID = current_user,
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
                userID = current_user,
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
            Document d = new Document
            {
                documentName = FileUploadIntermediateCerti.PostedFile.FileName,
                documentType = "IntermediateCerti",
                userID = current_user,
                documentURL = path,
                documentSizeInKB = FileUploadIntermediateCerti.PostedFile.ContentLength / 1000,
            };
            db.Documents.Add(d);
            db.SaveChanges();
        
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
            int iduni = int.Parse(lb.CommandArgument);
            string path = Server.MapPath("~/UserDocuments/TestResults/" + fp.PostedFile.FileName);
            FileUploadIntermediateCerti.PostedFile.SaveAs(path);
           
                Document d = new Document
                {
                    documentName = fp.PostedFile.FileName,
                    documentType = "Test",
                    userID = current_user,
                    documentURL = path,
                    documentSizeInKB = fp.PostedFile.ContentLength / 1000,
                };
                db.Documents.Add(d);
                db.SaveChanges();
                TestResult_Document dt = new TestResult_Document
                {
                    documentID = d.id,
                    UniID = iduni
                };
                db.TestResult_Document.Add(dt);
                db.SaveChanges();
           
            bindData();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenTestPanel();", true);
        }
    }

    protected void TestResultDocList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem is UniversityProfile)
        {
            UniversityProfile dataItem = e.Item.DataItem as UniversityProfile;
            TestResult_Document td = db.TestResult_Document.Where(q => q.UniID == dataItem.UniversityID).FirstOrDefault();
            
            if (td != null) {
                e.Item.FindControl("documentDiv").Visible=true;
            Label ctrlsize =
                  e.Item.FindControl("documentSizeInKB") as Label;
            Label documentName =
                  e.Item.FindControl("documentName") as Label;
            LinkButton deleteButton =
                 e.Item.FindControl("delete") as LinkButton;
                
                if (ctrlsize != null)
            {
                ctrlsize.Text = td.Document.documentSizeInKB.ToString() ;
            }
            if (documentName != null)
            {
                documentName.Text = td.Document.documentName.ToString();
            }
            if (deleteButton != null)
            {
                deleteButton.CommandArgument = td.documentID.ToString() ;
            }
               
            }
        }
    }

    protected void testRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
    }

    protected void SubmitToNext_Click(object sender, EventArgs e)
    {
        HtmlImage imgpd = Master.FindControl("imgTickDocuments") as HtmlImage;
        if (imgpd != null)

        {

            imgpd.Visible = true;
            Session["IMGUD"] = "imgud";

        }


        Response.Redirect("~/Payments.aspx");
    }

  
}