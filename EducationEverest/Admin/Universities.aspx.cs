using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Universities : System.Web.UI.Page
{
    public String txt;
    public string program_name;
    public int dpt_id;
    public int depart_id;
    public static int uni_id;
    public int pg_id;
    public int pgg_id;
    public string pg_name;
    public int d_id;
    public int ctt_id;
    public string univname;


    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    if (Session["value"] != null)
        //{
        //    if (Convert.ToInt32(Session["value"]) != 0)
        //    {
        //        uni_id = Convert.ToInt32(Session["value"]);
        //        Session["value"] = null;
        //    }
        //    else
        //    {
        //        uni_id = 0;
        //        Session["value"] = null;
        //    }
        //}
        //populate_university();
        //populate_admission_details();

        //if (ViewState["departments"] == null)
        //{
        //    ViewState["departments"] = 10;
        //}
        
        //if(ViewState["programms"] == null)
        //{
        //    ViewState["programms"] = 5;
        //}
        

        //    populate_campus();
        //    populate_categories();

        //    populate_ddl_Departments();
        //}
        
        //populate_department();
        //if(ViewState["selectedIndex"] != null)
        //{
        //    //populate programms
        //    ddl_SelectDepartment_SelectedIndexChanged(sender, e);
        //    if (Convert.ToInt32(ViewState["selectedIndex"].ToString()) == 0)
        //    {
        //        lbl_department.Visible = false;
        //        savePrograms.Visible = false;
        //        lb_moreProgramms.Visible = false;
        //    }
        //}
    }

   protected void populate_ddl_Departments()
    {
        //List<Department> departments = db.Departments.Where(a => a.Uni_ID == 1).ToList();
        ////populate dropdownlist of departments for programms
        //List<Department> selectedDepartments = departments.Where(a => a.Department_Name != "").ToList();
        //if (selectedDepartments.Count != 0)
        //{
        //    ddl_SelectDepartment.DataSource = selectedDepartments;
        //    ddl_SelectDepartment.DataTextField = "Department_Name";
        //    ddl_SelectDepartment.DataValueField = "id";
        //    ddl_SelectDepartment.DataBind();

        //}
        //ddl_SelectDepartment.Items.Insert(0, new ListItem("Select Department", "0"));

    }

    public void populate_programms()
    {
    //    var h = 0;
    //    foreach (Control ctrl in PlaceHolder3.Controls)
    //    {
    //        if (ctrl is PlaceHolder)
    //        {
    //            foreach (Control c in ctrl.Controls)
    //            {
    //                if (c is Label)
    //                {
    //                    Label lb = (Label)c;
    //                    this.txt = lb.Text;

    //                    Department dpt = db.Departments.Where(x => x.Uni_ID == uni_id && x.Department_Name == this.txt).First();
    //                    int d_id = dpt.id;
    //                }
    //                if (c is PlaceHolder)
    //                {
                        
    //                    List<Programm> pg = db.Programms.Where(x => x.Department_ID == d_id  && x.Uni_ID == uni_id).ToList();

    //                    foreach (Control d in c.Controls)
    //                    {

    //                        if (d is TextBox && h < pg.Count)
    //                        {
    //                            TextBox tb = (TextBox)d;
    //                            tb.Text = pg[h].Program_Name;
    //                            pg_name = tb.Text;
    //                            h++;
    //                        }

    //                        if (d is CheckBox && db.Programms.Any(x => x.Uni_ID == uni_id && x.Department_ID == d_id && x.Program_Name == pg_name))
    //                        {
    //                            CheckBox cb = (CheckBox)d;
    //                            Category ct = db.Categories.Where(x => x.Uni_ID == uni_id && x.Category_Name == cb.Text).First();
    //                            int ct_id = ct.id;
    //                            Programm p = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == d_id && x.Program_Name == pg_name).First();
    //                            int pg_id = p.id;
    //                            if (db.ProgrammCategories.Any(x => x.Uni_ID == uni_id && x.Department_ID == dpt_id && x.Category_ID == ct_id && x.Programm_ID == pg_id))
    //                            {
    //                                cb.Checked = true;
    //                            }

    //                        }

    //                    }


    //                }

    //            }
    //        }
    //    }
    //}

    //public void populate_prog_2()
    //{
    //    foreach (Control ctrl in PlaceHolder3.Controls)
    //    {
    //        var y = 0;
    //        if (ctrl is PlaceHolder)
    //        {
    //            foreach (Control c in ctrl.Controls)

    //            {

    //                if (c is Label)
    //                {
    //                    Label lb = (Label)c;
    //                    string dpt_name = lb.Text; 
    //                    Department dpt = db.Departments.Single(x => x.Department_Name == dpt_name && x.Uni_ID == uni_id);
    //                    depart_id = dpt.id;
    //                    lb.ID = dpt.id.ToString() + "_i";
    //                }
    //                List<Programm> pgm = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == depart_id).ToList();

    //                if (c is PlaceHolder)
    //                {
    //                    foreach (Control d in c.Controls)
    //                    {
    //                        if (d is TextBox)
    //                        {
    //                            {
    //                                if (y < pgm.Count)
    //                                {
    //                                    TextBox dd = (TextBox)d;
    //                                    dd.Text = pgm[y].Program_Name;
    //                                    dd.ID = pgm[y].id + "_pg";
    //                                    Programm ppp = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == depart_id && x.Program_Name == dd.Text).First();
    //                                    pgg_id = ppp.id;
    //                                    y++;
    //                                    foreach (Control e in c.Controls)
    //                                    {
    //                                        if (e is CheckBox)
    //                                        {
    //                                            CheckBox ee = (CheckBox)e;
    //                                            string cb_name = ee.Text;

    //                                            if (db.Categories.Any(x => x.Category_Name == ee.Text && x.Uni_ID == uni_id))
    //                                            {
    //                                                Category ctt = db.Categories.Where(x => x.Category_Name == ee.Text && x.Uni_ID == uni_id).First();
    //                                                ctt_id = ctt.id;
    //                                            }
    //                                            if (db.ProgrammCategories.Any(x => x.Uni_ID == uni_id && x.Department_ID == depart_id && x.Category_ID == ctt_id && x.Programm_ID == pgg_id))
    //                                            {
    //                                                ee.Enabled = true;
    //                                                ee.Checked = true;
    //                                            }

    //                                            if(db.ProgrammCategories.Any(x=>x.Category_ID == ctt_id && x.Programm_ID == pgg_id))
    //                                            {
    //                                               ProgrammCategory pgcategory= db.ProgrammCategories.Where(x => x.Category_ID == ctt_id && x.Programm_ID == pgg_id).First();
    //                                                ee.ID = pgcategory.id + "_cb";

    //                                            }


    //                                        }



    //                                    }
    //                                }
    //                            }
    //                        }
    //                    }
    //                }
    //            }
    //        }
    //    }
    }


    public void populate_university()
    {
        //if (db.Universities.Any(x => x.id == uni_id))
        //{
        //    University univ = db.Universities.Where(x => x.id == uni_id).First();
        //    string univ_name = univ.Name;
        //    TextBox1.Text = univ_name;
        //}
        //if (db.Portfolios.Any(x=> x.Uni_ID == uni_id))
        //{
        //    Portfolio ptf = db.Portfolios.Where(x => x.Uni_ID == uni_id).First();
        //    string contact1 = ptf.Contact1;
        //    TextBox2.Text = contact1;
        //    string contact2 = ptf.Contact2;
        //    TextBox3.Text = contact2;
        //    string contact3 = ptf.Contact3;
        //    TextBox4.Text = contact3;
        //    string contact4 = ptf.Contact4;
        //    TextBox5.Text = contact4;
        //    string email = ptf.Email;
        //    TextBox6.Text = email;
        //    string address = ptf.Address;
        //    TextBox7.Text = address;
        //    string category = ptf.Category;
        //    TextBox8.Text = category;
        //}

    }

    public void populate_admission_details()
    {
        //if (db.AdmissionDetails.Any(x => x.Uni_ID == uni_id))
        //{
        //    AdmissionDetail adm = db.AdmissionDetails.Where(x => x.Uni_ID == uni_id).First();
        //    TextArea1.Value = adm.Criteria;
        //    TextArea2.Value = adm.AdmissionDocuments;
        //    TextArea3.Value = adm.FreeStructure;
        //}
    }



    public void populate_department()
    {
        
        //get total departments 
        //PlaceHolder2.Controls.Clear();
        //List<Department> departments = db.Departments.Where(a=> a.Uni_ID == 1).ToList();
        //int department_textboxes = departments.Count();
        //if (department_textboxes < Convert.ToInt32(ViewState["departments"]))
        //{
        //    department_textboxes = Convert.ToInt32(ViewState["departments"]);
        //}
        
        //for (int i=0; i < department_textboxes; i++)
        //{
        //    HtmlGenericControl NewControl = new HtmlGenericControl("div");
        //    NewControl.Attributes.Add("class", "col-md-12");

        //    TextBox MyTextBox = new TextBox();
        //    //nd = new department

        //    MyTextBox.ID =  "nd"+i.ToString();
        //    if (i < departments.Count)
        //    {
        //        MyTextBox.Text = departments[i].Department_Name;
        //        //ed = existing department
        //        MyTextBox.ID = "ed" + departments[i].id.ToString();
        //    }else
        //    {
        //        MyTextBox.Text = string.Empty;
        //    }

        //    MyTextBox.Attributes.Add("placeholder", "Enter Departmnet Name " + (i+1) );
        //    MyTextBox.Attributes.Add("style", "margin-bottom:5px");
        //    MyTextBox.Attributes.Add("class", "form-control");
        //    MyTextBox.Attributes.Add("runat", "server");

            
        //    NewControl.Controls.Add(MyTextBox);
        //    PlaceHolder2.Controls.Add(NewControl);
        //}
        

    }

    
    public void populate_campus()
    {
        if (db.Campuses.Any(x => x.Uni_ID == uni_id))
        {
            List<Campus> cmps = db.Campuses.Where(x => x.Uni_ID == uni_id).ToList();

            var i = 0;
            foreach (Control ctrl in PlaceHolder4.Controls)
            {
                if (ctrl is TextBox && i < cmps.Count)
                {
                    TextBox tb = (TextBox)ctrl;
                    tb.Text = cmps[i].Campus_Name;
                    tb.ID = cmps[i].id.ToString();
                    i++;
                }

            }
        }
    }


    public void populate_categories()
    {
        //if (db.Categories.Any(x => x.Uni_ID == uni_id))
        //{
        //    List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();

        //    var i = 0;
        //    foreach (Control ctrl in PlaceHolder1.Controls)
        //    {
        //        if (ctrl is TextBox && i < cat.Count)
        //        {
        //            TextBox tb = (TextBox)ctrl;
        //            tb.Text = cat[i].Category_Name;
        //            tb.ID = cat[i].id + "_ct";
        //            i++;
        //        }

        //    }
        //}
    }


    public void dynamic()
    {



        //List<Department> dpt = db.Departments.Where(x => x.Uni_ID == uni_id).ToList();
        //var i = 0;

        //var m = 1;

        //foreach (var x in dpt)
        //{
        //    var j = 0;
        //    var k = 0;
        //    var l = 0;

        //    PlaceHolder holder = new PlaceHolder();
        //    holder.ID = "holder " + i.ToString();
        //    holder.Controls.Add(new LiteralControl("<br/>"));
        //    Label lbl = new Label();
        //    lbl.ID = "label " + i.ToString();
        //    lbl.Text = x.Department_Name;

        //    holder.Controls.Add(lbl);
        //    holder.Controls.Add(new LiteralControl("<br/>"));

        //    TextBox txb1 = new TextBox();
        //    txb1.CssClass = "form-control";


        //    TextBox txb2 = new TextBox();
        //    txb2.CssClass = "form-control";

        //    TextBox txb3 = new TextBox();
        //    txb3.CssClass = "form-control";

        //    i++;
        //    PlaceHolder pc = new PlaceHolder();
        //    pc.ID = "holder " + i;

        //    pc.Controls.Add(txb1);

        //    List<Category> category = db.Categories.Where(n => n.Uni_ID == uni_id).ToList();


        //    foreach (var z in category)
        //    {

        //        if (j < category.Count)
        //        {


        //            CheckBox cb = new CheckBox();
        //            cb.ID = "radio " + m;
        //            cb.Text = category[j].Category_Name;
        //            j++;
        //            m++;
        //            pc.Controls.Add(cb);
        //        }
        //        holder.Controls.Add(pc);
        //    }








        //    holder.Controls.Add(new LiteralControl("<br/>"));
        //    i++;
        //    PlaceHolder pc1 = new PlaceHolder();
        //    pc1.ID = "holder " + i;
        //    pc1.Controls.Add(txb2);


        //    foreach (var z in category)
        //    {

        //        if (k < category.Count)
        //        {

        //            CheckBox cb = new CheckBox();
        //            cb.ID = "radio1 " + m;
        //            cb.Text = category[k].Category_Name;
        //            k++;
        //            m++;
        //            pc1.Controls.Add(cb);
        //        }
        //        holder.Controls.Add(pc1);
        //    }






        //    holder.Controls.Add(new LiteralControl("<br/>"));

        //    i++;
        //    PlaceHolder pc2 = new PlaceHolder();
        //    pc2.ID = "holder " + i;
        //    pc2.Controls.Add(txb3);

        //    foreach (var z in category)
        //    {

        //        if (l < category.Count)
        //        {


        //            CheckBox cb = new CheckBox();
        //            cb.ID = "radio2 " + m;
        //            cb.Text = category[l].Category_Name;
        //            l++;
        //            m++;
        //            pc2.Controls.Add(cb);
        //        }
        //        holder.Controls.Add(pc2);
        //    }






        //    PlaceHolder3.Controls.Add(holder);
        //    i++;
        //}
    }

    public void dynamic3()
    {
        //uni_id = 1;
        //if (db.Departments.Any(x => x.Uni_ID == uni_id))
        //{
        //    List<Department> departments = db.Departments.Where(x => x.Uni_ID == uni_id && x.Department_Name != "").ToList();
        //    PlaceHolder3.Controls.Clear();
            
        //    foreach (var department in departments)
        //    {
        //        Label lbl = new Label();
        //        lbl.Text = department.Department_Name.ToUpper();
        //        lbl.Font.Bold = true;
        //        lbl.ID = "lbl_" + department.id;
                
        //        List<Programm> programms = db.Programms.Where(a => a.Department_ID == department.id).ToList();
        //        int programm_textboxes = programms.Count();
        //        if(programm_textboxes < Convert.ToInt32(ViewState["programms"]))
        //        {
        //            programm_textboxes = Convert.ToInt32(ViewState["programms"]);
        //        }
        //        HtmlGenericControl NewControl = new HtmlGenericControl("div");
        //        NewControl.Controls.Add(lbl);
        //        for (int i = 0; i < programm_textboxes; i++)
        //        {
                   
        //            NewControl.Attributes.Add("class", "col-md-12");

        //            TextBox MyTextBox = new TextBox();
        //            // np = new program
        //            MyTextBox.ID = "np"+department.id+i.ToString();
        //            if (i < programms.Count)
        //            {
        //                MyTextBox.Text = programms[i].Program_Name;
        //                // ep = existing program
        //                MyTextBox.ID = "ep"+department.id+programms[i].id.ToString();
        //            }
        //            else
        //            {
        //                MyTextBox.Text = string.Empty;
        //            }
                    
        //            MyTextBox.Attributes.Add("placeholder", "Enter Program Name " + (i + 1));
        //            MyTextBox.Attributes.Add("style", "margin-bottom:5px");
        //            MyTextBox.Attributes.Add("class", "form-control");
        //            MyTextBox.Attributes.Add("runat", "server");
                    
        //            NewControl.Controls.Add(MyTextBox);
        //            PlaceHolder3.Controls.Add(NewControl);
        //        }
               

                
        //    }

        //}

     }
    public void dynamic2()
    {
        //if (db.Departments.Any(x => x.Uni_ID == uni_id))
        //{
        //    List<Department> dpt = db.Departments.Where(x => x.Uni_ID == uni_id).ToList();
        //    foreach (var z in dpt)
        //    {
                
        //        Label lbl = new Label();
        //        lbl.Text = z.Department_Name;
        //        lbl.Font.Bold = true;
        //        lbl.ID = "lbl_"+z.id;
        //        PlaceHolder3.Controls.Add(lbl);
                
        //        List<Programm> pg = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == z.id).ToList();
                
        //        foreach (var t in pg)
        //        {
                    
        //            TextBox tb = new TextBox();  
        //            tb.ID = z.id+"_"+t.id;
        //            tb.Text = t.Program_Name;
        //            tb.CssClass = "form-control";
        //            PlaceHolder3.Controls.Add(tb);

        //            if(db.Categories.Any(x=> x.Uni_ID == uni_id))
        //            {
        //                List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
        //                foreach(var m in cat)
        //                {
        //                    CheckBox cbx = new CheckBox();
        //                    cbx.Text = m.Category_Name;
        //                    cbx.ID = t.id+"_"+m.id;
        //                    string[] split = cbx.ID.ToString().Split('_');
        //                    int prg_id = Convert.ToInt32(split[0]);
        //                    int cat_id = Convert.ToInt32(split[1]);
        //                    if (db.ProgrammCategories.Any(x=> x.Category_ID == cat_id && x.Programm_ID == prg_id))
        //                    {
        //                        cbx.Enabled = true;
        //                    }
        //                    PlaceHolder3.Controls.Add(cbx);
        //                }
                        
        //            }
                    

        //        }
        //        TextBox tbb = new TextBox();
        //        tbb.ID = "dpt_" + z.id;
        //        tbb.CssClass = "form-control";
        //        PlaceHolder3.Controls.Add(tbb);
        //        if (db.Categories.Any(x => x.Uni_ID == uni_id))
        //        {
        //            List<Category> ctg = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
        //            foreach(var n in ctg)
        //            {
        //                CheckBox cbx = new CheckBox();
        //                cbx.Text = n.Category_Name;
        //                cbx.ID = "checkbox"+"_"+ n.id +"_"+ z.id;
        //                PlaceHolder3.Controls.Add(cbx);
                        
        //            }


        //        }

        //        PlaceHolder3.Controls.Add(new LiteralControl("<br/>"));
        //    }
           
        //}
    }

    



    protected void save_Programs(object sender, EventArgs e)
    {
       
        //foreach (Control ctrl in PlaceHolder3.Controls)
        //{
        //    if (ctrl.Controls[0] is TextBox)
        //    {
        //        TextBox txtb = (TextBox)ctrl.Controls[0];
        //        string textboxID = txtb.ID;
        //        int programId = Convert.ToInt32(Regex.Match(textboxID, @"\d+").Value);
        //        int departmentId = Convert.ToInt32(ddl_SelectDepartment.SelectedValue);
        //        if (textboxID.Contains("ep") && db.Programms.Any(a => a.id == programId && a.Department_ID == departmentId))
        //        {
        //            //update that program
        //            Programm existingProgram = db.Programms.Where(a => a.id == programId && a.Department_ID == departmentId).First();
        //            existingProgram.Program_Name = txtb.Text;

        //            db.SaveChanges();
        //            programId = existingProgram.id;
        //        }
        //        else
        //        {
        //            //create new program
        //            Programm newProgram = new Programm();
        //            newProgram.Program_Name = txtb.Text;
        //            newProgram.Department_ID = departmentId;
        //            newProgram.Uni_ID = 1;
        //            db.Programms.Add(newProgram);
        //            db.SaveChanges();
        //            programId = newProgram.id;
        //        }


        //        //save programCategories
        //        foreach(Control categoryCtrl in ctrl.Controls[1].Controls)
        //        {
        //            if (categoryCtrl is CheckBox)
        //            {
                        
        //            }
        //        }


        //    }
           
        //}
        //ddl_SelectDepartment.SelectedIndex = Convert.ToInt32(ViewState["selectedIndex"].ToString());
        //ddl_SelectDepartment_SelectedIndexChanged(sender, e);


    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //    if (!(db.Universities.Any(x => x.id == 1)))
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Enter And Save Data In Portfolio')", true);
        //}
        //else
        //{
        //    foreach (Control ctrl in PlaceHolder2.Controls)
        //    {
        //        if (ctrl.Controls[0] is TextBox)
        //        {
        //            TextBox txtb = (TextBox)ctrl.Controls[0];
        //            string textboxID = txtb.ID;
        //            int departmentId = Convert.ToInt32(Regex.Match(textboxID, @"\d+").Value);

        //            if(textboxID.Contains("ed") && db.Departments.Any(a => a.id == departmentId && a.Uni_ID == 1))
        //            {
        //                //update that department
        //                Department existingDepartment = db.Departments.Where(a => a.id == departmentId && a.Uni_ID == 1).First();
        //                existingDepartment.Department_Name = txtb.Text;

        //                db.SaveChanges();
        //            }
        //            else
        //            {
        //                //create new department
        //                Department newDepartment = new Department();
        //                newDepartment.Department_Name = txtb.Text;
        //                newDepartment.Uni_ID = 1;
        //                db.Departments.Add(newDepartment);
        //                db.SaveChanges();
        //            }

                    
                    
        //        }
        //    }
            
        //}
    }



    bool IsDigitsOnly(string str)
    {
        foreach (char c in str)
        {
            if (c < '0' || c > '9')
                return false;
        }

        return true;
    }

    protected void ButtonUni_Click(object sender, EventArgs e)
    {
        
            if (db.Universities.Any(x => x.id == uni_id))
            {
                University univ = db.Universities.Where(x => x.id == uni_id).First();
                string univ_name = univ.Name;
                string v = TextBox1.Text;
            

                if (univ_name != v && !(db.Universities.Any(x => x.Name == TextBox1.Text)))
                {
                    univ.Name = v;
                    db.SaveChanges();
                }

            if (db.Portfolios.Any(x => x.Uni_ID == uni_id))
            {
                Portfolio pf = db.Portfolios.Where(x => x.Uni_ID == uni_id).First();
                pf.Contact1 = TextBox2.Text;
                pf.Contact2 = TextBox3.Text;
                pf.Contact3 = TextBox4.Text;
                pf.Contact4 = TextBox5.Text;
                pf.Email = TextBox6.Text;
                pf.Address = TextBox7.Text;
                pf.Category = TextBox8.Text;
                db.SaveChanges();
            }
            else
            {


                Portfolio portfolio = new Portfolio
                {
                    Contact1 = TextBox2.Text,
                    Contact2 = TextBox3.Text,
                    Contact3 = TextBox4.Text,
                    Contact4 = TextBox5.Text,
                    Email = TextBox6.Text,
                    Address = TextBox7.Text,
                    Category = TextBox8.Text,
                    Uni_ID = uni_id

                };
                db.Portfolios.Add(portfolio);
                db.SaveChanges();
            }
            foreach (Control ctrl in PlaceHolder4.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox txtb = (TextBox)ctrl;
                    string value = txtb.Text;
                    string s_id = txtb.ID;

                    if (IsDigitsOnly(s_id))
                    {
                        int id = Convert.ToInt32(txtb.ID);
                        Campus cmps = db.Campuses.Single(x => x.id == id);
                        if (cmps != null)
                        {
                            if (cmps.Campus_Name != value)
                            {
                                if (value == "")
                                {
                                    db.Campuses.Remove(cmps);
                                    db.SaveChanges();

                                }
                                else
                                {
                                    cmps.Campus_Name = value;
                                    db.SaveChanges();
                                }
                            }

                        }

                    }
                    else if (value != "" && !(db.Campuses.Any(x => x.Campus_Name == value && x.Uni_ID == uni_id)))
                    {
                        Campus cp = new Campus
                        {
                            Campus_Name = value,
                            Uni_ID = uni_id
                        };
                        db.Campuses.Add(cp);
                        db.SaveChanges();

                    }
                }
            }
        }

            else
            {
                if (db.Universities.Any(x => x.Name == TextBox1.Text))
                {
                            
                }
                else
                {
                    univname = TextBox1.Text;
                    University university = new University
                    {
                        Name = TextBox1.Text
                    };


                    db.Universities.Add(university);
                    db.SaveChanges();

                    University uni = db.Universities.Single(x => x.Name == TextBox1.Text);
                    uni_id = uni.id;

                Portfolio portfolio = new Portfolio
                {
                    Contact1 = TextBox2.Text,
                    Contact2 = TextBox3.Text,
                    Contact3 = TextBox4.Text,
                    Contact4 = TextBox5.Text,
                    Email = TextBox6.Text,
                    Address = TextBox7.Text,
                    Category = TextBox8.Text,
                    Uni_ID = uni_id

                };
                db.Portfolios.Add(portfolio);
                db.SaveChanges();

                foreach (Control ctrl in PlaceHolder4.Controls)
                {
                    if (ctrl is TextBox)
                    {
                        TextBox txtb = (TextBox)ctrl;
                        string value = txtb.Text;
                        string s_id = txtb.ID;

                        if (IsDigitsOnly(s_id))
                        {
                            int id = Convert.ToInt32(txtb.ID);
                            Campus cmps = db.Campuses.Single(x => x.id == id);
                            if (cmps != null)
                            {
                                if (cmps.Campus_Name != value)
                                {
                                    if (value == "")
                                    {
                                        db.Campuses.Remove(cmps);
                                        db.SaveChanges();

                                    }
                                    else
                                    {
                                        cmps.Campus_Name = value;
                                        db.SaveChanges();
                                    }
                                }

                            }

                        }
                        else if (value != "" && !(db.Campuses.Any(x => x.Campus_Name == value && x.Uni_ID == uni_id)))
                        {
                            Campus cp = new Campus
                            {
                                Campus_Name = value,
                                Uni_ID = uni_id
                            };
                            db.Campuses.Add(cp);
                            db.SaveChanges();

                        }
                    }
                }

            }
  }
        Session["value"] = uni_id;
        Response.Redirect(Request.RawUrl); }

    protected void Criteria_Click(object sender, EventArgs e)
    {
        if (!(db.Universities.Any(x => x.id == uni_id)))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Enter And Save Data In Portfolio')", true);
        }
        else
        {

            if (db.AdmissionDetails.Any(x => x.Uni_ID == uni_id))
            {
                AdmissionDetail adm = db.AdmissionDetails.Where(x => x.Uni_ID == uni_id).First();
                string value = adm.Criteria;
                if (TextArea1.Value != value)
                {
                    if (TextArea1.Value == "")
                    {
                        adm.Criteria = "";
                        db.SaveChanges();
                    }
                    else
                    {
                        adm.Criteria = TextArea1.Value;
                        db.SaveChanges();
                    }


                }
            }
            else
            {
                AdmissionDetail adm = new AdmissionDetail
                {
                    Criteria = TextArea1.Value,
                    Uni_ID = uni_id
                };
                db.AdmissionDetails.Add(adm);
                db.SaveChanges();
            }
        }
    }

    protected void Document_Click(object sender, EventArgs e)
    {
        if (!(db.Universities.Any(x => x.id == uni_id)))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Enter And Save Data In Portfolio')", true);
        }
        else
        {
            if (db.AdmissionDetails.Any(x => x.Uni_ID == uni_id))
            {
                AdmissionDetail adm = db.AdmissionDetails.Where(x => x.Uni_ID == uni_id).First();
                string value = adm.AdmissionDocuments;
                if (TextArea2.Value != value)
                {
                    if (TextArea2.Value == "")
                    {
                        adm.AdmissionDocuments = "";
                        db.SaveChanges();
                    }
                    else
                    {
                        adm.AdmissionDocuments = TextArea2.Value;
                        db.SaveChanges();
                    }


                }
            }
            else
            {
                AdmissionDetail adm = new AdmissionDetail
                {
                    AdmissionDocuments = TextArea2.Value,
                    Uni_ID = uni_id
                };
                db.AdmissionDetails.Add(adm);
                db.SaveChanges();
            }
        }
    }

    protected void Fee_Click(object sender, EventArgs e)
    {
        //if (!(db.Universities.Any(x => x.id == uni_id)))
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Enter And Save Data In Portfolio')", true);
        //}
        //else
        //{
        //    if (db.AdmissionDetails.Any(x => x.Uni_ID == uni_id))
        //    {
        //        AdmissionDetail adm = db.AdmissionDetails.Where(x => x.Uni_ID == uni_id).First();
        //        string value = adm.FreeStructure;
        //        if (TextArea3.Value != value)
        //        {
        //            if (TextArea3.Value == "")
        //            {
        //                adm.FreeStructure = "";
        //                db.SaveChanges();
        //            }
        //            else
        //            {
        //                adm.FreeStructure = TextArea3.Value;
        //                db.SaveChanges();
        //            }


        //        }
        //    }
        //    else
        //    {
        //        AdmissionDetail adm = new AdmissionDetail
        //        {
        //            FreeStructure = TextArea3.Value,
        //            Uni_ID = uni_id
        //        };
        //        db.AdmissionDetails.Add(adm);
        //        db.SaveChanges();
        //    }

        //}
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //if (!(db.Universities.Any(x => x.id == uni_id)))
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Enter And Save Data In Portfolio')", true);
        //}
        //else
        //{
        //    foreach (Control ctrl in PlaceHolder1.Controls)
        //    {
        //        if (ctrl is TextBox)
        //        {
        //            TextBox txtb = (TextBox)ctrl;
        //            string value = txtb.Text;
        //            string s_id = txtb.ID;

        //            string[] split = txtb.ID.Split('_');
        //            string txtb_id = split[0];

        //            if (IsDigitsOnly(txtb_id))
        //            {
        //                int id = Convert.ToInt32(txtb_id);
        //                Category cat = db.Categories.Single(x => x.id == id);
        //                if (cat != null)
        //                {
        //                    if (cat.Category_Name != value)
        //                    {
        //                        if (value == "")
        //                        {
        //                            if (db.ProgrammCategories.Any(x => x.Category_ID == id))
        //                            {
        //                                List<ProgrammCategory> pgcat = db.ProgrammCategories.Where(y => y.Category_ID == id).ToList();
        //                                db.ProgrammCategories.RemoveRange(pgcat);
        //                            }
        //                            db.Categories.Remove(cat);
        //                            db.SaveChanges();

        //                        }
        //                        else
        //                        {
        //                            cat.Category_Name = value;
        //                            db.SaveChanges();
        //                        }
        //                    }

        //                }

        //            }
        //            else if (value != "" && !(db.Categories.Any(x => x.Category_Name == value && x.Uni_ID == uni_id)))
        //            {
        //                Category cat = new Category
        //                {
        //                    Category_Name = value,
        //                    Uni_ID = uni_id
        //                };
        //                db.Categories.Add(cat);
        //                db.SaveChanges();

        //            }
        //        }
        //    }


        //    Response.Redirect(Request.RawUrl);
        //}
    }


    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        //uni_id = 0;
        Response.Redirect("Main_Uni.aspx");
        
    }



    protected void Load_more_departments(object sender, EventArgs e)
    {
        ViewState["departments"] = Convert.ToInt32(ViewState["departments"]) + 10;
        populate_department();
    }
    protected void Load_More_Programms(object sender, EventArgs e)
    {
        ViewState["programms"] = Convert.ToInt32(ViewState["programms"]) + 5;
        ddl_SelectDepartment.SelectedIndex = Convert.ToInt32(ViewState["selectedIndex"].ToString());
        ddl_SelectDepartment_SelectedIndexChanged(sender, e);
    }

    protected void ddl_SelectDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        //PlaceHolder3.Controls.Clear();
        //ViewState["selectedIndex"] = ddl_SelectDepartment.SelectedIndex;
        //int departmentId = Convert.ToInt32(ddl_SelectDepartment.SelectedValue);
        //if (departmentId != 0)
        //{
        //    Department department = db.Departments.Where(a => a.id == departmentId).First();
        //    lbl_department.Text = department.Department_Name.ToUpper();
        //    lbl_department.Visible = true;
            
        //    List<Programm> programms = db.Programms.Where(a => a.Department_ID == department.id).ToList();
        //    int programm_textboxes = programms.Count();
        //    if (programm_textboxes < Convert.ToInt32(ViewState["programms"]))
        //    {
        //        programm_textboxes = Convert.ToInt32(ViewState["programms"]);
        //    }
        //    // see categories
            


        //    for (int i = 0; i < programm_textboxes; i++)
        //    {
        //        HtmlGenericControl NewControl = new HtmlGenericControl("div");
        //        NewControl.Attributes.Add("width", "200");
        //        NewControl.Attributes.Add("class", "col-md-12");

        //        TextBox MyTextBox = new TextBox();
        //        // np = new program
        //        MyTextBox.ID = "np" +  i.ToString();
        //        if (i < programms.Count)
        //        {
        //            MyTextBox.Text = programms[i].Program_Name;
        //            // ep = existing program
        //            MyTextBox.ID = "ep" +  programms[i].id.ToString();
        //        }
        //        else
        //        {
        //            MyTextBox.Text = string.Empty;
        //        }
                
        //        MyTextBox.Attributes.Add("placeholder", "Enter Program Name " + (i + 1));
        //        MyTextBox.Attributes.Add("style", "margin-bottom:5px");
        //        MyTextBox.Attributes.Add("class", "form-control");
        //        MyTextBox.Attributes.Add("runat", "server");

        //        List<Category> categories = db.Categories.ToList();
        //        HtmlGenericControl categoriesDiv = new HtmlGenericControl("div");
        //        for (int j = 0; j < categories.Count; j++)
        //        {
        //            CheckBox cb_category = new CheckBox();
        //            cb_category.Text = categories[j].Category_Name.ToUpper();
        //            cb_category.Attributes.Add("style", "margin-left:15px");
        //            // npc = new program category
        //            cb_category.ID = "npc"+ i.ToString() + categories[j].id.ToString();
        //            if( i < programms.Count)
        //            {
        //                //epc = existing epc
        //                cb_category.ID = "epc" + programms[i].id + categories[j].id.ToString();
        //            }
        //            categoriesDiv.Controls.Add(cb_category);
        //        }

        //        NewControl.Controls.Add(MyTextBox);
        //        NewControl.Controls.Add(categoriesDiv);
        //        PlaceHolder3.Controls.Add(NewControl);
        //    }
        //    lb_moreProgramms.Visible = true;
        //    savePrograms.Visible = true;
            
        //}
    }
}