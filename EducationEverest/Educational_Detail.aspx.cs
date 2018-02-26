﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.UI.HtmlControls;

public partial class Educational_Detail : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();

    public void populate_matric_data()
    {
        if (db.Matriculation_Education.Any(x => x.User_ID == current_user))

        {
            Matriculation_Education matric = db.Matriculation_Education.Single(x => x.User_ID == current_user);
            DropDownList1.SelectedValue = matric.Board;
            rollno_matric.Value = matric.Rollno;
            DropDownList2.SelectedValue = matric.Passing_Year;
            total_marks_matric.Value = matric.Total_Marks;
            obtained_marks_matric.Value = matric.Obtained_Marks;
            percentage_matric.Value = matric.Percentage;
            division_matric.Value = matric.Division;
        }
    }

    public void populate_intermediate_data()
    {
        if (db.Intermediate_Education.Any(x => x.User_ID == current_user))
        {
            Intermediate_Education inter = db.Intermediate_Education.Single(x => x.User_ID == current_user);
            DropDownList3.SelectedValue = inter.Board;
            rollno_intermediate.Value = inter.Rollno;
            DropDownList4.SelectedValue = inter.Passing_Year;
            total_marks_intermediate.Value = inter.Total_Marks;
            obtained_marks_intermediate.Value = inter.Obtained_Marks;
            percentage_intermediate.Value = inter.Percentage;
            division_intermediate.Value = inter.Division;
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }

        if (!IsPostBack)
        {
            populate_matric_data();
            populate_intermediate_data();
        }

    }

    protected void button_click(object sender, EventArgs e)

    {
        if (db.Matriculation_Education.Any(x => x.User_ID == current_user))
        {
            var z = db.Matriculation_Education.Single(k => k.User_ID == current_user);
            z.Board = DropDownList1.SelectedValue;
            z.Rollno = rollno_matric.Value;
            z.Passing_Year = DropDownList2.SelectedValue;
            z.Total_Marks = total_marks_matric.Value;
            z.Obtained_Marks = obtained_marks_matric.Value;
            z.Percentage = percentage_matric.Value;
            z.Division = division_matric.Value;
            db.SaveChanges();


           
        }
        else
        {
            Matriculation_Education mat_edu = new Matriculation_Education
            {
                User_ID = current_user,
                Board = DropDownList1.SelectedValue,
                Rollno = rollno_matric.Value,
                Passing_Year = DropDownList2.SelectedValue,
                Total_Marks = total_marks_matric.Value,
                Obtained_Marks = obtained_marks_matric.Value,
                Percentage = percentage_matric.Value,
                Division = division_matric.Value
            };
            db.Matriculation_Education.Add(mat_edu);
            db.SaveChanges();
        }

        if  (db.Intermediate_Education.Any(x => x.User_ID == current_user))
        {
            var i = db.Intermediate_Education.Single(j => j.User_ID == current_user);
            i.Board = DropDownList3.SelectedValue;
            i.Rollno = rollno_intermediate.Value;
            i.Passing_Year = DropDownList4.SelectedValue;
            i.Total_Marks = total_marks_intermediate.Value;
            i.Obtained_Marks = obtained_marks_intermediate.Value;
            i.Percentage = percentage_intermediate.Value;
            i.Division = division_intermediate.Value;
            db.SaveChanges();
        }
        else
        {
            Intermediate_Education inter_edu = new Intermediate_Education
            {
                User_ID = current_user,
                Board = DropDownList3.SelectedValue,
            Rollno = rollno_intermediate.Value,
            Passing_Year = DropDownList4.SelectedValue,
            Total_Marks = total_marks_intermediate.Value,
            Obtained_Marks = obtained_marks_intermediate.Value,
            Percentage = percentage_intermediate.Value,
            Division = division_intermediate.Value
        };
            db.Intermediate_Education.Add(inter_edu);
            db.SaveChanges();
        }



        HtmlImage imgpd = Master.FindControl("imgTickEducationDetails") as HtmlImage;


        if (imgpd != null)

        {

            imgpd.Visible = true;
            Session["IMGED"] = "imged";

        }


        //button next click from Educational Details to Test Result
        Response.Redirect("Test_Result.aspx");


       


    }

}