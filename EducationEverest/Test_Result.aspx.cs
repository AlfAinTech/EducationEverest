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




    public void panels()
    {
        List<MakeChoice> mk = db.MakeChoices.Where(x => x.User_ID == current_user).ToList();

        List<University> q = mk.Select(m => m.University).Distinct().ToList();

        List<University_Tests> uvtest = new List<University_Tests>();

        List<University_Tests> ut = new List<University_Tests>();
        foreach (var h in q)
        {
            ut = h.University_Tests.ToList();
            Console.Write(ut);
        }
        Repeater1.DataSource = ut;
        Repeater1.DataBind();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            panels();
            populate_panels();
        }
    }


    public void populate_panels()
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label label = item.FindControl("Label12") as Label;

            DropDownList board = ((DropDownList)item.FindControl("select_board"));
            TextBox roll_no = item.FindControl("roll_number") as TextBox;
            DropDownList passing_year = item.FindControl("year_of_passing") as DropDownList;
            TextBox total_marks = item.FindControl("total_marks") as TextBox;
            TextBox obtained_marks = item.FindControl("obtained_marks") as TextBox;
            TextBox percentage = item.FindControl("percentage") as TextBox;
            TextBox division = item.FindControl("division") as TextBox;

            if (db.Test_Results.Any(x => x.User_ID == current_user && x.Test_Name == label.Text))
            {
                var p = db.Test_Results.Single(x => x.User_ID == current_user && x.Test_Name == label.Text);
                board.SelectedValue = p.Board;
                roll_no.Text = p.Rollno;
                passing_year.Text = p.Passing_Year;
                total_marks.Text = p.Total_Marks;
                obtained_marks.Text = p.Obtained_Marks;
                percentage.Text = p.Percentage;
                division.Text = p.Division;
            }
        }

     }

    protected void save_click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            Label label = item.FindControl("Label12") as Label;

            DropDownList board = ((DropDownList)item.FindControl("select_board"));
            TextBox roll_no = item.FindControl("roll_number") as TextBox;
            DropDownList passing_year = item.FindControl("year_of_passing") as DropDownList;
            TextBox total_marks = item.FindControl("total_marks") as TextBox;
            TextBox obtained_marks = item.FindControl("obtained_marks") as TextBox;
            TextBox percentage = item.FindControl("percentage") as TextBox;
            TextBox division = item.FindControl("division") as TextBox;

            if (db.Test_Results.Any(x => x.User_ID == current_user && x.Test_Name == label.Text))
            {
                var p = db.Test_Results.Single(x => x.User_ID == current_user && x.Test_Name == label.Text);
                p.Board = board.SelectedValue;
                p.Rollno = roll_no.Text;
                p.Passing_Year = passing_year.SelectedValue;
                p.Total_Marks = total_marks.Text;
                p.Obtained_Marks = obtained_marks.Text;
                p.Percentage = percentage.Text;
                p.Division = division.Text;

                db.SaveChanges();
            }

            else
            {
                Test_Results test_result = new Test_Results
                {
                    User_ID = current_user,
                    Test_Name = label.Text,
                    Board = board.SelectedValue,
                    Rollno = roll_no.Text,
                    Passing_Year = passing_year.Text,
                    Total_Marks = total_marks.Text,
                    Obtained_Marks = obtained_marks.Text,
                    Percentage = percentage.Text,
                    Division = division.Text
                };

                db.Test_Results.Add(test_result);
                db.SaveChanges();
            }
        }
    }

   

}