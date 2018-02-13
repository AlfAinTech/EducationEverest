using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;


public partial class Choices : System.Web.UI.Page
{
    string ddlvalue;
    EducationEverestEntities db = new EducationEverestEntities();

   // public static string current_user = "aca4d4f8-686c-4c1b-897b-fc0057dee50f";   old ID by Faizan
    public static string current_user = "b7f8e747-9167-4340-8c23-b914eda6d11f";     //new ID by Ibrar

   // public static string current_user = HttpContext.Current.User.Identity.GetUserId();

    public void populate_uni()
    {
        List<University> uv = db.Universities.ToList();
        DropDownList ddl1 = (DropDownList)DropDownList1;
        foreach (var z in uv)
        {

            ddl1.Items.Add(z.Name);

        }
    }

    public String show()
    {
        int universityId = Convert.ToInt32(hf_UniID.Value);
        if (universityId != 0)
        {
            University university = db.Universities.Where(a => a.id == universityId).First();


            // if (db.Universities.Any(x => x.Name == DropDownList1.SelectedValue))
            // if (db.Universities.Any(x => x.Name == ddlvalue))


            //University uv = db.Universities.First(x => x.Name == Convert.ToString(university));
            // University uv = db.Universities.First(x => x.Name == DropDownList1.SelectedValue);
            // University uv = db.Universities.First(x => x.Name == ddlsessionval);
            // University uv = db.Universities.First(x => x.Name == ddlvalue);

            List<MakeChoice> choices = db.MakeChoices.Where(x => x.Uni_ID == universityId && x.User_ID == current_user).ToList();
            GridView1.DataSource = choices;
            GridView1.DataBind();
           
        }
        return "adf";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populate_uni();
            
        }
    }



    [System.Web.Services.WebMethod]
    public static Array GetData(string id)
    {
        EducationEverestEntities dbcontext = new EducationEverestEntities();
        if (dbcontext.Universities.Any(x => x.Name == id))
        {

            University univ = dbcontext.Universities.First(x => x.Name == id);
            if (dbcontext.Campuses.Any(x => x.Uni_ID == univ.id))
            {
                List<Campus> cmps = dbcontext.Campuses.Where(x => x.Uni_ID == univ.id).ToList();
                string[] array = new string[cmps.Count];
                var i = 0;
                foreach (var z in cmps)

                {
                    array[i] = z.Campus_Name;
                    i++;
                }
                return array;

            }
            else
            {
                string[] array = null;
                return array;
            }
        }
        else
        {
            string[] array = null;
            return array;
        }
    }


    [System.Web.Services.WebMethod]
    public static Array GetDepartmentData(string id)
    {
        EducationEverestEntities dbcontext = new EducationEverestEntities();
        if (dbcontext.Universities.Any(x => x.Name == id))
        {

            University univ = dbcontext.Universities.First(x => x.Name == id);
            if (dbcontext.Departments.Any(x => x.Uni_ID == univ.id))
            {
                List<Department> dpts = dbcontext.Departments.Where(x => x.Uni_ID == univ.id).ToList();
                string[] array = new string[dpts.Count];
                var i = 0;
                foreach (var z in dpts)

                {
                    array[i] = z.Department_Name;
                    i++;
                }
                return array;

            }
            else
            {
                string[] array = null;
                return array;
            }
        }
        else
        {
            string[] array = null;
            return array;
        }

    }


    [System.Web.Services.WebMethod]
    public static Array GetCategoryData(string id,string uniId, string dptId)
    { EducationEverestEntities dbcontext = new EducationEverestEntities();

        if (dbcontext.Universities.Any(x => x.Name == uniId))
        {

            University univ = dbcontext.Universities.First(x => x.Name == uniId);

            if (dbcontext.Departments.Any(x => x.Uni_ID == univ.id && x.Department_Name == dptId))
            {
                Department depart = dbcontext.Departments.First(x => x.Department_Name == dptId);

                if(dbcontext.Programms.Any(x=> x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Program_Name == id))
                {
                    Programm program = dbcontext.Programms.First(x => x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Program_Name == id);

                    if(dbcontext.ProgrammCategories.Any(x=> x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Programm_ID == program.id))
                    {
                        List<ProgrammCategory> pgcat = dbcontext.ProgrammCategories.Where(x => x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Programm_ID == program.id).ToList();
                        string[] array = new string[pgcat.Count];
                        var i = 0;
                        foreach (var z in pgcat)

                        {
                            array[i] = z.Category.Category_Name;
                            i++;
                        }
                        return array;

                    }
                    else
                    {
                        string[] array = null;
                        return array;
                    }




                }
                else
                {
                    string[] array = null;
                    return array;
                }

                

            }
            else
            {
                string[] array = null;
                return array;
            }
        }
        else
        {
            string[] array = null;
            return array;
        }

    }


    [System.Web.Services.WebMethod]
    public static Array GetProgrammData(string id, string uniId)
    {
        EducationEverestEntities dbcontext = new EducationEverestEntities();
        if (dbcontext.Universities.Any(x => x.Name == uniId))
        {

            University univ = dbcontext.Universities.First(x => x.Name == uniId);
            if (dbcontext.Departments.Any(x => x.Uni_ID == univ.id && x.Department_Name == id))
            {

                Department dpt = dbcontext.Departments.First(x => x.Department_Name == id);
                if (dbcontext.Programms.Any(x => x.Uni_ID == univ.id && x.Department_ID == dpt.id))
                {
                    List<Programm> pgms = dbcontext.Programms.Where(x => x.Uni_ID == univ.id && x.Department_ID == dpt.id).ToList();
                    string[] array = new string[pgms.Count];
                    var i = 0;
                    foreach (var z in pgms)

                    {
                        array[i] = z.Program_Name;
                        i++;
                    }
                    return array;

                }
                else
                {
                    string[] array = null;
                    return array;
                }
            }
            else
            {
                string[] array = null;
                return array;
            }
        }
        else
        {
            string[] array = null;
            return array;
        }

    }


    [System.Web.Services.WebMethod]
   // public static List<MakeChoice> SaveMainPageData(string uni,string cmp,string dpt,string ctg,string pgm)
        public static string SaveMainPageData(string uni, string cmp, string dpt, string ctg, string pgm)

    {
        //List<MakeChoice> choicesdata = new List<MakeChoice>();
        List<MakeChoice> choicesdata = new List<MakeChoice>();
        EducationEverestEntities dbcontext = new EducationEverestEntities();
        if (dbcontext.Universities.Any(x=> x.Name == uni))
        {
            University univ = dbcontext.Universities.First(x => x.Name == uni);

            if(dbcontext.Campuses.Any(x=>x.Campus_Name == cmp && x.Uni_ID == univ.id))
            {
                Campus cmps = dbcontext.Campuses.First(x => x.Campus_Name == cmp && x.Uni_ID == univ.id);

                if(dbcontext.Departments.Any(x=> x.Department_Name == dpt && x.Uni_ID == univ.id))
                {
                    Department depart = dbcontext.Departments.First(x => x.Department_Name == dpt && x.Uni_ID == univ.id);

                    if(dbcontext.Programms.Any(x=> x.Program_Name == pgm && x.Uni_ID == univ.id && x.Department_ID == depart.id))
                    {
                        Programm prgm = dbcontext.Programms.First(x => x.Program_Name == pgm && x.Uni_ID == univ.id && x.Department_ID == depart.id);
                        //if(dbcontext.ProgrammCategories.Any(x=> x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Programm_ID == prgm.id && x.Category_ID == ctg))
                        if(dbcontext.Categories.Any(x=> x.Category_Name == ctg && x.Uni_ID == univ.id))
                        {
                            Category ctgory = dbcontext.Categories.First(x => x.Category_Name == ctg && x.Uni_ID == univ.id);
                            if(dbcontext.ProgrammCategories.Any(x=> x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Category_ID == ctgory.id && x.Programm_ID == prgm.id))
                            {
                                ProgrammCategory pgcat = dbcontext.ProgrammCategories.First(x => x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Category_ID == ctgory.id && x.Programm_ID == prgm.id);
                                if(!(dbcontext.MakeChoices.Any(x=> x.User_ID == current_user && x.Uni_ID == univ.id && x.Campus_Id ==cmps.id && x.Department_Id == depart.id && x.Programm_Id == prgm.id && x.Category_Id == pgcat.id)))
                                {
                                    MakeChoice choices = new MakeChoice
                                    {
                                        User_ID = current_user,
                                        Uni_ID = univ.id,
                                        Campus_Id = cmps.id,
                                        Department_Id = depart.id,
                                        Programm_Id = prgm.id,
                                        Category_Id = pgcat.id
                                    };
                                    dbcontext.MakeChoices.Add(choices);
                                    dbcontext.SaveChanges();



                                     choicesdata = dbcontext.MakeChoices.Where(x => x.Uni_ID == univ.id && x.User_ID == current_user).ToList();
                                    
                                    //Choices ch = new Choices();


                                    //show griview here after inserting data

                                    //ch.show(univ.id);




                                }
                                   

                            }

                        }


                    }
                }

            }




        }
        var js = JsonConvert.SerializeObject(choicesdata);
        //choicesdata = dbcontext.MakeChoices.ToList();
        return js;
    }

    protected void next_click(object sender, EventArgs e)

    {
        Response.Redirect("Educational_Detail");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        //ddlvalue = DropDownList1.SelectedItem.Value;


        // Session["ddlsessionvalue"] = DropDownList1.SelectedValue;

        //show();
    }
    //button next click from make choice to educational details
    protected void next_click(object sender, EventArgs e)
    {

        Response.Redirect("Educational_Detail.aspx");
    }


}
