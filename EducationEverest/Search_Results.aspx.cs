using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class Search_Results : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    public void show()
    {



        var q = from University in db.Universities
                select University;

        //var q1 = from u in db.Universities
        //         join um in db.UniversityMedias on u.id equals um.UniversityId
        //         select new  { u.id, u.Name, um.Path };
        //var q1 = from u in db.Universities
        //         join um in db.UniversityMedias on u.id equals um.UniversityId //previous.id equals present.id
        //         join up in db.UniversityProfiles on u.id equals up.UniversityID
        //         join cam in db.Campuses on u.id equals cam.Uni_ID
        //         join camp in db.CampusProfiles on cam.id equals camp.CampusID

        //         orderby u.id 
        //         select new { u.id, u.Name, um.Path, up.Address, up.LastDate, up.AdmissionOpen, rating = camp.AdminRatings};




        rptSearch.DataSource = q.ToList();
        rptSearch.DataBind();
        
        //return;
        //on pageload show default values for first university on right side
        University uv = new University();
        int checkempty = db.Universities.Count();
        if (checkempty > 0)//check if table has some value
        {
            {
                if (ViewState["id"] != null)
                {
                    int uniid =Convert.ToInt32( ViewState["id"]);

                    var UnivNamedefault = db.Universities.Where(u => u.id == uniid).Select(u => u.Name).FirstOrDefault();
                    lblUniversityName2.Text = UnivNamedefault;

                    UniversityProfile up = new UniversityProfile();
                    var uniprofiledefault = db.UniversityProfiles.Where(ad => ad.UniversityID==uniid).Select(ad => new { address = ad.Address, admissionstatus = ad.AdmissionOpen }).FirstOrDefault();


                    lblUnivAddress2.Text = uniprofiledefault.address;
                    lbl_IsAdmissionOpen2.Text = Convert.ToString(uniprofiledefault.admissionstatus);

                    if (lbl_IsAdmissionOpen2.Text == "True")
                    {

                        lbl_IsAdmissionOpen2.Text = "<font color='green'>Admission Open</font>";
                    }
                    else
                    {

                        lbl_IsAdmissionOpen2.Text = "<font color='red'>Admission Closed</font>";
                    }




                    var UnivNamedefault2 = db.Universities.Where(u => u.id == uniid).Select(u => u.Name).FirstOrDefault();
                    lblUniversity2.Text = UnivNamedefault2;

                    var uniprofiledefault2 = db.UniversityProfiles.Where(ad => ad.UniversityID==uniid).Select(ad => new { admissiondocuments = ad.AdmisssionDocs, criteria = ad.Criteria, feestructre = ad.FeeStructure, about = ad.About }).FirstOrDefault();

                    lblCriteria.Text = uniprofiledefault2.criteria;
                    lblFeeStructure.Text = uniprofiledefault2.feestructre;
                    lblAbout.Text = uniprofiledefault2.about;
                    lblAdmissionDocuments.Text = uniprofiledefault2.admissiondocuments;
                    //default values end here



                    var campusid = db.Campuses.Where(a => a.Uni_ID == 3).Select(ci => new { cid = ci.id }).FirstOrDefault();

                    CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();


                    Rating2.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database
                                                                                  //coding for rating
                    
                }
            }

        }
    } 
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        if (!IsPostBack)
        {



            show();
            if (Request.QueryString["searchBox"] != null && Request.QueryString["searchBox"] != string.Empty)
            {
                TextBox1.Text = Request.QueryString["searchBox"];
                btnSearch_Click(sender, e);
            }
            // btn_reset.Visible = false;
            EducationEverestEntities db = new EducationEverestEntities();

        }

    }


    //basic search

    protected void btnSearch_Click(object sender, EventArgs e)
    {


        var a = TextBox1.Text;
        if (a == "")
        {
            show();
            lblShowSearchCount.Visible = false;
            lblcount.Visible = false;
        }
        else
        {

            List<University> universities = db.Universities.Where(x => x.Name.Contains(a)).ToList();

            rptSearch.DataSource = universities;

            rptSearch.DataBind();


            //show search count code
            lblcount.Text = db.Universities.Where(x => x.Name.Contains(a)).Count().ToString();
            lblcount.Visible = true;
            if (lblcount.Visible == true)

            {
                var showcount = "Result(s) found related to " + TextBox1.Text;
                lblShowSearchCount.Text = showcount;
                lblShowSearchCount.Visible = true;
            }

        }


    }

    protected void rptSearch_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //data in repeater on page load
        //return;
        University checkUV = new University();
        int checkemptyUniversity = db.Universities.Count();
        UniversityProfile checkUP = new UniversityProfile();
        int checkemptyUniversityProfile = db.UniversityProfiles.Count();
        Campus checkC = new Campus();
        int checkemptyCampus = db.Campuses.Count();
        Department checkD = new Department();
        int checkemptyDepartment = db.Departments.Count();
        Programm checkP = new Programm();
        int checkemptyProgram = db.Programms.Count();
        CampusProfile checkCP = new CampusProfile();
        int checkemptyCampusProfile = db.CampusProfiles.Count();
        if (checkemptyUniversity > 0 && checkemptyUniversityProfile > 0 && checkemptyCampus > 0 && checkemptyCampus > 0 && checkemptyProgram > 0 && checkemptyCampusProfile > 0)//first check if tables are not emtpy not empty
        {
            


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //get the University object that is bound to the current row.
                University u = new University();
                University univ = (University)e.Item.DataItem;
                //rptSearch.Items.Count();
                
                if(e.Item.ItemIndex == 0)

                {
                    var id = univ.id;
                    ViewState["id"] = id;
                }
                

                UniversityProfile up = new UniversityProfile();
                var univprofile = db.UniversityProfiles.Where(x => x.UniversityID == univ.id).Select(ad => new { Univaddress = ad.Address, deadline = ad.LastDate, admissionopen = ad.AdmissionOpen }).FirstOrDefault();

                Label lblUnivAddress = e.Item.FindControl("lblUnivAddress") as Label;
                lblUnivAddress.Text = univprofile.Univaddress;

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



                Label lblDeadLine = e.Item.FindControl("lblDeadLine") as Label;
                //lblDeadLine.Text = Convert.ToString(univprofile.deadline);
                if (univprofile.deadline != null)
                {
                    lblDeadLine.Text = univprofile.deadline.Value.ToString("dd-MMM-yyyy");
                }
                else
                {
                    lblDeadLine.Text = "No Last Date";
                }
                

                var campusid = db.Campuses.Where(a => a.Uni_ID == univ.id).Select(ci => new { cid = ci.id }).FirstOrDefault();
                var departmentdata = db.Departments.Where(a => a.id == campusid.cid).Select(ci => new { departmentname = ci.Department_Name }).Count().ToString();
                var programdata = db.Programms.Where(a => a.id == a.Department_ID).Select(ci => new { programname = ci.Program_Name }).Count().ToString();

                Label lblCountDepartments = e.Item.FindControl("lblCountDepartments") as Label;
                lblCountDepartments.Text = departmentdata;


                Label lblCountDegreePrograms = e.Item.FindControl("lblCountDegreePrograms") as Label;
                lblCountDegreePrograms.Text = programdata;



                //coding for rating
                CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();

                if (urating.AdminRatings != null)
                {
                    Rating1.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database
                }
                else
                {
                    //default rating
                    Rating1.CurrentRating = 2;
                }

                //show univeristy logo here
                UniversityMedia um = new UniversityMedia();
                string logoPath = db.UniversityMedias.Where(m => m.UniversityId == univ.id).First().Path;
                Image imgpd = e.Item.FindControl("Image1") as Image;
                imgpd.ImageUrl = logoPath;
                
                //Image Image1 = e.Item.FindControl("Path") as Image;
                //Image1.ImageUrl = logoPath;
                //rptSearch.DataSource = logo.ToList();
                //rptSearch.DataBind();

                //bind repeater here







                //end of data on page load in repeater




            }
            
        }
    }
    //    }
    //}



    protected void rptSearch_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //on click open university details
        int universityid;
        if (int.TryParse((string)e.CommandArgument, out universityid))
        {
            var UnivName = db.Universities.Where(u => u.id == universityid).Select(u => u.Name).FirstOrDefault();
            lblUniversity2.Text = UnivName;
            lblUniversityName2.Text = UnivName;
            UniversityProfile up = new UniversityProfile();
            var uniprofile = db.UniversityProfiles.Where(ad => ad.UniversityID == universityid).Select(ad => new { admissiondocuments = ad.AdmisssionDocs, criteria = ad.Criteria, feestructre = ad.FeeStructure,about=ad.About,address=ad.Address,admissionstatus=ad.AdmissionOpen }).FirstOrDefault();
            
            lblCriteria.Text = uniprofile.criteria;
            lblFeeStructure.Text = uniprofile.feestructre;
            lblAbout.Text = uniprofile.about;
            lblAdmissionDocuments.Text = uniprofile.admissiondocuments;
            lblUnivAddress2.Text = uniprofile.address;
            lbl_IsAdmissionOpen2.Text= Convert.ToString(uniprofile.admissionstatus);

            if (lbl_IsAdmissionOpen2.Text == "True")
            {

                lbl_IsAdmissionOpen2.Text = "<font color='green'>Admission Open</font>";
            }
            else
            {

                lbl_IsAdmissionOpen2.Text = "<font color='red'>Admission Closed</font>";
            }
            //code for rating
            var campusid = db.Campuses.Where(a => a.Uni_ID == universityid).Select(ci => new { cid = ci.id }).FirstOrDefault();
            CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();


            Rating2.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database




            //var campusid = db.Campuses.Where(a => a.Uni_ID == universityid).Select(ci => new { cid = ci.id }).FirstOrDefault();
            //CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();


            //Rating1.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database
            // Use the ID here...
        }



        //if(e.CommandName == "Select")
        //{
        //    LinkButton btn = e.CommandSource as LinkButton;
        //    var lbid = 
        //    //Console.Write("hell");
        //}
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    //get the University object that is bound to the current row.
        //    University univ = (University)e.Item.DataItem;

        //    var id = univ.id;
        //}
    }


}
 