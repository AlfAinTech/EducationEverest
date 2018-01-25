using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Personal_Details : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = "aca4d4f8-686c-4c1b-897b-fc0057dee50f";


    public void populate_personal_details()
    {
        if(db.Personal_Details.Any(x=> x.User_ID == current_user))
        {
            var personal = db.Personal_Details.Where(x=> x.User_ID == current_user).First();
            student_name.Value = personal.Name;
            father_name.Value = personal.Father_Name;
            cnic.Value = personal.CNIC;
            father_cnic.Value = personal.Father_CNIC;
            dob.Value = personal.DOB.ToString();
            nationality.Value = personal.Nationality;
        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            populate_personal_details();
        }
    }
}