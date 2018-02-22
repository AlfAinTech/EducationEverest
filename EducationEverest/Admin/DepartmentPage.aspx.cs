using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DepartmentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            populateDepartmentData();
        }
    }

    protected void populateDepartmentData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0, CampusID = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusID = Convert.ToInt32(Request.QueryString["cid"]);
        }
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }

        if(db.CampusProfiles.Any(a => a.CampusID == CampusID))
        {
            UniversityProfile university = db.Campuses.Where(a => a.id == CampusID).First().University.UniversityProfiles.First();
            if(university.ApplicationFeeSame == true)
            {
                tb_ApplicationFee.Text = university.ApplicationFee;
                tb_ApplicationFee.Enabled = false;
            }
            else
            {
                tb_ApplicationFee.Enabled = true;
            }
        }


        if (DepartmentId != 0)
        {

            if (db.Departments.Any(a => a.id == DepartmentId))
            {
                Department department = db.Departments.Where(a => a.id == DepartmentId).First();
                tb_DepartmentName.Text = department.Department_Name;
                DepartmentProfile departmentProfile = db.DepartmentProfiles.Where(a => a.DepartmentID == DepartmentId).First();
                tb_ApplicationFee.Text = departmentProfile.ApplicationFee;
                tb_AdmissionDocs.Text = departmentProfile.AdmissionDocs;
                tb_Criteria.Text = departmentProfile.Criteria;
            }
        }
    }



    protected void btn_addPrograms_Click(object sender, EventArgs e)
    {

        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0, CampusID = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusID = Convert.ToInt32(Request.QueryString["cid"]);
        }

        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
        }

        if (CampusID != 0)
        {
            //save Department data
            if (DepartmentId == 0)
            {
                Department newDepartment = new Department();
                newDepartment.Department_Name = tb_DepartmentName.Text;
                newDepartment.CampusID = CampusID;
                newDepartment.Status = false;

                db.Departments.Add(newDepartment);
                db.SaveChanges();

                DepartmentProfile newDepartmentProfile = new DepartmentProfile();
                newDepartmentProfile.DepartmentID = newDepartment.id;
                newDepartmentProfile.AdmissionDocs = tb_AdmissionDocs.Text;
                newDepartmentProfile.ApplicationFee = tb_ApplicationFee.Text;
                newDepartmentProfile.Criteria = tb_Criteria.Text;


                db.DepartmentProfiles.Add(newDepartmentProfile);
                db.SaveChanges();
                DepartmentId = newDepartment.id;
            }
            
        }
        else
        {
            Department existingDepartment = new Department();
            existingDepartment.Department_Name = tb_DepartmentName.Text;
            existingDepartment.Status = false;

            db.SaveChanges();

            DepartmentProfile existingDepartmentProfile = new DepartmentProfile();
            existingDepartmentProfile.AdmissionDocs = tb_AdmissionDocs.Text;
            existingDepartmentProfile.ApplicationFee = tb_ApplicationFee.Text;
            existingDepartmentProfile.Criteria = tb_Criteria.Text;
            
            db.SaveChanges();
        }
        Response.Redirect("Programs.aspx?did="+DepartmentId);
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");
    }

    protected void lb_campuses_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int DepartmentId = 0, CampusID = 0, universityID = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusID = Convert.ToInt32(Request.QueryString["cid"]);
            universityID = db.Campuses.Where(a => a.id == CampusID).First().Uni_ID;
        }
        if (Request.QueryString["did"] != null)
        {
            DepartmentId = Convert.ToInt32(Request.QueryString["did"]);
            universityID = db.Departments.Where(a => a.id == DepartmentId).First().Campus.Uni_ID;
        }
        Response.Redirect("campuses.aspx?uid=" + universityID);
    }

    protected void lb_departments_Click(object sender, EventArgs e)
    {
        int CampusID = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusID = Convert.ToInt32(Request.QueryString["cid"]);
        }
        Response.Redirect("Departments.aspx?cid=" + CampusID);
    }
}