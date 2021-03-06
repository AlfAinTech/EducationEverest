﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.UI.HtmlControls;

public partial class Test_Result : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();




    public void panels()
    {
        List<int> Univ =   db.MakeChoices.Where(a=>a.User_ID == current_user).Select(a => a.Uni_ID).ToList();

        Repeater1.DataSource = db.UniversityProfiles.Where(q => Univ.Contains(q.UniversityID)).ToList();
        Repeater1.DataBind();
        //getting recent make choice 'stest

        if (Session["appIDS"] != null)
        {
            List<int> applicationIDS = (List<int>)Session["appIDS"];
            List<int> universityIDs = db.Applications.Where(a => applicationIDS.Contains(a.id)).Select(a => a.University.id).ToList();
            Repeater1.DataSource = db.UniversityProfiles.Where(q => universityIDs.Contains(q.University.id)).ToList();
            Repeater1.DataBind();
        }
        
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!(HttpContext.Current.User.Identity.IsAuthenticated)) || (HttpContext.Current.User.IsInRole("Super Admin")))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        if (Session["appIDS"] == null)
        {
            Response.Redirect("Dashboard.aspx");
        }
        if (!IsPostBack)
        {
            panels();
            populate_panels();
        }
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
    }


    public void populate_panels()
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label label = item.FindControl("Label12") as Label;

            //DropDownList board = ((DropDownList)item.FindControl("select_board"));
            TextBox roll_no = item.FindControl("roll_number") as TextBox;
            DropDownList passing_year = item.FindControl("year_of_passing") as DropDownList;
            TextBox total_marks = item.FindControl("total_marks") as TextBox;
            TextBox obtained_marks = item.FindControl("obtained_marks") as TextBox;
            HtmlInputText percentage = item.FindControl("percentage") as HtmlInputText;
            TextBox division = item.FindControl("division") as TextBox;

            if (db.Test_Results.Any(x => x.User_ID == current_user && x.Test_Name == label.Text))
            {
                var p = db.Test_Results.Single(x => x.User_ID == current_user && x.Test_Name == label.Text);
               // board.SelectedValue = p.Board;
                roll_no.Text = p.Rollno;
                //passing_year.Text = p.Passing_Year;
                passing_year.SelectedValue = p.Passing_Year;
                total_marks.Text = p.Total_Marks;
                obtained_marks.Text = p.Obtained_Marks;
                
                percentage.Value = p.Percentage;
                division.Text = p.Division;
            }
            //image of caution and success
            if (db.Test_Results.Any(a => (a.User_ID == current_user && a.Test_Name == label.Text) && (a.Rollno == null || a.Passing_Year == null || a.Total_Marks == null || a.Obtained_Marks == null || a.Percentage == null || a.Division == null)))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "showCaution();", true);
            }
            else if (db.Test_Results.Any(a => a.User_ID == current_user && a.Test_Name == label.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "showSuccess();", true);
            }
        }

     }

    protected void save_click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label label = item.FindControl("Label12") as Label;

            //DropDownList board = ((DropDownList)item.FindControl("select_board"));
            TextBox roll_no = item.FindControl("roll_number") as TextBox;
            DropDownList passing_year = item.FindControl("year_of_passing") as DropDownList;
            TextBox total_marks = item.FindControl("total_marks") as TextBox;
            TextBox obtained_marks = item.FindControl("obtained_marks") as TextBox;
            HtmlInputText percentage = item.FindControl("percentage") as HtmlInputText;
            TextBox division = item.FindControl("division") as TextBox;

            if (db.Test_Results.Any(x => x.User_ID == current_user && x.Test_Name == label.Text))
            {
                var p = db.Test_Results.Single(x => x.User_ID == current_user && x.Test_Name == label.Text);
               // p.Board = board.SelectedValue;
                p.Rollno = roll_no.Text;
                p.Passing_Year = passing_year.SelectedValue;
                p.Total_Marks = total_marks.Text;
                p.Obtained_Marks = obtained_marks.Text;
                p.Percentage = percentage.Value;
                p.Division = EEUtil.calcDivision(Convert.ToInt32(p.Percentage));

                db.SaveChanges();
            }

            else
            {
                Test_Results test_result = new Test_Results
                {
                    User_ID = current_user,
                    Test_Name = label.Text,
                    //Board = board.SelectedValue,
                    Rollno = roll_no.Text,
                    Passing_Year = passing_year.SelectedValue,
                    Total_Marks = total_marks.Text,
                    Obtained_Marks = obtained_marks.Text,
                    Percentage = percentage.Value,
                    Division = EEUtil.calcDivision(Convert.ToInt32(Convert.ToInt32(percentage.Value)))
                };

                db.Test_Results.Add(test_result);
                db.SaveChanges();
            }
        }

        HtmlImage imgpd = Master.FindControl("imgTickTestResults") as HtmlImage;


        if (imgpd != null)

        {

            imgpd.Visible = true;
            Session["IMGTR"] = "imgtr";

        }



        //button next click from Test Results to Document
        
        
            Response.Redirect("Upload_Documents.aspx");
        


    }





    
}