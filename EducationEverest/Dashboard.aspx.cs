using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Dashboard : System.Web.UI.Page
{
    //public static string current_user = HttpContext.Current.User.Identity.GetUserId(); to be used later
    // public static string current_user = "b7f8e747-9167-4340-8c23-b914eda6d11f";
    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            string UserID = HttpContext.Current.User.Identity.GetUserId();
            BindData(UserID);
        }
        

    }

    public void BindData(string UserID)
    {
        ApplicationsList.DataSource = db.MakeChoices.Where(q => q.User_ID == UserID).ToList();
        ApplicationsList.DataBind();
    }
    protected void btnFileAdmission_Click(object sender, EventArgs e)
    {
        Response.Redirect("Personal_Detail.aspx");
    }

    protected void ApplicationsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rptDemo = sender as Repeater; // Get the Repeater control object.

        // If the Repeater contains no data.
        if (rptDemo.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                // Show the Error Label (if no data is present).
                 e.Item.FindControl("EmptyDiv").Visible = true;
              
            }
        }
    }
}