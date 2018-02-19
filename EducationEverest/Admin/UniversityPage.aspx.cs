using System;

using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UniversityPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            PopulateUniversityData();
        }
    }

    protected void PopulateUniversityData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        
        if (UniversityId != 0)
        {

            if(db.Universities.Any(a => a.id == UniversityId))
            {
                University university = db.Universities.Where(a => a.id == UniversityId).First();
                tb_uniName.Text = university.Name;
                UniversityProfile universityProfile = db.UniversityProfiles.Where(a => a.UniversityID == UniversityId).First();
                tb_uniEmail.Text = universityProfile.Email;
                tb_TestName.Text = universityProfile.TestName;
                tb_FeeStructure.Text = universityProfile.FeeStructure;
                tb_HecRanking.Text = universityProfile.HecRanking;
                tb_uniAddress.Text = universityProfile.Address;
                tb_uniContact1.Text = universityProfile.Contact1;
                tb_uniContact2.Text = universityProfile.Contact2;
                tb_uniContact3.Text = universityProfile.Contact3;
                ddl_UniversityType.SelectedItem.Text = universityProfile.Type;

            }
        }
    }

    protected void btn_addCampuses_Click(object sender, EventArgs e)
    {
        //save university data
        EducationEverestEntities db = new EducationEverestEntities();
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        if (UniversityId == 0)
        {
            University newUniversity = new University();
            newUniversity.Name = tb_uniName.Text;
           // newUniversity.Status = false;

            db.Universities.Add(newUniversity);
            db.SaveChanges();

            //save university logo 
            string filePath = "";
            if (fu_logo.PostedFile != null && fu_logo.PostedFile.ContentLength > 0)
            {

                string fileName = Path.GetFileName(fu_logo.PostedFile.FileName);
                string folder = Server.MapPath("~/Content/UniversityMedia/");
                filePath = Path.Combine(folder, fileName);
                fu_logo.PostedFile.SaveAs(filePath);
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
            UniversityMedia newUniversityMedia = new UniversityMedia();
            newUniversityMedia.UniversityId = newUniversity.id;
            newUniversityMedia.Path = filePath;

            db.UniversityMedias.Add(newUniversityMedia);
            db.SaveChanges();

            UniversityProfile newUniversityProfile = new UniversityProfile();
            newUniversityProfile.UniversityID = newUniversity.id;
            newUniversityProfile.Contact1 = tb_uniContact1.Text;
            newUniversityProfile.Contact2 = tb_uniContact2.Text;
            newUniversityProfile.Contact1 = tb_uniContact1.Text;
            newUniversityProfile.Contact3 = tb_uniContact3.Text;
            newUniversityProfile.Address = tb_uniAddress.Text;
            newUniversityProfile.Email = tb_uniEmail.Text;
            newUniversityProfile.HecRanking = tb_HecRanking.Text;
            newUniversityProfile.TestName = tb_TestName.Text;
            newUniversityProfile.Type = ddl_UniversityType.SelectedItem.Text;
            newUniversityProfile.FeeStructure = tb_FeeStructure.Text;

            db.UniversityProfiles.Add(newUniversityProfile);
            db.SaveChanges();

            Response.Redirect("campuses.aspx?uid=" + newUniversity.id);
        }
        else
        {
            University existingUniversity = db.Universities.Where(a => a.id == UniversityId).First();
            existingUniversity.Name = tb_uniName.Text;
           // existingUniversity.Status = false;

            //save university logo 
            string filePath = "";
            if (fu_logo.PostedFile != null && fu_logo.PostedFile.ContentLength > 0)
            {

                string fileName = Path.GetFileName(fu_logo.PostedFile.FileName);
                string folder = Server.MapPath("~/Content/UniversityMedia/");
                filePath = Path.Combine(folder, fileName);
                fu_logo.PostedFile.SaveAs(filePath);
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
            UniversityMedia existingUniversityMedia = db.UniversityMedias.Where(a => a.UniversityId == UniversityId).First();
            existingUniversityMedia.Path = filePath;
            db.SaveChanges();

            UniversityProfile existingUniversityProfile = db.UniversityProfiles.Where(a => a.UniversityID == UniversityId).First();
            existingUniversityProfile.Contact1 = tb_uniContact1.Text;
            existingUniversityProfile.Contact2 = tb_uniContact2.Text;
            existingUniversityProfile.Contact1 = tb_uniContact1.Text;
            existingUniversityProfile.Contact3 = tb_uniContact3.Text;
            existingUniversityProfile.Address = tb_uniAddress.Text;
            existingUniversityProfile.Email = tb_uniEmail.Text;
            existingUniversityProfile.HecRanking = tb_HecRanking.Text;
            existingUniversityProfile.TestName = tb_TestName.Text;
            existingUniversityProfile.Type = ddl_UniversityType.SelectedItem.Text;
            existingUniversityProfile.FeeStructure = tb_FeeStructure.Text;
            
            db.SaveChanges();

            Response.Redirect("campuses.aspx?uid=" + UniversityId);
        }
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");

    }
}