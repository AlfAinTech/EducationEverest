using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_Result : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = "aca4d4f8-686c-4c1b-897b-fc0057dee50f";

    protected void Page_Load(object sender, EventArgs e)
    {
        //var q = db.MakeChoices.Where(x => x.User_ID == current_user).GroupBy(x => x.Uni_ID).Select(x => x.First()).Distinct();

        //var q = db.MakeChoices.Where(k => (k.User_ID == current_user))
        //        .GroupBy(m => m.Uni_ID).Select(x => x.First()).Take(2);

        //var q = (db.MakeChoices.Where(x => x.User_ID == current_user)).GroupBy(x => x.Uni_ID).Select(y => y.First()).Distinct();

    }
}