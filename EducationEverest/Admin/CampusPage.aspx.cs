using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CampusPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Super Admin"))))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        else if (!Page.IsPostBack)
        {
            popualteCampusData();
        }
    }

    protected void popualteCampusData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }

        if (CampusId != 0)
        {

            if (db.Campuses.Any(a => a.id == CampusId))
            {
                Campus campus = db.Campuses.Where(a => a.id == CampusId).First();
                tb_campusName.Text = campus.Campus_Name;
                CampusProfile campusProfile = db.CampusProfiles.Where(a => a.CampusID == CampusId).First();
                tb_campusEmail.Text = campusProfile.Email;
                tb_prospectusLink.Text = campusProfile.ProspectusLink;
                
                tb_campusAddress.Text = campusProfile.Address;
                tb_campusContact1.Text = campusProfile.Contact1;
                tb_campusContact2.Text = campusProfile.Contact2;
                tb_campusContact3.Text = campusProfile.Contact3;
                tb_Ratings.Text = campusProfile.AdminRatings;
                
                cb_NoMc.Checked = true;
                cb_yesMC.Checked = false;
                if(campusProfile.MainCampus == true)
                {
                    cb_yesMC.Checked = true;
                    cb_NoMc.Checked = false;
                }
                //tb_applicationFee.Text = campusProfile.ApplicationFee;

                //Enable Departments button if admin has already some categories

                if(db.Categories.Any(a => a.CampusID == CampusId))
                {
                    btn_addDepartments.Enabled = true;
                }
                else
                {
                    btn_addDepartments.Enabled = false;
                }
            }
        }
    }

    
    protected void save_CampusDetails()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int UniversityId = 0, CampusID = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }

        if (Request.QueryString["cid"] != null)
        {
            CampusID = Convert.ToInt32(Request.QueryString["cid"]);
        }

        if (UniversityId != 0)
        {
            //save university data
            if (CampusID == 0)
            {
                Campus newCampus = new Campus();
                newCampus.Campus_Name = tb_campusName.Text;
                newCampus.Uni_ID = UniversityId;
                newCampus.Status = false;

                db.Campuses.Add(newCampus);
                db.SaveChanges();

                CampusProfile newCampusProfile = new CampusProfile();
                newCampusProfile.CampusID = newCampus.id;
                newCampusProfile.Contact1 = tb_campusContact1.Text;
                newCampusProfile.Contact2 = tb_campusContact2.Text;
                newCampusProfile.Contact3 = tb_campusContact3.Text;
                newCampusProfile.Address = tb_campusAddress.Text;
                newCampusProfile.Email = tb_campusEmail.Text;
                newCampusProfile.AdminRatings = tb_Ratings.Text;
               
                newCampusProfile.MainCampus = false;
                if (cb_yesMC.Checked)
                {
                    newCampusProfile.MainCampus = true;
                }


                db.CampusProfiles.Add(newCampusProfile);
                db.SaveChanges();
                ViewState["CampusId"] = newCampus.id.ToString();
            }
            else
            {

                Campus existingCampus = db.Campuses.Where(a => a.id == CampusID).First();
                existingCampus.Campus_Name = tb_campusName.Text;
                existingCampus.Uni_ID = UniversityId;
                existingCampus.Status = false;

                db.SaveChanges();

                CampusProfile existingCampusProfile = db.CampusProfiles.Where(a => a.CampusID == CampusID).First();
                existingCampusProfile.Contact1 = tb_campusContact1.Text;
                existingCampusProfile.Contact2 = tb_campusContact2.Text;
                existingCampusProfile.Contact3 = tb_campusContact3.Text;
                existingCampusProfile.Address = tb_campusAddress.Text;
                existingCampusProfile.Email = tb_campusEmail.Text;
                existingCampusProfile.AdminRatings = tb_Ratings.Text;
                
                existingCampusProfile.MainCampus = false;
                if (cb_yesMC.Checked)
                {
                    existingCampusProfile.MainCampus = true;
                }
                db.SaveChanges();
            }

        }
    }

    protected void btn_addDepartments_Click(object sender, EventArgs e)
    {
        save_CampusDetails();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        else
        {
            CampusId = Convert.ToInt32(ViewState["CampusId"]);
        }

        Response.Redirect("Departments.aspx?cid=" + CampusId);
    }

    protected void btn_addCategories_Click(object sender, EventArgs e)
    {
        save_CampusDetails();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        else
        {
            CampusId = Convert.ToInt32(ViewState["CampusId"]);
        }

        Response.Redirect("Categories.aspx?cid=" + CampusId);
    }

    protected void cb_yesMC_CheckedChanged(object sender, EventArgs e)
    {
        if (cb_yesMC.Checked)
        {
            cb_NoMc.Checked = false;
        }
        else
        {
            cb_NoMc.Checked = true;
        }
    }

    protected void cb_NoMc_CheckedChanged(object sender, EventArgs e)
    {
        if (cb_NoMc.Checked)
        {
            cb_yesMC.Checked = false;
        }else
        {
            cb_yesMC.Checked = true;
        }

    }

    

    protected void lb_campuses_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        int universityId = db.Campuses.Where(a => a.id == CampusId).First().Uni_ID;
        Response.Redirect("campuses.aspx?uid="+universityId);
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");
    }
}