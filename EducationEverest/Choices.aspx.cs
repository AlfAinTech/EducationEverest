using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Script.Serialization;
using System.Data.Entity.Infrastructure;
using System.Web.UI.HtmlControls;

public partial class Choices : System.Web.UI.Page
{
    public static List<int> applicationIDs = new List<int>();
   public class ApplicationData
    {
        public Array data { get; set; }
        public bool isNewApp { get; set; }
        
    }
    string ddlvalue;
    EducationEverestEntities db = new EducationEverestEntities();

    // public static string current_user = "aca4d4f8-686c-4c1b-897b-fc0057dee50f";   old ID by Faizan

    public static string current_user = HttpContext.Current.User.Identity.GetUserId();     //new ID by Ibrar

    // public static string current_user = HttpContext.Current.User.Identity.GetUserId();

    public void populate_uni()
    {
        List<University> uv = db.Universities.ToList();
        
        DropDownList ddl1 = (DropDownList)DropDownList1;
        foreach (var z in uv)
        {
            // if deadline has passed then skip university
            if ((z.UniversityProfiles.Count != 0) && !(z.UniversityProfiles.First().LastDate < DateTime.Today))
            {
                ListItem l = new ListItem();
                l.Text = z.Name;
                l.Value = z.id.ToString();
                ddl1.Items.Add(l);
            }

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
            //GridView1.DataSource = choices;
            //GridView1.DataBind();

        }
        return "adf";
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
            populate_uni();
            
             current_user = HttpContext.Current.User.Identity.GetUserId();
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "a_key", "OpenCurrentPage();", true);
           
        }
    }



    [System.Web.Services.WebMethod]
    public static Array GetData(string id)
    {
        int id_ = int.Parse(id);
        EducationEverestEntities dbcontext = new EducationEverestEntities();
        if (dbcontext.Universities.Any(x => x.id == id_))
        {
          

            University univ = dbcontext.Universities.First(x => x.id == id_);
            if (dbcontext.Campuses.Any(x => x.Uni_ID == univ.id))
            {
                List<Campus> cmps = dbcontext.Campuses.Where(x => x.Uni_ID == univ.id).ToList();
                string[] array = new string[cmps.Count];
                var i = 0;
                foreach (var z in cmps)

                {
                    array[i] = z.id + "," + z.Campus_Name;
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
        int id_ = int.Parse(id);
        //University univ = dbcontext.Universities.First(x => x.Name == id);
        if (dbcontext.Departments.Any())
            {
                List<Department> dpts = dbcontext.Departments.Where(q=>q.Campus.id == id_).ToList();
                string[] array = new string[dpts.Count];
                var i = 0;
                foreach (var z in dpts)

                {
                    array[i] = z.id+","+z.Department_Name;
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


    [System.Web.Services.WebMethod]
    public static Array GetCategoryData(string id, string uniId, string dptId)
    { EducationEverestEntities dbcontext = new EducationEverestEntities();
        int id_ = int.Parse(id);
        int uniId_ = int.Parse(uniId);
        int dptId_ = int.Parse(dptId);
        if (dbcontext.Universities.Any(x => x.id == uniId_))
        {
           
            University univ = dbcontext.Universities.First(x => x.id == uniId_);

            if (dbcontext.Departments.Any(x => x.id == dptId_))
            {
                Department depart = dbcontext.Departments.First(x => x.id == dptId_);

                if(dbcontext.Programms.Any(x=>  x.Department_ID == depart.id && x.id == id_))
                {
                    Programm program = dbcontext.Programms.First(x =>  x.Department_ID == depart.id && x.id == id_);

                    if(dbcontext.ProgrammCategories.Any(x=> x.Programm_ID == program.id))
                    {
                        List<ProgrammCategory> pgcat = dbcontext.ProgrammCategories.Where(x =>  x.Programm_ID == program.id).ToList();
                        string[] array = new string[pgcat.Count];
                        var i = 0;
                        foreach (var z in pgcat)

                        {
                            array[i] = z.Category.id + "," + z.Category.Category_Name;
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
        int id_ = int.Parse(id);
        int uniId_ = int.Parse(uniId);
        if (dbcontext.Universities.Any(x => x.id == uniId_))
        {

            University univ = dbcontext.Universities.First(x => x.id == uniId_);
            if (dbcontext.Departments.Any(x =>  x.id == id_))
            {

                Department dpt = dbcontext.Departments.First(x => x.id == id_);
                if (dbcontext.Programms.Any(x =>  x.Department_ID == dpt.id))
                {
                    List<Programm> pgms = dbcontext.Programms.Where(x =>  x.Department_ID == dpt.id).ToList();
                    string[] array = new string[pgms.Count];
                    var i = 0;
                    foreach (var z in pgms)

                    {
                        array[i] = z.id + "," + z.Program_Name;
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
        bool isNewAppAdded = false;
        int uni_ = int.Parse(uni);
        int cmp_ = int.Parse(cmp);
        int dpt_ = int.Parse(dpt);
        int ctg_ = int.Parse(ctg);
        int pgm_ = int.Parse(pgm);

        //List<MakeChoice> choicesdata = new List<MakeChoice>();
        IEnumerable<MakeChoice> choicesdata = new List<MakeChoice>();
        EducationEverestEntities dbcontext = new EducationEverestEntities();
        if (dbcontext.Universities.Any(x => x.id == uni_))
        {
            University univ = dbcontext.Universities.First(x => x.id == uni_);
           
            if (dbcontext.Campuses.Any(x => x.id == cmp_ && x.Uni_ID == univ.id))
            {
                Campus cmps = dbcontext.Campuses.First(x => x.id == cmp_ && x.Uni_ID == univ.id);

                if(dbcontext.Departments.Any(x=> x.id == dpt_ ))
                {
                    Department depart = dbcontext.Departments.First(x => x.id == dpt_ );

                    if(dbcontext.Programms.Any(x=> x.id == pgm_ &&  x.Department_ID == depart.id))
                    {
                        Programm prgm = dbcontext.Programms.First(x => x.id == pgm_ &&  x.Department_ID == depart.id);
                        //if(dbcontext.ProgrammCategories.Any(x=> x.Uni_ID == univ.id && x.Department_ID == depart.id && x.Programm_ID == prgm.id && x.Category_ID == ctg))
                        if(dbcontext.Categories.ToList().Any(x=> x.id == ctg_))
                        {
                            Category ctgory = dbcontext.Categories.First(x => x.id == ctg_ );
                            if(dbcontext.ProgrammCategories.Any(x=>  x.Category_ID == ctgory.id && x.Programm_ID == prgm.id))
                            {
                                ProgrammCategory pgcat = dbcontext.ProgrammCategories.First(x =>  x.Category_ID == ctgory.id && x.Programm_ID == prgm.id);
                                if (!(dbcontext.MakeChoices.Any(x => x.User_ID == current_user && x.Uni_ID == univ.id && x.Campus_Id == cmps.id && x.Department_Id == depart.id && x.Programm_Id == prgm.id && x.Category_Id == pgcat.id)))
                                {
                                    //b7f8e747-9167-4340-8c23-b914eda6d11f
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
                                    try
                                    {
                                        dbcontext.SaveChanges();
                                        isNewAppAdded = true;
                                    }
                                    catch(DbUpdateException e)
                                    {

                                    }
                                    if (dbcontext.Applications.Any(q=>q.UserID == current_user && q.UnivID == univ.id))
                                    {
                                        if ((!univ.UniversityProfiles.FirstOrDefault().ApplicationFeeSame.Value) && (!dbcontext.Applications.Any(q => q.UserID == current_user && q.UnivID == univ.id && q.deptID == depart.id)))
                                        {
                                            Application app = new Application
                                            {
                                                UserID = current_user,
                                                UnivID = univ.id,
                                                SubmittedOn = System.DateTime.Now,
                                                deptID = depart.id,
                                                CurrentStatus = "pending",
                                                appID = Guid.NewGuid()
                                            };
                                            dbcontext.Applications.Add(app);
                                            try { dbcontext.SaveChanges();
                                                isNewAppAdded = true;
                                                applicationIDs.Add(app.id);
                                                //create a notification for user
                                                SystemNotification newNotification = new SystemNotification();
                                                newNotification.User_ID = current_user;
                                                newNotification.AppID = app.id;
                                                newNotification.Read = false;
                                                newNotification.Type = "Application";
                                                newNotification.TriggeredBy = "System";
                                                newNotification.DateTime = DateTime.Now;
                                                newNotification.Title = "Your Application with Application ID : " + app.appID + " is created";

                                                dbcontext.SystemNotifications.Add(newNotification);
                                                dbcontext.SaveChanges();
                                                
                                                
                                            }
                                            catch(Exception e)
                                            {
                                               
                                            }
                                        }
                                        else
                                        {
                                            applicationIDs.Add(dbcontext.Applications.Where(q => q.UserID == current_user && q.UnivID == univ.id).First().id);
                                        }
                                    }
                                    else
                                    { 
                                        Application app = new Application
                                        {
                                            UserID = current_user,
                                            UnivID = univ.id,
                                            SubmittedOn = System.DateTime.Now,
                                            CurrentStatus = "pending",
                                            appID = Guid.NewGuid()
                                        };
                                        dbcontext.Applications.Add(app);
                                        dbcontext.SaveChanges();
                                        applicationIDs.Add(app.id);
                                        isNewAppAdded = true;
                                        //create a notification for user
                                        SystemNotification newNotification = new SystemNotification();
                                        newNotification.User_ID = current_user;
                                        newNotification.AppID = app.id;
                                        newNotification.Read = false;
                                        newNotification.Type = "Application";
                                        newNotification.TriggeredBy = "System";
                                        newNotification.DateTime = DateTime.Now;
                                        newNotification.Title = "Your Application with Application ID : " + app.appID + " is created";

                                        dbcontext.SystemNotifications.Add(newNotification);
                                        dbcontext.SaveChanges();
                                        

                                    }
                                   
                                    



                                    //  choicesdata = dbcontext.MakeChoices.Where(x => x.Uni_ID == univ.id && x.User_ID == current_user).ToList();

                                    //Choices ch = new Choices();


                                    //show griview here after inserting data

                                    //ch.show(univ.id);




                                }


                            }

                        }


                    }
                }

            }


            choicesdata = dbcontext.MakeChoices.Where(x => x.Uni_ID == univ.id && x.User_ID == current_user).ToList();


        }
        
        var data1 = choicesdata.Select(q => new { q.id, departmentName = q.Department.Department_Name, campusName = q.Campus.Campus_Name, catagory = q.ProgrammCategory.Category.Category_Name }).ToArray();
        ApplicationData appData = new ApplicationData();
        appData.data = data1;
        appData.isNewApp = isNewAppAdded;
        // JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        //String result = serializer.Serialize(data1);
        var js = JsonConvert.SerializeObject(appData);
        String result = serializer.Serialize(appData);

        //choicesdata = dbcontext.MakeChoices.ToList();
        
        return js;
    }
    [System.Web.Services.WebMethod]
    public static string deletePreference(string id)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int id_ = int.Parse(id);
        MakeChoice pref = db.MakeChoices.Where(q=>q.id == id_).FirstOrDefault();
        int univID = pref.Uni_ID;
        db.MakeChoices.Remove(pref);
        db.SaveChanges();
        IEnumerable<MakeChoice> choicesdata = db.MakeChoices.Where(x => x.Uni_ID == univID && x.User_ID == current_user).ToList();
        var data1 = choicesdata.Select(q => new { q.id, departmentName = q.Department.Department_Name, campusName = q.Campus.Campus_Name, catagory = q.ProgrammCategory.Category.Category_Name }).ToArray();
        // JsonConvert.SerializeObject(data1);
        var serializer = new JavaScriptSerializer();
        //String result = serializer.Serialize(data1);
        var js = JsonConvert.SerializeObject(data1);
        String result = serializer.Serialize(data1);
        //choicesdata = dbcontext.MakeChoices.ToList();
        return result;
    }
    //protected void next_click(object sender, EventArgs e)

    //{
    //    Response.Redirect("Educational_Detail");
    //}

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text;
    }
    //button next click from make choice to educational details
    protected void next_click(object sender, EventArgs e)
    {
        
            Response.Redirect("Educational_Detail.aspx");
        
    }

    protected void buttonEdit_Click(object sender, EventArgs e)
    {
    }



    protected void btn_saveSession_Click(object sender, EventArgs e)
    {
        
        Session["appIDS"] = applicationIDs;
        Response.Redirect(Request.RawUrl);
       
    }
}


