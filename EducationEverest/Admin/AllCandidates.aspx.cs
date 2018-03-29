using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AllCandidates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            
            btn_reset.Visible = false;
            EducationEverestEntities db = new EducationEverestEntities();
            if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Super Admin"))))
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
            }
            else
            {
                BindData();
            }
            //BindData();
        }

    }
    public void BindData()
    {
        string CandidateId = "";
        if (tb_CandidateId.Text != "" && !String.IsNullOrWhiteSpace(tb_CandidateId.Text))
        {
            CandidateId = tb_CandidateId.Text;

        }
        else
        {
            tb_CandidateId.Text = "";
        }
        string Fname = "";
        if(tb_Fname.Text != "" && !string.IsNullOrWhiteSpace(tb_Fname.Text))
        {
            Fname = tb_Fname.Text;
        }
        string Lname = "";
        if (tb_Lname.Text != "" && !string.IsNullOrWhiteSpace(tb_Lname.Text))
        {
            Lname = tb_Lname.Text;
        }
        string Username = "";
        if (tb_username.Text != "" && !string.IsNullOrWhiteSpace(tb_username.Text))
        {
            Username = tb_username.Text;
        }

        setFilters();
        FillData(CandidateId, Fname, Lname, Username);
    }


    protected void FillData(string CandidateId, string Fname, string Lname, string Username)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        if (db.AspNetUsers.Any())
        {
            List<UserProfile> users = db.UserProfiles.Where(x => x.CandidateID.Contains(CandidateId) && x.AspNetUser.UserName.Contains(Username) && x.FirstName.Contains(Fname) && x.LastName.Contains(Lname)).ToList();
            List<UserProfile> admins = new List<UserProfile>();
            foreach (var user in users)
            {
                
                if(user.AspNetUser.AspNetRoles.ToList().Any(a => a.Name.Contains("Super Admin")))
                {
                    admins.Add(user);
                }
            }
            
            

            dataTable.DataSource = users.Except(admins).ToList();
            dataTable.DataBind();
            
        }
        else
        {
            dataTable.DataSource = null;
            dataTable.DataBind();
        }
    }

    protected void setFilters()
    {

        btn_reset.Visible = false;

        if (tb_CandidateId.Text != "")
        {
            btn_reset.Visible = true;
            panel1.Visible = true;
        }
        else
        {

            panel1.Visible = false;
        }
        if (tb_Fname.Text != "")
        {
            btn_reset.Visible = true;
            panel2.Visible = true;
        }
        else
        {

            panel2.Visible = false;
        }
        if (tb_Lname.Text != "")
        {
            btn_reset.Visible = true;
            panel3.Visible = true;
        }
        else
        {

            panel3.Visible = false;
        }
        if (tb_username.Text != "")
        {
            btn_reset.Visible = true;
            panel4.Visible = true;
        }
        else
        {

            panel4.Visible = false;
        }
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        BindData();
    }
    protected void dataTable_RowCommand(object sender, GridViewCommandEventArgs e)
    {
    }

    protected void dataTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        dataTable.PageIndex = e.NewPageIndex;
        BindData();
    }

    protected void dataTable_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void ddl_paging_size_SelectedIndexChanged(object sender, EventArgs e)
    {
        var selectedValue = ddl_paging_size.SelectedValue;
        if (selectedValue == "All")
        {
            dataTable.AllowPaging = false;
            BindData();
        }
        else
        {
            int PageSize = Convert.ToInt32(selectedValue);
            dataTable.AllowPaging = true;
            dataTable.PageSize = PageSize;
            BindData();
        }
    }

    protected void export_excel_Click(object sender, EventArgs e)
    {

    }
    protected void delete_filter(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        string id = "panel" + lk.CommandArgument;
        ContentPlaceHolder cont = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
        Panel myPanel = (Panel)cont.FindControl(id);
        myPanel.Visible = false;
        if (id == "panel1")
        {
            tb_CandidateId.Text = "";
        }
        if (id == "panel2")
        {
            tb_Fname.Text = "";
        }
        if (id == "panel3")
        {
            tb_Lname.Text = "";
        }
        if (id == "panel4")
        {
            tb_username.Text = "";
        }

        BindData();

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {

        tb_CandidateId.Text = "";
        tb_Fname.Text = "";
        tb_Lname.Text = "";
        tb_username.Text = "";
        
        BindData();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

    protected void dataTable_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }

    

    protected void lb_thumb_Click(object sender, EventArgs e)
    {
        //LinkButton thumb = sender as LinkButton;
        //string FileID = thumb.Attributes["data-fileid"].ToString();

    }

    protected void file_preview_Click(object sender, EventArgs e)
    {
        //LinkButton thumb = sender as LinkButton;
        //string FileID = thumb.Attributes["data-fileid"].ToString();

    }
}