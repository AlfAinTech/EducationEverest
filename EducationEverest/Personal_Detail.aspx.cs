using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Personal_Detail : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    string current_user = HttpContext.Current.User.Identity.GetUserId();

    public void populate_personal_details()
    {
        if (db.Personal_Details.Any(x => x.User_ID == current_user))
        {
            var personal = db.Personal_Details.Where(x => x.User_ID == current_user).First();
            student_name.Value = personal.Name;
            father_name.Value = personal.Father_Name;
            student_cnic.Value = personal.CNIC;
            father_cnic.Value = personal.Father_CNIC;

            dob.Value = personal.DOB.Value.ToString("yyyy-MM-dd");

           // DateTime s = DateTime.ParseExact(personal.DOB, "MM/dd/yyyy", null);
            nationality.Value = personal.Nationality;
        }
    }

    public void populate_contact_information()
    {
        if (db.ContactInformations.Any(x => x.User_ID == current_user))
        {
            var info = db.ContactInformations.Where(x => x.User_ID == current_user).First();
            current_address.Value = info.Current_Address;
            permanent_address.Value = info.Permanent_Address;
            email.Value = info.Email;
            landline.Value = info.Landline;
            phone.Value = info.Phone;
            father_phone.Value = info.Phone_Father;
            zip.Value = info.Zip;
        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populate_personal_details();
            populate_contact_information();
        }
    }

    protected void next_click(object sender, EventArgs e)

    {
        if (db.Personal_Details.Any(x => x.User_ID == current_user))
        {
            var x = db.Personal_Details.Where(y => y.User_ID == current_user).First();

            x.Name = student_name.Value;
            x.Father_Name = father_name.Value;
            x.CNIC = student_cnic.Value;
            x.Father_CNIC = father_cnic.Value;
            x.DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null);
           // x.DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null);
            //x.DOB = Convert.ToDateTime(dob.Value);
            x.DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null);
            x.Nationality = nationality.Value;

            db.SaveChanges();
        }
        else
        {
            Personal_Details pds = new Personal_Details
            {
                
                Name = student_name.Value,
                Father_Name = father_name.Value,
                CNIC = student_cnic.Value,
                Father_CNIC = father_cnic.Value,
                DOB = DateTime.ParseExact(dob.Value, "yyyy-MM-dd", null),

                Nationality = nationality.Value,


                User_ID = current_user

            };
            db.Personal_Details.Add(pds);
            db.SaveChanges();

        }

        if (db.ContactInformations.Any(x => x.User_ID == current_user))
        {
            var x = db.ContactInformations.Where(y => y.User_ID == current_user).First();
            x.Current_Address = current_address.Value;
            x.Permanent_Address = permanent_address.Value;
            x.Email = email.Value;
            x.Landline = landline.Value;
            x.Phone = phone.Value;
            x.Phone_Father = father_phone.Value;
            x.Zip = zip.Value;
            db.SaveChanges();

        }
        else
        {
            ContactInformation ci = new ContactInformation
            {
                User_ID = current_user,
                Current_Address = current_address.Value,
                Permanent_Address = permanent_address.Value,
                Email = email.Value,
                Landline = landline.Value,
                Phone = phone.Value,
                Phone_Father = father_phone.Value,
                Zip = zip.Value

            };
            db.ContactInformations.Add(ci);
            db.SaveChanges();
        }

        Response.Redirect("choices");
    }
}