﻿using System;

using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UniversityPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Super Admin"))))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        else if (!Page.IsPostBack)
        {

            PopulateUniversityData();
        }
    }

    protected void PopulateUniversityData()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        
        if (UniversityId != 0)
        {

            if(db.Universities.Any(a => a.id == UniversityId))
            {
                University university = db.Universities.Where(a => a.id == UniversityId).First();
                tb_uniName.Text = university.Name;
                UniversityProfile universityProfile = db.UniversityProfiles.Where(a => a.UniversityID == UniversityId).First();
                tb_uniEmail.Text = universityProfile.Email;
                tb_TestName.Text = universityProfile.TestName;
                tb_FeeStructure.Text = universityProfile.FeeStructure;
                tb_HecRanking.Text = universityProfile.HecRanking;
                tb_uniAddress.Text = universityProfile.Address;
                tb_uniContact1.Text = universityProfile.Contact1;
                tb_uniContact2.Text = universityProfile.Contact2;
                tb_uniContact3.Text = universityProfile.Contact3;
                ddl_UniversityType.SelectedItem.Text = universityProfile.Type;
                cb_AdmissionOpen.Checked = (bool)universityProfile.AdmissionOpen;
                cb_DifferentFee.Checked = false;
                cb_sameFee.Checked = true;
                if (universityProfile.ApplicationFeeSame == false)
                {
                    cb_DifferentFee.Checked = true;
                    cb_sameFee.Checked = false;
                    div_applicationFee.Visible = false;
                }
                tb_applicationFee.Text = universityProfile.ApplicationFee;
                if (cb_AdmissionOpen.Checked)
                {
                    divDeadline.Visible = true;
                }
                if (universityProfile.LastDate != null)
                {
                    tb_Deadline.Text = universityProfile.LastDate.Value.ToString("yyyy-MM-dd");
                }
                cb_hideUni.Checked = false;
                if(universityProfile.hide != null && universityProfile.hide == true)
                {
                    cb_hideUni.Checked = true;
                }
                tb_AdmissionDocs.Text = universityProfile.AdmisssionDocs;
                tb_About.Text = universityProfile.About;
                tb_Criteria.Text = universityProfile.Criteria;

            }
        }
    }

    protected void btn_addCampuses_Click(object sender, EventArgs e)
    {
        //save university data
        EducationEverestEntities db = new EducationEverestEntities();
        int UniversityId = 0;
        if (Request.QueryString["uid"] != null)
        {
            UniversityId = Convert.ToInt32(Request.QueryString["uid"]);
        }
        if (UniversityId == 0)
        {
            University newUniversity = new University();
            newUniversity.Name = tb_uniName.Text;
           // newUniversity.Status = false;

            db.Universities.Add(newUniversity);
            db.SaveChanges();

            //save university logo 
            string filePath = "";
            if (fu_logo.PostedFile != null && fu_logo.PostedFile.ContentLength > 0)
            {

                string fileName = Path.GetFileName(fu_logo.PostedFile.FileName);
                string folder = Server.MapPath("~/Content/UniversityMedia/");
                filePath = Path.Combine(folder, fileName);
                fu_logo.PostedFile.SaveAs(filePath);
                try
                {
                    Console.WriteLine("File uploaded successfully!!");
                }
                catch
                {
                    Console.WriteLine("File uploading failed!!");
                    filePath = null;
                }
            }
            UniversityMedia newUniversityMedia = new UniversityMedia();
            newUniversityMedia.UniversityId = newUniversity.id;
            newUniversityMedia.Path = filePath;

            db.UniversityMedias.Add(newUniversityMedia);
            db.SaveChanges();

            UniversityProfile newUniversityProfile = new UniversityProfile();
            newUniversityProfile.UniversityID = newUniversity.id;
            newUniversityProfile.Contact1 = tb_uniContact1.Text;
            newUniversityProfile.Contact2 = tb_uniContact2.Text;
            newUniversityProfile.Contact1 = tb_uniContact1.Text;
            newUniversityProfile.Contact3 = tb_uniContact3.Text;
            newUniversityProfile.Address = tb_uniAddress.Text;
            newUniversityProfile.Email = tb_uniEmail.Text;
            newUniversityProfile.HecRanking = tb_HecRanking.Text;
            newUniversityProfile.TestName = tb_TestName.Text;
            newUniversityProfile.Type = ddl_UniversityType.SelectedItem.Text;
            newUniversityProfile.FeeStructure = tb_FeeStructure.Text;
            newUniversityProfile.ApplicationFeeSame = false;
            if (cb_sameFee.Checked)
            {
                newUniversityProfile.ApplicationFeeSame = true;
            }
            newUniversityProfile.ApplicationFee = tb_applicationFee.Text;
            newUniversityProfile.AdmissionOpen = false;

            if (cb_AdmissionOpen.Checked)
            {
                newUniversityProfile.AdmissionOpen = true;
            }
            if (tb_Deadline.Text != "")
            {
                newUniversityProfile.LastDate = Convert.ToDateTime(tb_Deadline.Text);
            }
            newUniversityProfile.hide = false;
            if (cb_hideUni.Checked)
            {
                newUniversityProfile.hide = true;
            }
            newUniversityProfile.About = tb_About.Text;
            newUniversityProfile.Criteria = tb_Criteria.Text;
            newUniversityProfile.AdmisssionDocs = tb_AdmissionDocs.Text;

            db.UniversityProfiles.Add(newUniversityProfile);
            db.SaveChanges();

            Response.Redirect("campuses.aspx?uid=" + newUniversity.id);
        }
        else
        {
            University existingUniversity = db.Universities.Where(a => a.id == UniversityId).First();
            existingUniversity.Name = tb_uniName.Text;
           // existingUniversity.Status = false;

            //save university logo 
            string filePath = "";
            if (fu_logo.PostedFile != null && fu_logo.PostedFile.ContentLength > 0)
            {

                string fileName = Path.GetFileName(fu_logo.PostedFile.FileName);
                string folder = Server.MapPath("~/Content/UniversityMedia/");
                filePath = Path.Combine(folder, fileName);
                fu_logo.PostedFile.SaveAs(filePath);
                try
                {
                    Console.WriteLine("File uploaded successfully!!");
                }
                catch
                {
                    Console.WriteLine("File uploading failed!!");
                    filePath = null;
                }
            }
            if (db.UniversityMedias.Any(a => a.UniversityId == UniversityId))
            {
                UniversityMedia existingUniversityMedia = db.UniversityMedias.Where(a => a.UniversityId == UniversityId).First();
                existingUniversityMedia.Path = filePath;
                db.SaveChanges();
            }

            UniversityProfile existingUniversityProfile = db.UniversityProfiles.Where(a => a.UniversityID == UniversityId).First();
            existingUniversityProfile.Contact1 = tb_uniContact1.Text;
            existingUniversityProfile.Contact2 = tb_uniContact2.Text;
            existingUniversityProfile.Contact1 = tb_uniContact1.Text;
            existingUniversityProfile.Contact3 = tb_uniContact3.Text;
            existingUniversityProfile.Address = tb_uniAddress.Text;
            existingUniversityProfile.Email = tb_uniEmail.Text;
            existingUniversityProfile.HecRanking = tb_HecRanking.Text;
            existingUniversityProfile.TestName = tb_TestName.Text;
            existingUniversityProfile.Type = ddl_UniversityType.SelectedItem.Text;
            existingUniversityProfile.FeeStructure = tb_FeeStructure.Text;
            existingUniversityProfile.ApplicationFeeSame = false;
            if (cb_sameFee.Checked)
            {
                existingUniversityProfile.ApplicationFeeSame = true;
            }
            existingUniversityProfile.ApplicationFee = tb_applicationFee.Text;
            existingUniversityProfile.AdmissionOpen = false;
            if (cb_AdmissionOpen.Checked)
            {
                existingUniversityProfile.AdmissionOpen = true;
            }
            if (tb_Deadline.Text != "")
            {
                existingUniversityProfile.LastDate = Convert.ToDateTime(tb_Deadline.Text);
            }
            existingUniversityProfile.hide = false;
            if (cb_hideUni.Checked)
            {
                existingUniversityProfile.hide = true;
            }
            existingUniversityProfile.About = tb_About.Text;
            existingUniversityProfile.Criteria = tb_Criteria.Text;
            existingUniversityProfile.AdmisssionDocs = tb_AdmissionDocs.Text;
            db.SaveChanges();

            Response.Redirect("campuses.aspx?uid=" + UniversityId);
        }
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");

    }

    protected void cb_sameFee_CheckedChanged(object sender, EventArgs e)
    {
        if (cb_sameFee.Checked)
        {
            cb_DifferentFee.Checked = false;
            div_applicationFee.Visible = true;
        }
        else
        {
            cb_DifferentFee.Checked = true;
            div_applicationFee.Visible = false;
        }
    }

    protected void cb_DifferentFee_CheckedChanged(object sender, EventArgs e)
    {
        if (cb_DifferentFee.Checked)
        {
            cb_sameFee.Checked = false;
            div_applicationFee.Visible = false;
        }
        else
        {
            cb_sameFee.Checked = true;
            div_applicationFee.Visible = true;
        }
    }

    protected void cb_AdmissionOpen_CheckedChanged(object sender, EventArgs e)
    {
        if (cb_AdmissionOpen.Checked)
        {
            divDeadline.Visible = true;
        }
        else
        {
            divDeadline.Visible = false;
        }
    }

    
}