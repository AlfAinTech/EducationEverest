using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Filter_Results : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
  
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    public void show()
    {






        //var q = from University in db.Universities
        //        select University;
        //rptSearch.DataSource = q.ToList();
        //rptSearch.DataBind();
        if (db.UniversityProfiles.Any())
        {
            List<UniversityProfile> universities = db.UniversityProfiles.ToList();
            rptSearch.DataSource = universities;
            rptSearch.DataBind();
        }

        //var q = db.Universities.Select(ad => new { UN= ad.Name}).ToList();
        //Label uname = rptSearch.FindControl("lblUniversity") as Label;


        //rptSearch.DataSource = q.ToList();
        //rptSearch.DataBind();

        //Label lblUniversity =rptSearch.FindControl("lblUnivAddress") as Label;
        //lblUniversity.Text = lblUniversity.



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





        //return;
        //on pageload show default values for first university on right side
        University uv = new University();
        int checkempty = db.Universities.Count();
        if (checkempty > 0)//check if table has some value
        {
            {
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
                    //}
                    UniversityProfile up = new UniversityProfile();
                    if (db.UniversityProfiles.Any(x => x.UniversityID == uniid))
                    {
                        var uniprofiledefault = db.UniversityProfiles.Where(ad => ad.UniversityID == uniid).Select(ad => new { address = ad.Address, admissionstatus = ad.AdmissionOpen }).FirstOrDefault();

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

                    var UnivNamedefault2 = db.Universities.Where(u => u.id == uniid).Select(u => u.Name).FirstOrDefault();
                    if (lblUnivAddress2.Text != null)
                    {
                        lblUniversity2.Text = UnivNamedefault2;
                    }
                    else
                    {
                        lblUnivAddress2.Text = "Institute Address not Available";
                    }

                    if (db.UniversityProfiles.Any(x => x.UniversityID == uniid))
                    {

                        var uniprofiledefault2 = db.UniversityProfiles.Where(ad => ad.UniversityID == uniid).Select(ad => new { admissiondocuments = ad.AdmisssionDocs, criteria = ad.Criteria, feestructre = ad.FeeStructure, about = ad.About }).FirstOrDefault();
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
                    //default values end here
                    //}

                    if (db.Campuses.Any(x => x.Uni_ID == uniid))
                    {
                        var campusid = db.Campuses.Where(a => a.Uni_ID == uniid).Select(ci => new { cid = ci.id }).FirstOrDefault();

                        //if (db.CampusProfiles.Any(x => x.CampusID == campusid.cid))
                        //{
                        CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();

                        if (urating != null && urating.AdminRatings !=  "")
                        {
                            Rating2.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database
                                                                                          /*   }*/                                                        //coding for rating
                        }
                    }
                    if (db.UniversityMedias.Any(x => x.UniversityId == uniid))
                    {
                        string logoPath2 = db.UniversityMedias.Where(m => m.UniversityId == uniid).First().Path;
                        if (logoPath2 != null)
                        {
                            //Image imgpd2 = e.Item.FindControl("Image2") as Image;
                            Image2.ImageUrl = logoPath2;
                        }
                    }
                }
            }

        }
        else
        {
            lblNoData.Visible = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }




        current_user = HttpContext.Current.User.Identity.GetUserId();
        UserProfile up = new UserProfile();

        //code to show user information
        var logged = db.UserProfiles.Where(q => q.AspNetUserID == current_user).Select(q => new { em = q.Email, fn = q.FirstName, ln = q.LastName, c = q.City, p = q.Phone }).FirstOrDefault();
        //show user first name
        if (logged != null)
            lblLoggedUser.Text = logged.fn;







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



            //load  data in location dropdown list

            //List<UniversityProfile> uv = db.UniversityProfiles.Select(x=> x.id, x=, m.Type, m.AdmissionOpen, m.HecRanking }).Distinct().ToList();

            // var uv = db.UniversityProfiles.Select(x => new {x.id, x.Address,x.Type,x.AdmissionOpen,x.HecRanking }).ToList().Distinct();
            //List<UniversityProfile> uv = (from obj in db.UniversityProfiles
            //                             select obj).Distinct().ToList();
            //var uv = db.TestAddresses.Select(m => m.Name).Distinct();
            // var uv=  db.UniversityProfiles.Select(m => new {m.id , m.Address,m.Type,m.AdmissionOpen,m.HecRanking }).Distinct();



            //List<UniversityProfile> uv = db.UniversityProfiles.ToList();
            //DropDownList ddlcity = (DropDownList)ddlLocation;
            //foreach (var z in uv)
            //{
            //    ListItem l = new ListItem();
            //    l.Text = z.Address;
            //    l.Value = z.id.ToString();
            //    ddlcity.Items.Add(l);

            //}


            List<UniversityProfile> uv = db.UniversityProfiles.ToList();
            DropDownList ddlutype = (DropDownList)ddlUniversityType;
            ddlutype.DataSource = uv.Select(a => a.Type).Distinct().ToList();

            ddlutype.DataBind();
            // string cid = (string.(ddlutype.SelectedValue));
            ddlutype.Items.Insert(0, new ListItem("University Type", ""));
            ddlutype.SelectedIndex = 0;
            //foreach (var z in uv)
            //{
            //    ListItem l = new ListItem();
            //    l.Text = z.Type;
            //    l.Value = z.id.ToString();
            //    ddlutype.Items.Add(l);


            //}


            DropDownList ddladminstatus = (DropDownList)ddlAdmissionStatus;
            //ddladminstatus.DataSource = uv.Select(a => new { atatus = a.AdmissionOpen }).Distinct().ToList();
            var statuses = uv.Select(a => a.AdmissionOpen).Distinct().ToList();
            ddladminstatus.DataSource = statuses;
            ddladminstatus.DataBind();
            // string cid = (string.(ddlutype.SelectedValue));
            ddladminstatus.Items.Insert(0, new ListItem("Admission Status", ""));
            ddladminstatus.SelectedIndex = 0;
            int index = 1;
            foreach(var status in statuses)
            {

                if(ddladminstatus.Items[index].Text == "True")
                {
                    ddladminstatus.Items[index].Text = "Admission Open";
                }
                if(ddladminstatus.Items[index].Text== "False")
                {
                    ddladminstatus.Items[index].Text = "Admission Closed";
                }
                index++;
            }
            //if (ddladminstatus.Text=="True")
            //{
            //    ddladminstatus.Text = "Admission Open";
            //}
            //if(ddladminstatus.Text=="False")
            //{
            //    ddladminstatus.Text = "Admission Closed";
            //}
            
            
            //foreach (var z in uv)
            //{
            //    ListItem l = new ListItem();
            //    l.Text =Convert.ToString( z.AdmissionOpen);
            //     if (l.Text == "True")
            //                {

            //        l.Text = "Admission Open";
            //                }
            //                else
            //                {

            //        l.Text = "Admission Closed";
            //                }

            //    l.Value = z.id.ToString();
            //    ddladminstatus.Items.Add(l);

            //}




            DropDownList ddlranking = (DropDownList)ddlHECRanking;
            ddlranking.DataSource = uv.Select(a => a.HecRanking).Distinct().ToList();

            ddlranking.DataBind();
            // string cid = (string.(ddlutype.SelectedValue));
            ddlranking.Items.Insert(0, new ListItem("HEC Ranking", ""));
            ddlranking.SelectedIndex = 0;

            //foreach (var z in uv)
            //{
            //    ListItem l = new ListItem();
            //    l.Text = z.HecRanking;
            //    l.Value = z.id.ToString();
            //    ddlranking.Items.Add(l);

            //}






        }

    }


    protected void logout_Click(object sender, EventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
        Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
    }

    public void BindData()
    {

        string locationStatus = ddlLocation.SelectedItem.Text;
        if (locationStatus == "City")
        {
            locationStatus = "";
        }


        //string program = ddlProgram.SelectedItem.Text;
        //if (program == "select degree")
        //{
        //    program = "";
        //}

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

        //if(admissionStatus== "Admission Open")
        //{
        //    admissionStatus == "True";

        //}

        //if (db.UniversityProfiles.Any())
        //{

        //var AllFilters = db.UniversityProfiles.ToList();
        //var defaultdata = db.UniversityProfiles.Select(x => new { x.Address, x.Type, x.AdmissionOpen, x.HecRanking }).ToList();


        //if (locationStatus != null)
        //{
         
                 
        //}



        //List<University> universities = db.Universities.Where(x => x.Name.Contains(a)).ToList();

        //rptSearch.DataSource = universities;

        //rptSearch.DataBind();
        List<UniversityProfile> Filters = db.UniversityProfiles.Where(x => x.Address.Contains(locationStatus) && x.Type.Contains(universityStatus) && x.AdmissionOpen.ToString().Contains(admissionStatus) && x.HecRanking.Contains(rankingStatus)/*&& x.program.Contains(program)*/).ToList();
        //var Filters = db.UniversityProfiles.Where(x => x.Address.Contains(locationStatus) /*&& x.program.Contains(program)*/ && x.Type.Contains(universityStatus) && x.AdmissionOpen.ToString().Contains(admissionStatus) && x.HecRanking.Contains(rankingStatus)).ToList();

       // Filters[0].University.Name;



       rptSearch.DataSource = Filters;

       rptSearch.DataBind();
        if (Filters.Count==0)
        {
            lblNoDatainFilter.Visible = true;
        }
        else
        {
            lblNoDatainFilter.Visible = false;
        }


        //}

        //else
        //{
        //    rptSearch.DataSource = null;
        //    rptSearch.DataBind();
        //}
    
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
        //if (ddlProgram.SelectedIndex > 0)
        //{
        //    panel2.Visible = true;
        //    btn_reset.Visible = true;
        //}
        //else
        //{
        //    panel2.Visible = false;
        //}
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
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        BindData();
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


            //List<University> universities = db.Universities.Where(x => x.Name.Contains(a)).ToList();

            //rptSearch.DataSource = universities;

            //rptSearch.DataBind();



            List<UniversityProfile> universities = db.UniversityProfiles.Where(x => x.University.Name.Contains(a)).ToList();

            rptSearch.DataSource = universities;

            rptSearch.DataBind();




            //show search count code
            University checkUV = new University();
            int checkemptyUniversity = db.Universities.Count();
            if (checkemptyUniversity > 0)
            {
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

    }
    protected void delete_filter(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        string id = "panel" + lk.CommandArgument;
        // ContentPlaceHolder cont = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
        // Panel myPanel = (Panel)cont.FindControl(id);
        Panel myPanel = new Panel();

        myPanel.Visible = false;
        if (id == "panel1")
        {
            ddlLocation.SelectedIndex = 0;
        }
        //if (id == "panel2")
        //{
        //    ddlProgram.SelectedIndex = 0;
        //}
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

        ddlLocation.SelectedIndex = 0;
        //ddlProgram.SelectedIndex = 0;
        ddlUniversityType.SelectedIndex = 0;
        ddlAdmissionStatus.SelectedIndex = 0;
        ddlHECRanking.SelectedIndex = 0;

        BindData();
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
            //Label lblUniversity = e.Item.FindControl("lblUniversity") as Label;
            //lblUniversity.Text = univ.Name;
            
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
                //lblDeadLine.Text = Convert.ToString(univprofile.deadline);
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
                    //coding for rating
                    if (db.CampusProfiles.Any(x => x.CampusID == campusid.cid))
                    {
                        CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();

                        if (urating.AdminRatings != null && urating.AdminRatings != "")
                        {
                            Rating1.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database
                        }
                        else
                        {
                            //default rating
                            Rating1.CurrentRating = 2;
                        }
                    }
                    //show univeristy logo here
                    UniversityMedia um = new UniversityMedia();
                    if (db.UniversityMedias.Any(x => x.UniversityId == parentuniversityid))
                    {
                        string logoPath = db.UniversityMedias.Where(m => m.UniversityId == parentuniversityid).First().Path;
                        if (logoPath != null)
                        {
                            Image imgpd = e.Item.FindControl("Image1") as Image;
                            imgpd.ImageUrl = logoPath;
                        }
                    }
                    //Image Image1 = e.Item.FindControl("Path") as Image;
                    //Image1.ImageUrl = logoPath;
                    //rptSearch.DataSource = logo.ToList();
                    //rptSearch.DataBind();

                    //bind repeater here







                    //end of data on page load in repeater



                }
            }

        }





        //}
    }






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

           
            var uniprofile = db.UniversityProfiles.Where(ad => ad.UniversityID == universityid).Select(ad => new { admissiondocuments = ad.AdmisssionDocs, criteria = ad.Criteria, feestructre = ad.FeeStructure, about = ad.About, address = ad.Address, admissionstatus = ad.AdmissionOpen }).FirstOrDefault();
            if (uniprofile != null)
            {
                if (lblCriteria.Text != null)
                {
                    lblCriteria.Text = uniprofile.criteria;
                }
                else
                {
                    lblCriteria.Text = "Criteria not given";
                }
                if (lblFeeStructure.Text != null)
                {
                    lblFeeStructure.Text = uniprofile.feestructre;
                }
                else
                {
                    lblFeeStructure.Text = "Fee structure is not given";
                }
                if (lblAbout.Text != null)
                {


                    lblAbout.Text = uniprofile.about;
                }
                else
                {
                    lblAbout.Text = "";
                }
                if (lblAdmissionDocuments.Text != null)
                {


                    lblAdmissionDocuments.Text = uniprofile.admissiondocuments;
                }
                else
                {
                    lblAdmissionDocuments.Text = "Admission documents not mentioned";
                }
                if (lblUnivAddress2.Text != null)
                {
                    lblUnivAddress2.Text = uniprofile.address;
                }
                else
                {
                    lblUnivAddress2.Text = "Address not given";
                }


                lbl_IsAdmissionOpen2.Text = Convert.ToString(uniprofile.admissionstatus);
                if (lbl_IsAdmissionOpen2.Text != null)
                {

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
                    lbl_IsAdmissionOpen2.Text = "Admission status not mentioned";
                }
            }//uniprofile ends here





            //code for rating

            if (db.Campuses.Any(x => x.Uni_ID == universityid))
            {
                var campusid = db.Campuses.Where(a => a.Uni_ID == universityid).Select(ci => new { cid = ci.id }).FirstOrDefault();
                CampusProfile urating = db.CampusProfiles.Where(h => h.CampusID == campusid.cid).FirstOrDefault();

                if (urating != null)
                {
                    Rating2.CurrentRating = Convert.ToInt32(urating.AdminRatings);//get the current rating from database
                }

            }
            if (db.UniversityMedias.Any(x => x.UniversityId == universityid))
            {
                string logoPath2 = db.UniversityMedias.Where(m => m.UniversityId == universityid).First().Path;
                if (logoPath2 != null)
                {
                    //Image imgpd2 = e.Item.FindControl("Image2") as Image;
                    Image2.ImageUrl = logoPath2;
                }
            }
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
