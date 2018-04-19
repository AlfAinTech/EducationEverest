using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using AjaxControlToolkit;

public partial class Filter_Results : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    protected string SearchedText = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        current_user = HttpContext.Current.User.Identity.GetUserId();
        if (!IsPostBack)
        {
            populateFilters();
            BindData();
        }

    }

    protected void populateFilters()
    {
        List<UniversityProfile> uv = db.UniversityProfiles.ToList();
        DropDownList ddlutype = (DropDownList)ddlUniversityType;
        ddlutype.DataSource = uv.Where(a => a.Type != null && a.Type != "").Select(a => a.Type).Distinct().ToList();


        ddlutype.DataBind();
        // string cid = (string.(ddlutype.SelectedValue));
        ddlutype.Items.Insert(0, new ListItem("University Type", ""));
        ddlutype.SelectedIndex = 0;



        DropDownList ddladminstatus = (DropDownList)ddlAdmissionStatus;
        //ddladminstatus.DataSource = uv.Select(a => new { atatus = a.AdmissionOpen }).Distinct().ToList();
        var statuses = uv.Where(a => a.AdmissionOpen != null).Select(a => a.AdmissionOpen).Distinct().ToList();
        ddladminstatus.DataSource = statuses;
        ddladminstatus.DataBind();
        // string cid = (string.(ddlutype.SelectedValue));
        ddladminstatus.Items.Insert(0, new ListItem("Admission Status", ""));
        ddladminstatus.SelectedIndex = 0;
        int index = 1;
        foreach (var status in statuses)
        {

            if (ddladminstatus.Items[index].Text == "True")
            {
                ddladminstatus.Items[index].Text = "Admission Open";
            }
            if (ddladminstatus.Items[index].Text == "False")
            {
                ddladminstatus.Items[index].Text = "Admission Closed";
            }
            index++;
        }





        DropDownList ddlranking = (DropDownList)ddlHECRanking;
        ddlranking.DataSource = uv.Where(a => a.HecRanking != null && a.HecRanking != "").Select(a => a.HecRanking).Distinct().ToList();

        ddlranking.DataBind();
        ddlranking.Items.Insert(0, new ListItem("HEC Ranking", ""));
        ddlranking.SelectedIndex = 0;
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
        Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
    }

    public void BindData()
    {
        if (Request.QueryString["searchBox"] != null && Request.QueryString["searchBox"] != string.Empty)
        {
            SearchedText = Request.QueryString["searchBox"];
        }
        string locationStatus = ddlLocation.SelectedItem.Text;
        if (locationStatus == "City")
        {
            locationStatus = "";
        }


       
        string universityStatus = ddlUniversityType.SelectedItem.Text;
        if (universityStatus == "University Type")
        {
            universityStatus = "";
        }

        string admissionStatus = ddlAdmissionStatus.SelectedItem.Text;
        if (admissionStatus == "Admission Status")
        {
            admissionStatus = "";
        }
        if(admissionStatus== "Admission Open")
        {
            admissionStatus = "True";

        }
        if(admissionStatus== "Admission Closed")
        {
            admissionStatus = "False";
        }

        string rankingStatus = ddlHECRanking.SelectedItem.Text;
        if (rankingStatus == "HEC Ranking")
        {
            rankingStatus = "";
        }


        setFilters();
        FillData(locationStatus, /*program,*/ universityStatus, admissionStatus, rankingStatus);
    }




    protected void FillData(string locationStatus, /*string program,*/ string universityStatus, string admissionStatus, string rankingStatus)
{
        EducationEverestEntities db = new EducationEverestEntities();
        List<UniversityProfile> Filters = db.UniversityProfiles.Where(x => x.University.Name.Contains(SearchedText) && x.Address.Contains(locationStatus) && x.Type.Contains(universityStatus) && x.AdmissionOpen.ToString().Contains(admissionStatus) && x.HecRanking.Contains(rankingStatus)/*&& x.program.Contains(program)*/).ToList();
        rptSearch.DataSource = Filters;
        rptSearch.DataBind();
        if (Filters.Count==0)
        {
            lblNoDatainFilter.Visible = true;
            Control divDetailsRightSide = FindControl("dvUnivDetailsShow");
            divDetailsRightSide.Visible = false;
        }
        else
        {
            lblNoDatainFilter.Visible = false;
            Control divDetailsRightSide = FindControl("dvUnivDetailsShow");
            divDetailsRightSide.Visible = true; 
            //show first univesity details on right side after filter search starts here
            if (ViewState["id"] != null)
            {
                int uniid = Convert.ToInt32(ViewState["id"]);
                //if (db.Universities.Any(x => x.id == uniid))
                //{
                var UnivNamedefault = db.Universities.Where(u => u.id == uniid).Select(u => u.Name).FirstOrDefault();
                if (lblUniversityName2 != null)
                {
                    lblUniversityName2.Text = UnivNamedefault;
                }
                else
                {
                    lblUniversityName2.Text = "No Institute Name to Show";
                }
                displayUniversityDetails(uniid);
            }

        }

}



    protected void setFilters()
    {

        btn_reset.Visible = false;

        if (ddlLocation.SelectedIndex > 0)
        {
            panel1.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel1.Visible = false;
        }
        
        if (ddlUniversityType.SelectedIndex > 0)
        {
            panel3.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel3.Visible = false;
        }
        if (ddlAdmissionStatus.SelectedIndex > 0)
        {
            panel4.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel4.Visible = false;
        }

        if (ddlHECRanking.SelectedIndex > 0)
        {
            panel5.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel5.Visible = false;
        }
    }
    protected void displayUniversityDetails(int UniversityId)
    {
        UniversityProfile up = new UniversityProfile();
        if (db.UniversityProfiles.Any(x => x.UniversityID == UniversityId))
        {
            var uniprofiledefault = db.UniversityProfiles.Where(ad => ad.UniversityID == UniversityId).Select(ad => new { address = ad.Address, admissionstatus = ad.AdmissionOpen }).FirstOrDefault();
            //apply and prospetcus button 
            UniversityProfile uniProfile = db.UniversityProfiles.Where(a => a.UniversityID == UniversityId).First();
            if (uniProfile.LastDate == null || uniProfile.LastDate > DateTime.Today)
            {
                btn_Apply.Style.Add("display", "block");
                btn_Apply.CommandArgument = UniversityId.ToString();
            }
            CampusProfile campusProfile = db.CampusProfiles.Where(a => a.Campus.University.id == UniversityId).First();
            if (campusProfile.ProspectusLink != null)
            {
                lb_viewProspectus.Style.Add("display", "block");
            }
            if (lblUnivAddress2.Text != null)
            {
                lblUnivAddress2.Text = uniprofiledefault.address;
            }
            else
            {
                lblUnivAddress2.Text = "Institute Address is Not Available";
            }
            if (lbl_IsAdmissionOpen2 != null)
            {
                lbl_IsAdmissionOpen2.Text = Convert.ToString(uniprofiledefault.admissionstatus);

                if (lbl_IsAdmissionOpen2.Text == "True")
                {

                    lbl_IsAdmissionOpen2.Text = "<font color='green'>Admission Open</font>";
                }
                else
                {

                    lbl_IsAdmissionOpen2.Text = "<font color='red'>Admission Closed</font>";
                }
            }
            else
            {
                lbl_IsAdmissionOpen2.Text = "Admission Status is not Available";
            }

        }

        var UnivNamedefault2 = db.Universities.Where(u => u.id == UniversityId).Select(u => u.Name).FirstOrDefault();
        if (lblUnivAddress2.Text != null)
        {
            lblUniversity2.Text = UnivNamedefault2;
        }
        else
        {
            lblUnivAddress2.Text = "Institute Address not Available";
        }

        if (db.UniversityProfiles.Any(x => x.UniversityID == UniversityId))
        {

            var uniprofiledefault2 = db.UniversityProfiles.Where(ad => ad.UniversityID == UniversityId).Select(ad => new { admissiondocuments = ad.AdmisssionDocs, criteria = ad.Criteria, feestructre = ad.FeeStructure, about = ad.About }).FirstOrDefault();
            if (lblCriteria.Text != null)
            {
                lblCriteria.Text = uniprofiledefault2.criteria;
            }
            else
            {
                lblCriteria.Text = "Criteria Not Available";
            }
            if (lblFeeStructure.Text != null)
            {
                lblFeeStructure.Text = uniprofiledefault2.feestructre;
            }
            else
            {
                lblFeeStructure.Text = "Fee Structure Not Available";
            }
            if (lblAbout.Text != null)
            {
                lblAbout.Text = uniprofiledefault2.about;
            }
            else
            {
                lblAbout.Text = "";
            }
            if (lblAdmissionDocuments.Text != null)
            {
                lblAdmissionDocuments.Text = uniprofiledefault2.admissiondocuments;
            }
            else
            {
                lblAdmissionDocuments.Text = "Admission Documents Not Available";
            }
        }


        if (db.Campuses.Any(x => x.Uni_ID == UniversityId))
        {
            CampusProfile campusProfile = new CampusProfile();
            if (db.CampusProfiles.Any(a => a.Campus.Uni_ID == UniversityId && a.MainCampus == true))
            {
                campusProfile = db.CampusProfiles.Where(a => a.Campus.Uni_ID == UniversityId && a.MainCampus == true).First();
            }
            else
            {
                campusProfile = db.CampusProfiles.Where(a => a.Campus.Uni_ID == UniversityId).First();
            }

            if (campusProfile.AdminRatings != null && campusProfile.AdminRatings != "")
            {
                Rating2.CurrentRating = Convert.ToInt32(campusProfile.AdminRatings);//get the current rating from database
                                                                                    /*   }*/                                                        //coding for rating
            }
        }
        else
        {
            Rating2.CurrentRating = 0;
        }
        if (db.UniversityMedias.Any(x => x.UniversityId == UniversityId))
        {
            string logoPath2 = db.UniversityMedias.Where(m => m.UniversityId == UniversityId).First().Path;
            if (logoPath2 != null && logoPath2 != "")
            {
                Image2.ImageUrl = logoPath2;
            }
        }
    }
    protected void delete_filter(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        string id = "panel" + lk.CommandArgument;
        
        Panel myPanel = new Panel();

        myPanel.Visible = false;
        if (id == "panel1")
        {
            ddlLocation.SelectedIndex = 0;
        }
        
        if (id == "panel3")
        {
            ddlUniversityType.SelectedIndex = 0;
        }
        if (id == "panel4")
        {
            ddlAdmissionStatus.SelectedIndex = 0;
        }
        if (id == "panel5")
        {
            ddlHECRanking.SelectedIndex = 0;
        }


        BindData();
        

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Filter_Results.aspx");
        //ddlLocation.SelectedIndex = 0;
        
        //ddlUniversityType.SelectedIndex = 0;
        //ddlAdmissionStatus.SelectedIndex = 0;
        //ddlHECRanking.SelectedIndex = 0;

        //BindData();
        
        
    }
    protected void rptSearch_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //data in repeater on page load
        //return;
        //University checkUV = new University();
        //int checkemptyUniversity = db.Universities.Count();
        //UniversityProfile checkUP = new UniversityProfile();
        //int checkemptyUniversityProfile = db.UniversityProfiles.Count();
        //Campus checkC = new Campus();
        //int checkemptyCampus = db.Campuses.Count();
        //Department checkD = new Department();
        //int checkemptyDepartment = db.Departments.Count();
        //Programm checkP = new Programm();
        //int checkemptyProgram = db.Programms.Count();
        //CampusProfile checkCP = new CampusProfile();
        //int checkemptyCampusProfile = db.CampusProfiles.Count();
        //if (checkemptyUniversity > 0 && checkemptyUniversityProfile > 0 && checkemptyCampus > 0 && checkemptyCampus > 0 && checkemptyProgram > 0 && checkemptyCampusProfile > 0)//first check if tables are not emtpy not empty
        //{



        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //get the University object that is bound to the current row.
            //University u = new University();

            UniversityProfile univ = (UniversityProfile)e.Item.DataItem;
            //rptSearch.Items.Count();

            if (e.Item.ItemIndex == 0)

            {
                var id = univ.UniversityID;
                ViewState["id"] = id;
            }
            var parentuniversityid = univ.UniversityID;
            
            // UniversityProfile up = new UniversityProfile();
            //if (db.UniversityProfiles.Any(x => x.UniversityID == univ.id))
            //{


            var univprofile = db.UniversityProfiles.Where(x => x.UniversityID == parentuniversityid).Select(ad => new { Univaddress = ad.Address, deadline = ad.LastDate, admissionopen = ad.AdmissionOpen }).FirstOrDefault();
            if (univprofile != null)
            {
                if (univprofile.Univaddress != null)
                {
                    Label lblUnivAddress = e.Item.FindControl("lblUnivAddress") as Label;
                    lblUnivAddress.Text = univprofile.Univaddress;
                }

                else


                {
                    Label lblUnivAddress = e.Item.FindControl("lblUnivAddress") as Label;
                    lblUnivAddress.Text = "Address Not Available";
                }
                if (univprofile.admissionopen != null)
                {
                    Label lbl_IsAdmissionOpen = e.Item.FindControl("lbl_IsAdmissionOpen") as Label;
                    lbl_IsAdmissionOpen.Text = Convert.ToString(univprofile.admissionopen);

                    if (lbl_IsAdmissionOpen.Text == "True")
                    {

                        lbl_IsAdmissionOpen.Text = "<font color='green'>Admission Open</font>";
                    }
                    else
                    {

                        lbl_IsAdmissionOpen.Text = "<font color='red'>Admission Closed</font>";
                    }
                }
                else
                {
                    Label lbl_IsAdmissionOpen = e.Item.FindControl("lbl_IsAdmissionOpen") as Label;
                    lbl_IsAdmissionOpen.Text = "Admission Status Not Available";
                }


                Label lblDeadLine = e.Item.FindControl("lblDeadLine") as Label;
                
                if (univprofile.deadline != null)
                {
                    lblDeadLine.Text = univprofile.deadline.Value.ToString("dd-MMM-yyyy");
                }
                else
                {
                    lblDeadLine.Text = "No Last Date";
                }
            }
            if (db.Campuses.Any(x => x.Uni_ID == parentuniversityid))
            {
                var campusid = db.Campuses.Where(a => a.Uni_ID == parentuniversityid).Select(ci => new { cid = ci.id }).FirstOrDefault();

                if (db.Departments.Any(x => x.CampusID == campusid.cid))
                {
                    var departmentdata = db.Departments.Where(a => a.CampusID == campusid.cid).Select(ci => new { departmentname = ci.Department_Name, deptid = ci.id }).Count().ToString();

                    var selectdept = db.Departments.Where(a => a.CampusID == campusid.cid).Select(ci => new { cid = ci.id }).FirstOrDefault();
                    if (db.Programms.Any(x => x.Department_ID == selectdept.cid))
                    {
                        var programdata = db.Programms.Where(a => a.Department_ID == selectdept.cid).Select(ci => new { programname = ci.Program_Name }).Count().ToString();

                        if (departmentdata != null)
                        {
                            Label lblCountDepartments = e.Item.FindControl("lblCountDepartments") as Label;
                            lblCountDepartments.Text = departmentdata;
                        }
                        else
                        {
                            Label lblCountDepartments = e.Item.FindControl("lblCountDepartments") as Label;
                            lblCountDepartments.Text = Convert.ToString(0);
                        }

                        if (programdata != null)
                        {
                            Label lblCountDegreePrograms = e.Item.FindControl("lblCountDegreePrograms") as Label;
                            lblCountDegreePrograms.Text = programdata;

                        }
                        else
                        {
                            Label lblCountDegreePrograms = e.Item.FindControl("lblCountDegreePrograms") as Label;
                            lblCountDegreePrograms.Text = Convert.ToString(0);
                        }
                    }
                    
                    //show univeristy logo here
                    UniversityMedia um = new UniversityMedia();
                    if (db.UniversityMedias.Any(x => x.UniversityId == parentuniversityid))
                    {
                        string logoPath = db.UniversityMedias.Where(m => m.UniversityId == parentuniversityid).First().Path;
                        if (logoPath != null && logoPath != "")
                        {
                            Image imgpd = e.Item.FindControl("Image1") as Image;
                            imgpd.ImageUrl = logoPath;
                        }
                    }
                    

                    

                }
            }
            else
            {
                Label lblCountDepartments = e.Item.FindControl("lblCountDepartments") as Label;
                lblCountDepartments.Text = Convert.ToString(0);

                Label lblCountDegreePrograms = e.Item.FindControl("lblCountDegreePrograms") as Label;
                lblCountDegreePrograms.Text = Convert.ToString(0);

            }
            if (db.Campuses.Any(x => x.Uni_ID == univ.UniversityID))
            {
                CampusProfile campusProfile = new CampusProfile();
                if (db.CampusProfiles.Any(a => a.Campus.Uni_ID == univ.UniversityID && a.MainCampus == true))
                {
                    campusProfile = db.CampusProfiles.Where(a => a.Campus.Uni_ID == univ.UniversityID && a.MainCampus == true).First();
                }
                else
                {
                    campusProfile = db.CampusProfiles.Where(a => a.Campus.Uni_ID == univ.UniversityID).First();
                }

                if (campusProfile.AdminRatings != null && campusProfile.AdminRatings != "")
                {
                    Rating1.CurrentRating = Convert.ToInt32(campusProfile.AdminRatings);//get the current rating from database
                                                                                        /*   }*/                                                        //coding for rating
                }
            }
            else
            {
                Rating1.CurrentRating = 0;
            }

        }





        //}
    }
    protected void rptSearch_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //on click open university details
       



       
    }
    protected void btn_UniversityClicked_Click(object sender, EventArgs e)
    { 
        //on click open university details
        int universityid = Convert.ToInt32(hf1.Value);

        var UnivName = db.Universities.Where(u => u.id == universityid).Select(u => u.Name).FirstOrDefault();
        lblUniversity2.Text = UnivName;
        lblUniversityName2.Text = UnivName;
        UniversityProfile up = new UniversityProfile();


        displayUniversityDetails(universityid);

    }
    protected void btn_Apply_Click(object sender, EventArgs e)
    {
        if (btn_Apply.CommandArgument != null)
        {
            Session["UniversityID"] = btn_Apply.CommandArgument;
            Session["appIDS"] = new List<int>();
            Session["EditMode"] = null;
            Response.Redirect("Personal_Detail.aspx");
        }

    }
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }
}
