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
        }
        else
        {

            var k = db.Universities.Where(x => x.Name.Contains(a)).ToList();
            rptSearch.DataSource = k;
            rptSearch.DataBind();
            
            
            
            
            
        }

    }
   
}