using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payments : System.Web.UI.Page
{
    public static string current_user = HttpContext.Current.User.Identity.GetUserId();
    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!(HttpContext.Current.User.Identity.IsAuthenticated))
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
            }

            current_user = HttpContext.Current.User.Identity.GetUserId();
            List<Application> applicationList =  db.Applications.Where(q => q.UserID == current_user).ToList();
            ChoicesList.DataSource  = applicationList;
            ChoicesList.DataBind();
            totalInvoice.Text = applicationList.Select(q => q.Fees).DefaultIfEmpty(0).Sum().ToString();
           
        }
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);

    }



    protected void SubmitTrackingID_Click(object sender, EventArgs e)
    {
        List<Application> apps = db.Applications.Where(q => q.UserID == current_user).ToList();
        foreach(Application app in apps)
        { 
        Payment p = new Payment()
        {
            TrackingID = TrackingID.Value.ToString(),
            AppID =app.id,
        };
            db.Payments.Add(p);
            db.SaveChanges();
        }
    }
}