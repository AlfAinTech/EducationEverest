using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
        Guid ApplicationID = Guid.Empty;
        tb_ApplicationID.Text.Replace(" ",string.Empty);
        if (tb_ApplicationID.Text != "" && !String.IsNullOrWhiteSpace(tb_ApplicationID.Text) && tb_ApplicationID.Text.Length == 36)
        {
             ApplicationID = Guid.Parse(tb_ApplicationID.Text);

        }
        else
        {
            ApplicationID = Guid.Empty;
            tb_ApplicationID.Text = "";
        }

        string CandidateID = "";
        if(tb_CandidateId.Text != "" && !String.IsNullOrWhiteSpace(tb_CandidateId.Text))
        {
            CandidateID = tb_CandidateId.Text;
        }
        string TrackingID = "";
        if (tb_TrackingID.Text != "" && !String.IsNullOrWhiteSpace(tb_TrackingID.Text))
        {
            TrackingID = tb_TrackingID.Text;
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
        FillData(ApplicationID,CandidateID, University, CurrentStatus,startDate, endDate,TrackingID);
    }


    protected void FillData(Guid ApplicationID,string CandidateId, int university, string CurrentStatus, DateTime startDate, DateTime endDate,string TrackingID)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        
        if (db.Applications.Any())
        {
            List<Application> applications = new List<Application>();
            if (ApplicationID != Guid.Empty && university !=0 )
            {
                applications = db.Applications.Where(x => x.appID.Equals(ApplicationID) && x.UserID.Contains(CandidateId) && x.UnivID == university && x.CurrentStatus.Contains(CurrentStatus) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate && x.TrackingID.Contains(TrackingID)).OrderByDescending(x => x.SubmittedOn).ToList();
            }
            if(ApplicationID != Guid.Empty && university == 0)
            {
                 applications = db.Applications.Where(x => x.appID.Equals(ApplicationID) && x.UserID.Contains(CandidateId)  && x.CurrentStatus.Contains(CurrentStatus) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate  && x.TrackingID.Contains(TrackingID)).OrderByDescending(x => x.SubmittedOn).ToList();
               
            }
            if(ApplicationID == Guid.Empty && university != 0)
            {
                 applications = db.Applications.Where(x =>  x.UnivID == university   && x.UserID.Contains(CandidateId) && x.CurrentStatus.Contains(CurrentStatus) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate && x.TrackingID.Contains(TrackingID)).OrderByDescending(x => x.SubmittedOn).ToList();
               
            }
            if(ApplicationID == Guid.Empty && university == 0)
            {
                 applications = db.Applications.Where(x =>  x.CurrentStatus.Contains(CurrentStatus) && x.UserID.Contains(CandidateId) && x.SubmittedOn >= startDate && x.SubmittedOn < endDate ).OrderByDescending(x => x.SubmittedOn).ToList();
                
            }
            foreach(var application in applications)
            {
                if (!application.TrackingID.Contains(TrackingID))
                {
                    applications.Remove(application);
                }
            }

            dataTable.DataSource = applications;
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
        
        if (tb_ApplicationID.Text != "")
        {
            btn_reset.Visible = true;
            panel1.Visible = true;
        }
        else
        {

            panel1.Visible = false;
        }
        if (tb_CandidateId.Text != "")
        {
            panel2.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel2.Visible = false;
        }
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
        if (tb_TrackingID.Text != "")
        {
            panel7.Visible = true;
            btn_reset.Visible = true;
        }
        else
        {
            panel7.Visible = false;
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
        if (id == "panel2")
        {
            tb_CandidateId.Text = "";
        }
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
        if (id == "panel7")
        {
            tb_TrackingID.Text = "";
        }
        BindData();

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
       
        tb_ApplicationID.Text = "";
        tb_EndDate.Text = "";
        tb_CandidateId.Text = "";
        tb_startDate.Text = "";
        ddl_University.SelectedIndex = 0;
        ddl_current_status.SelectedIndex = 0;
        tb_TrackingID.Text = "";
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
            if(application.Payments.FirstOrDefault() != null && application.Payments.FirstOrDefault().ConfirmPayment != null && (bool)application.Payments.FirstOrDefault().ConfirmPayment)
            {
                LinkButton lb_confirm = e.Row.FindControl("LinkButton1") as LinkButton;
                lb_confirm.Visible = false;
                Label lbl_confirmed = e.Row.FindControl("Label1") as Label;
                lbl_confirmed.Visible = true;
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
            try
            {
                int ApplicationID = int.Parse(ddl_status.Attributes["data-applicationid"].ToString());
                string CandidateId = ddl_status.Attributes["data-candidateId"].ToString();
                string previousStatus = "";
                EducationEverestEntities db = new EducationEverestEntities();
                Application dbApplication = db.Applications.Where(w => w.id == ApplicationID).First();
                previousStatus = dbApplication.CurrentStatus;
                dbApplication.CurrentStatus = ddl_status.SelectedItem.Value;
                //dbApplication.ResolvedBy = HttpContext.Current.User.Identity.Name;
                //dbApplication.ResolvedOn = DateTime.Now;
                db.SaveChanges();
                BindData();
                AspNetUser candidate = db.AspNetUsers.Where(a => a.Id == CandidateId).First();
                
                using (MailMessage mm = new MailMessage(EEUtil.FromEmail, candidate.UserName))  //here ID changed 02-feb-18
                {
                    mm.Subject = "Application Status Change";
                    string body = "Hello " + candidate.UserName.Trim() + ",";
                    body += "<br /><br />Status of your application consisting of ApplicationID = "+dbApplication.appID+" has been changed from " + previousStatus + " to "+dbApplication.CurrentStatus+".";
                    
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(EEUtil.FromEmail, EEUtil.FromPassword); // here ID and password changed 02-feb-18
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Email sent to candidate successfully');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Something went wrong, Please try again or contact your support team.');", true);
            }
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

   

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        LinkButton lb_confirm = sender as LinkButton;
        int applicationID = Convert.ToInt32(lb_confirm.Attributes["data-fileid"].ToString());
        EducationEverestEntities db = new EducationEverestEntities();
        if(db.Applications.Any(a => a.id == applicationID))
        {
            Application application = db.Applications.Where(a => a.id == applicationID).First();
            //confirm payment
            try
            {
                if (application.Payments.FirstOrDefault() != null && application.Payments.FirstOrDefault().ConfirmPayment != null && (bool)application.Payments.FirstOrDefault().ConfirmPayment)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Already Confirmed');", true);
                }
                else if (application.Payments.FirstOrDefault().ConfirmPayment == null || !(bool)application.Payments.FirstOrDefault().ConfirmPayment)
                {
                    application.Payments.FirstOrDefault().ConfirmPayment = true;
                    db.SaveChanges();
                    // send an email
                    string CandidateId = lb_confirm.Attributes["data-candidateId"].ToString();
                    AspNetUser candidate = db.AspNetUsers.Where(a => a.Id == CandidateId).First();
                    using (MailMessage mm = new MailMessage(EEUtil.FromEmail, candidate.UserName))  //here ID changed 02-feb-18
                    {
                        mm.Subject = "Payment Confirmation";
                        string body = "Hello " + candidate.UserName.Trim() + ",";
                        body += "<br /><br />Your Payment against TrackingID = " + application.TrackingID + " has been confirmed";

                        mm.Body = body;
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential(EEUtil.FromEmail, EEUtil.FromPassword); // here ID and password changed 02-feb-18
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                    }
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Payment Confirmed Successfully and email is sent to candidate');", true);
                    BindData();
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Something went wrong, Please try again or contact your support team.');", true);
            }
        }
    }
}
