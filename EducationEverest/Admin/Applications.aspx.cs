﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            populateUniversities();
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

    protected void populateUniversities()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        List<University> universities = db.Universities.ToList();
        ddl_University.DataSource = universities;
        ddl_University.DataTextField = "Name";
        ddl_University.DataValueField = "id";
        ddl_University.DataBind();
        ddl_University.Items.Insert(0,new ListItem("Select University", "0"));
    }
    public void BindData()
    {
        int ApplicationID = 0;
        if (tb_ApplicationID.Text != "" && !String.IsNullOrWhiteSpace(tb_ApplicationID.Text) && Convert.ToInt32(tb_ApplicationID.Text) > 0)
        {
            ApplicationID = int.Parse(tb_ApplicationID.Text);

        }
        else
        {
            tb_ApplicationID.Text = "";
        }

        //string UserID = tb_UserID.Text;
        //UserID = UserID.Trim();
        //string Region = tb_Region.Text;
        //Region = Region.Trim();

        string CurrentStatus = ddl_current_status.SelectedItem.Text;
        if (CurrentStatus == "Select Status")
        {
            CurrentStatus = "";
        }

        int University = Convert.ToInt32(ddl_University.SelectedValue);        

        
        DateTime startDate = new DateTime();
        if (tb_startDate.Text != "" && !String.IsNullOrWhiteSpace(tb_startDate.Text))
        {
            startDate = Convert.ToDateTime(tb_startDate.Text);
        }
        else
        {
            startDate = DateTime.MinValue;
        }
        DateTime endDate = new DateTime();
        if (tb_EndDate.Text != "" && !String.IsNullOrWhiteSpace(tb_EndDate.Text))
        {
            endDate = Convert.ToDateTime(tb_EndDate.Text);
            endDate = endDate.AddDays(1);
        }
        else
        {
            endDate = DateTime.MaxValue;
        }
        setFilters();
        FillData(ApplicationID, University, CurrentStatus,startDate, endDate);
    }


    protected void FillData(int ApplicationID, int university, string CurrentStatus, DateTime startDate, DateTime endDate)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        if (db.Applications.Any())
        {
            if (ApplicationID != 0 && university !=0 )
            {
                var applications = db.Applications.Where(x => x.id == ApplicationID && x.UnivID == university  && x.CurrentStatus.Contains(CurrentStatus) &&  x.SubmittedOn >= startDate && x.SubmittedOn < endDate).OrderByDescending(x => x.SubmittedOn).ToList();
                dataTable.DataSource = applications;
                dataTable.DataBind();
            }
            if(ApplicationID != 0 && university == 0)
            {
                var applications = db.Applications.Where(x => x.id == ApplicationID && x.CurrentStatus.Contains(CurrentStatus) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate).OrderByDescending(x => x.SubmittedOn).ToList();
                dataTable.DataSource = applications;
                dataTable.DataBind();
            }
            if(ApplicationID==0 && university != 0)
            {
                var applications = db.Applications.Where(x =>  x.UnivID == university  && x.CurrentStatus.Contains(CurrentStatus) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate).OrderByDescending(x => x.SubmittedOn).ToList();
                dataTable.DataSource = applications;
                dataTable.DataBind();
            }
            if(ApplicationID==0 && university == 0)
            {
                var applications = db.Applications.Where(x =>  x.CurrentStatus.Contains(CurrentStatus) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate).OrderByDescending(x => x.SubmittedOn).ToList();
                dataTable.DataSource = applications;
                dataTable.DataBind();
            }
            
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
        
        if (tb_ApplicationID.Text != "")
        {
            btn_reset.Visible = true;
            panel1.Visible = true;
        }
        else
        {

            panel1.Visible = false;
        }
        //if (tb_UserID.Text != "")
        //{
        //    panel2.Visible = true;
        //    btn_reset.Visible = true;
        //}
        //else
        //{
        //    panel2.Visible = false;
        //}
        if (ddl_University.SelectedIndex>0)
        {
            panel3.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel3.Visible = false;

        }
        if (tb_startDate.Text != "")
        {
            panel4.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel4.Visible = false;
        }
        if (tb_EndDate.Text != "")
        {
            panel5.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel5.Visible = false;
        }
        if (ddl_current_status.SelectedIndex > 0)
        {
            panel6.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel6.Visible = false;
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
            tb_ApplicationID.Text = "";
        }
        //if (id == "panel2")
        //{
        //    tb_UserID.Text = "";
        //}
        if (id == "panel3")
        {
            ddl_University.SelectedIndex = 0;
        }
        if (id == "panel4")
        {
            tb_startDate.Text = "";
        }
        if (id == "panel5")
        {
            tb_EndDate.Text = "";
        }
        if (id == "panel6")
        {
            ddl_current_status.SelectedIndex = 0;
        }
        
        BindData();

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
       
        tb_ApplicationID.Text = "";
        tb_EndDate.Text = "";
        //tb_UserID.Text = "";
        tb_startDate.Text = "";
        ddl_University.SelectedIndex = 0;
        ddl_current_status.SelectedIndex = 0;
        BindData();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       
    }

    protected void dataTable_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var application = e.Row.DataItem as Application;
            if (application.CurrentStatus != null)
            {
                DropDownList ddl_status = e.Row.FindControl("ddl_current_status") as DropDownList;
                ddl_status.SelectedValue = application.CurrentStatus;
            }
            //Repeater rptr_files = e.Row.FindControl("rptr_files") as Repeater;
            //EducationEverestEntities db = new EducationEverestEntities();
            //rptr_files.DataSource = null;
            //rptr_files.DataBind();
        }
    }

    protected void ddl_current_status_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl_status = sender as DropDownList;
        if (ddl_status.SelectedItem.Text != "Change Status")
        {
            int ApplicationID = int.Parse(ddl_status.Attributes["data-applicationid"].ToString());
            EducationEverestEntities db = new EducationEverestEntities();
            Application dbApplication = db.Applications.Where(w => w.id == ApplicationID).First();
            dbApplication.CurrentStatus = ddl_status.SelectedItem.Value;
            //dbApplication.ResolvedBy = HttpContext.Current.User.Identity.Name;
            //dbApplication.ResolvedOn = DateTime.Now;
            db.SaveChanges();
            BindData();
        }


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
