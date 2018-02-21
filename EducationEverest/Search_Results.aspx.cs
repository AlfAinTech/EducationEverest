using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Search_Results : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    public void show()
    {



        var q = from University in db.Universities
                select University;
       
        rptSearch.DataSource = q.ToList();
        rptSearch.DataBind();
        var UnivName = db.Universities.Where(u => u.id == 1).Select(u => u.Name).FirstOrDefault();
        lblUniversity2.Text = UnivName;

        var AdminDetails = db.AdmissionDetails.Where(ad => ad.id == 1).Select(ad => new { criteria = ad.Criteria, admindocument = ad.AdmissionDocuments, feestructre=ad.FreeStructure}).FirstOrDefault();
        lblAdmissionDocuments.Text = AdminDetails.admindocument;
        lblCriteria.Text = AdminDetails.criteria;
        lblFeeStructure.Text = AdminDetails.feestructre;

        //coding for rating
      // University urating = db.Universities.Where(h => h.id == 2).FirstOrDefault();
        
        
        //Rating1.CurrentRating = Convert.ToInt32(urating.Rating);//get the current rating from database

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            show();
           // btn_reset.Visible = false;
            EducationEverestEntities db = new EducationEverestEntities();
           BindData();
        }
        
    }

    public void BindData()
    {
        
        string locationStatus = ddlLocation.SelectedItem.Text;
        if (locationStatus == "select location")
        {
            locationStatus = "";
        }


        //string program = ddlProgram.SelectedItem.Text;
        //if (program == "select degree")
        //{
        //    program = "";
        //}

        string universityStatus = ddlUniversityType.SelectedItem.Text;
        if (universityStatus == "select university")
        {
            universityStatus = "";
        }

        string admissionStatus = ddlAdmissionStatus.SelectedItem.Text;
        if (admissionStatus == "select admission")
        {
            admissionStatus = "";
        }

        string rankingStatus = ddlHECRanking.SelectedItem.Text;
        if (rankingStatus == "select ranking")
        {
            rankingStatus = "";
        }


        setFilters();
        FillData(locationStatus, /*program,*/ universityStatus, admissionStatus, rankingStatus);
    }




    protected void FillData(string locationStatus, /*string program,*/ string universityStatus, string admissionStatus, string rankingStatus)
    {
        EducationEverestEntities db = new EducationEverestEntities();

        var Filters = db.UniversityProfiles.Where(x => x.Address.Contains(locationStatus) /*&& x.program.Contains(program)*/ && x.Type.Contains(universityStatus) && x.AdmissionOpen.ToString().Contains(admissionStatus) && x.HecRanking.Contains(rankingStatus)).ToList();
        //dataTable.DataSource = Filters;
        //dataTable.DataBind();
    
            
        
        //else
        //{
        //    dataTable.DataSource = null;
        //    dataTable.DataBind();
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
        }
        else
        {

            var k = db.Universities.Where(x => x.Name.Contains(a)).ToList();
            rptSearch.DataSource = k;
            rptSearch.DataBind();
            
            
            
            
            
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
}