using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Universities : System.Web.UI.Page
{
    public String txt;
    public string program_name;
    public int dpt_id;
    public int depart_id;
    public int uni_id = 76;
    public int pg_id;
    public int pgg_id;
    public string pg_name;
    public int d_id;
    public int ctt_id;
    public string univname;


    EducationEverestEntities db = new EducationEverestEntities();

    public void populate_programms()
    {
        var h = 0;
        foreach (Control ctrl in PlaceHolder3.Controls)
        {
            if (ctrl is PlaceHolder)
            {
                foreach (Control c in ctrl.Controls)
                {
                    if (c is Label)
                    {
                        Label lb = (Label)c;
                        this.txt = lb.Text;

                        Department dpt = db.Departments.Where(x => x.Uni_ID == uni_id && x.Department_Name == this.txt).First();
                        int d_id = dpt.id;
                    }
                    if (c is PlaceHolder)
                    {
                        
                        List<Programm> pg = db.Programms.Where(x => x.Department_ID == d_id  && x.Uni_ID == uni_id).ToList();

                        foreach (Control d in c.Controls)
                        {

                            if (d is TextBox && h < pg.Count)
                            {
                                TextBox tb = (TextBox)d;
                                tb.Text = pg[h].Program_Name;
                                pg_name = tb.Text;
                                h++;
                            }

                            if (d is CheckBox && db.Programms.Any(x => x.Uni_ID == uni_id && x.Department_ID == d_id && x.Program_Name == pg_name))
                            {
                                CheckBox cb = (CheckBox)d;
                                Category ct = db.Categories.Where(x => x.Uni_ID == uni_id && x.Category_Name == cb.Text).First();
                                int ct_id = ct.id;
                                Programm p = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == d_id && x.Program_Name == pg_name).First();
                                int pg_id = p.id;
                                if (db.ProgrammCategories.Any(x => x.Uni_ID == uni_id && x.Department_ID == dpt_id && x.Category_ID == ct_id && x.Programm_ID == pg_id))
                                {
                                    cb.Checked = true;
                                }

                            }

                        }


                    }

                }
            }
        }
    }

    public void populate_prog_2()
    {
        foreach (Control ctrl in PlaceHolder3.Controls)
        {
            var y = 0;
            if (ctrl is PlaceHolder)
            {
                foreach (Control c in ctrl.Controls)

                {

                    if (c is Label)
                    {
                        Label lb = (Label)c;
                        string dpt_name = lb.Text; 
                        Department dpt = db.Departments.Single(x => x.Department_Name == dpt_name && x.Uni_ID == uni_id);
                        depart_id = dpt.id;
                        lb.ID = dpt.id.ToString() + "_i";
                    }
                    List<Programm> pgm = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == depart_id).ToList();

                    if (c is PlaceHolder)
                    {
                        foreach (Control d in c.Controls)
                        {
                            if (d is TextBox)
                            {
                                {
                                    if (y < pgm.Count)
                                    {
                                        TextBox dd = (TextBox)d;
                                        dd.Text = pgm[y].Program_Name;
                                        dd.ID = pgm[y].id.ToString();
                                        Programm ppp = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == depart_id && x.Program_Name == dd.Text).First();
                                        pgg_id = ppp.id;
                                        y++;
                                        foreach (Control e in c.Controls)
                                        {
                                            if (e is CheckBox)
                                            {
                                                CheckBox ee = (CheckBox)e;
                                                string cb_name = ee.Text;

                                                if (db.Categories.Any(x => x.Category_Name == ee.Text && x.Uni_ID == uni_id))
                                                {
                                                    Category ctt = db.Categories.Where(x => x.Category_Name == ee.Text && x.Uni_ID == uni_id).First();
                                                    ctt_id = ctt.id;
                                                }
                                                if (db.ProgrammCategories.Any(x => x.Uni_ID == uni_id && x.Department_ID == depart_id && x.Category_ID == ctt_id && x.Programm_ID == pgg_id))
                                                {
                                                    ee.Enabled = true;
                                                    ee.Checked = true;
                                                }

                                                if(db.ProgrammCategories.Any(x=>x.Category_ID == ctt_id && x.Programm_ID == pgg_id))
                                                {
                                                   ProgrammCategory pgcategory= db.ProgrammCategories.Where(x => x.Category_ID == ctt_id && x.Programm_ID == pgg_id).First();
                                                    ee.ID = pgcategory.id.ToString();

                                                }


                                            }



                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    public void populate_university()
    {
        if (db.Universities.Any(x => x.id == uni_id))
        {
            University univ = db.Universities.Where(x => x.id == uni_id).First();
            string univ_name = univ.Name;
            TextBox1.Text = univ_name;
        }
        if (db.Portfolios.Any(x=> x.Uni_ID == uni_id))
        {
            Portfolio ptf = db.Portfolios.Where(x => x.Uni_ID == uni_id).First();
            string contact1 = ptf.Contact1;
            TextBox2.Text = contact1;
            string contact2 = ptf.Contact2;
            TextBox3.Text = contact2;
            string contact3 = ptf.Contact3;
            TextBox4.Text = contact3;
            string contact4 = ptf.Contact4;
            TextBox5.Text = contact4;
            string email = ptf.Email;
            TextBox6.Text = email;
            string address = ptf.Address;
            TextBox7.Text = address;
            string category = ptf.Category;
            TextBox8.Text = category;
        }

    }

    public void populate_admission_details()
    {
        if (db.AdmissionDetails.Any(x => x.Uni_ID == uni_id))
        {
            AdmissionDetail adm = db.AdmissionDetails.Where(x => x.Uni_ID == uni_id).First();
            TextArea1.Value = adm.Criteria;
            TextArea2.Value = adm.AdmissionDocuments;
            TextArea3.Value = adm.FreeStructure;
        }
    }



    public void populate_department()
    {
        if (db.Departments.Any(x => x.Uni_ID == uni_id))
        {
            List<Department> dpt = db.Departments.Where(x => x.Uni_ID == uni_id).ToList();

            var i = 0;
            foreach (Control ctrl in PlaceHolder2.Controls)
            {
                if (ctrl is TextBox && i < dpt.Count)
                {
                    TextBox tb = (TextBox)ctrl;
                    tb.Text = dpt[i].Department_Name;
                    tb.ID = dpt[i].id.ToString();
                    i++;
                }

            }
        }
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
        if (db.Categories.Any(x => x.Uni_ID == uni_id))
        {
            List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();

            var i = 0;
            foreach (Control ctrl in PlaceHolder1.Controls)
            {
                if (ctrl is TextBox && i < cat.Count)
                {
                    TextBox tb = (TextBox)ctrl;
                    tb.Text = cat[i].Category_Name;
                    tb.ID = cat[i].id.ToString();
                    i++;
                }

            }
        }
    }


    public void dynamic()
    {



        List<Department> dpt = db.Departments.Where(x => x.Uni_ID == uni_id).ToList();
        var i = 0;

        var m = 1;

        foreach (var x in dpt)
        {
            var j = 0;
            var k = 0;
            var l = 0;

            PlaceHolder holder = new PlaceHolder();
            holder.ID = "holder " + i.ToString();
            holder.Controls.Add(new LiteralControl("<br/>"));
            Label lbl = new Label();
            lbl.ID = "label " + i.ToString();
            lbl.Text = x.Department_Name;

            holder.Controls.Add(lbl);
            holder.Controls.Add(new LiteralControl("<br/>"));

            TextBox txb1 = new TextBox();
            txb1.CssClass = "form-control";


            TextBox txb2 = new TextBox();
            txb2.CssClass = "form-control";

            TextBox txb3 = new TextBox();
            txb3.CssClass = "form-control";

            i++;
            PlaceHolder pc = new PlaceHolder();
            pc.ID = "holder " + i;

            pc.Controls.Add(txb1);

            List<Category> category = db.Categories.Where(n => n.Uni_ID == uni_id).ToList();


            foreach (var z in category)
            {

                if (j < category.Count)
                {


                    CheckBox cb = new CheckBox();
                    cb.ID = "radio " + m;
                    cb.Text = category[j].Category_Name;
                    j++;
                    m++;
                    pc.Controls.Add(cb);
                }
                holder.Controls.Add(pc);
            }








            holder.Controls.Add(new LiteralControl("<br/>"));
            i++;
            PlaceHolder pc1 = new PlaceHolder();
            pc1.ID = "holder " + i;
            pc1.Controls.Add(txb2);


            foreach (var z in category)
            {

                if (k < category.Count)
                {

                    CheckBox cb = new CheckBox();
                    cb.ID = "radio1 " + m;
                    cb.Text = category[k].Category_Name;
                    k++;
                    m++;
                    pc1.Controls.Add(cb);
                }
                holder.Controls.Add(pc1);
            }






            holder.Controls.Add(new LiteralControl("<br/>"));

            i++;
            PlaceHolder pc2 = new PlaceHolder();
            pc2.ID = "holder " + i;
            pc2.Controls.Add(txb3);

            foreach (var z in category)
            {

                if (l < category.Count)
                {


                    CheckBox cb = new CheckBox();
                    cb.ID = "radio2 " + m;
                    cb.Text = category[l].Category_Name;
                    l++;
                    m++;
                    pc2.Controls.Add(cb);
                }
                holder.Controls.Add(pc2);
            }






            PlaceHolder3.Controls.Add(holder);
            i++;
        }
    }

    public void dynamic3()
    {
        var k = 0;
        if (db.Departments.Any(x => x.Uni_ID == uni_id))
        {
            List<Department> dpt = db.Departments.Where(x => x.Uni_ID == uni_id).ToList();
            foreach (var z in dpt)
            {
                PlaceHolder phl = new PlaceHolder();
                Label lbl = new Label();
                lbl.Text = z.Department_Name;
                lbl.Font.Bold = true;
                lbl.ID = "lbl_" + z.id;
                phl.Controls.Add(lbl);

                PlaceHolder mini1 = new PlaceHolder();
                PlaceHolder mini2 = new PlaceHolder();
                PlaceHolder mini3 = new PlaceHolder();

                TextBox tb1 = new TextBox();
                tb1.CssClass = "form-control";
                tb1.ID = k + "_" + 1;
                k++;

                TextBox tb2 = new TextBox();
                tb2.CssClass = "form-control";
                tb2.ID = k + "_" + 1;
                k++;

                TextBox tb3 = new TextBox();
                tb3.CssClass = "form-control";
                tb3.ID = k + "_" + 1;
                k++;


                mini1.Controls.Add(tb1);
                mini2.Controls.Add(tb2);
                mini3.Controls.Add(tb3);

                if (db.Categories.Any(x => x.Uni_ID == uni_id))
                {
                    List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
                    foreach (var m in cat)
                    {
                        CheckBox cbx = new CheckBox();
                        cbx.Text = m.Category_Name;
                        cbx.ID = k + "j" + 1;
                        k++;
                        mini1.Controls.Add(cbx);
                    }
                    mini1.Controls.Add(new LiteralControl("<br/>"));
                }


                if (db.Categories.Any(x => x.Uni_ID == uni_id))
                {
                    List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
                    foreach (var m in cat)
                    {
                        CheckBox cbx = new CheckBox();
                        cbx.Text = m.Category_Name;
                        cbx.ID = k + "j" + 1;
                        k++;

                        mini2.Controls.Add(cbx);
                    }
                    mini2.Controls.Add(new LiteralControl("<br/>"));
                }

                if (db.Categories.Any(x => x.Uni_ID == uni_id))
                {
                    List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
                    foreach (var m in cat)
                    {
                        CheckBox cbx = new CheckBox();
                        cbx.Text = m.Category_Name;
                        cbx.ID = k + "j" + 1;
                        k++;

                        mini3.Controls.Add(cbx);
                    }
                    mini3.Controls.Add(new LiteralControl("<br/>"));
                }


                phl.Controls.Add(mini1);
                phl.Controls.Add(mini2);
                phl.Controls.Add(mini3);
                PlaceHolder3.Controls.Add(phl);
            }
        }

     }
    public void dynamic2()
    {
        if (db.Departments.Any(x => x.Uni_ID == uni_id))
        {
            List<Department> dpt = db.Departments.Where(x => x.Uni_ID == uni_id).ToList();
            foreach (var z in dpt)
            {
                
                Label lbl = new Label();
                lbl.Text = z.Department_Name;
                lbl.Font.Bold = true;
                lbl.ID = "lbl_"+z.id;
                PlaceHolder3.Controls.Add(lbl);
                
                List<Programm> pg = db.Programms.Where(x => x.Uni_ID == uni_id && x.Department_ID == z.id).ToList();
                
                foreach (var t in pg)
                {
                    
                    TextBox tb = new TextBox();  
                    tb.ID = z.id+"_"+t.id;
                    tb.Text = t.Program_Name;
                    tb.CssClass = "form-control";
                    PlaceHolder3.Controls.Add(tb);

                    if(db.Categories.Any(x=> x.Uni_ID == uni_id))
                    {
                        List<Category> cat = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
                        foreach(var m in cat)
                        {
                            CheckBox cbx = new CheckBox();
                            cbx.Text = m.Category_Name;
                            cbx.ID = t.id+"_"+m.id;
                            string[] split = cbx.ID.ToString().Split('_');
                            int prg_id = Convert.ToInt32(split[0]);
                            int cat_id = Convert.ToInt32(split[1]);
                            if (db.ProgrammCategories.Any(x=> x.Category_ID == cat_id && x.Programm_ID == prg_id))
                            {
                                cbx.Enabled = true;
                            }
                            PlaceHolder3.Controls.Add(cbx);
                        }
                        
                    }
                    

                }
                TextBox tbb = new TextBox();
                tbb.ID = "dpt_" + z.id;
                tbb.CssClass = "form-control";
                PlaceHolder3.Controls.Add(tbb);
                if (db.Categories.Any(x => x.Uni_ID == uni_id))
                {
                    List<Category> ctg = db.Categories.Where(x => x.Uni_ID == uni_id).ToList();
                    foreach(var n in ctg)
                    {
                        CheckBox cbx = new CheckBox();
                        cbx.Text = n.Category_Name;
                        cbx.ID = "checkbox"+"_"+ n.id +"_"+ z.id;
                        PlaceHolder3.Controls.Add(cbx);
                        
                    }


                }

                PlaceHolder3.Controls.Add(new LiteralControl("<br/>"));
            }
           
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populate_university();
            populate_admission_details();
        }

        populate_campus();
        populate_categories();
        populate_department();
        dynamic3();
        populate_prog_2();
    }



    protected void Button4_Click(object sender, EventArgs e)
    {

        foreach (Control ctrl in PlaceHolder3.Controls)
        {
            if (ctrl is PlaceHolder)
            {
                foreach (Control c in ctrl.Controls)
                {

                    if (c is Label)
                    {
                        Label lb = (Label)c;

                        string mystring = lb.ID;
                        string[] value = mystring.Split('_');

                        dpt_id = Convert.ToInt32(value[0]);
                    }

                    if (c is PlaceHolder)
                    {
                        foreach (Control d in c.Controls)
                        {

                            if (d is TextBox)
                            {
                                TextBox txtb = (TextBox)d;
                                string s_id = txtb.ID;

                                if (IsDigitsOnly(s_id))
                                {
                                    int programm_id = Convert.ToInt32(txtb.ID);
                                    Programm pgg = db.Programms.Single(x => x.id == programm_id);
                                    if (pgg != null)
                                    {
                                        if (pgg.Program_Name != txtb.Text)
                                        {
                                            if (txtb.Text == "")
                                            {
                                                if (db.Programms.Any(x => x.id == programm_id))
                                                {
                                                    List<Programm> pg = db.Programms.Where(x => x.id == programm_id).ToList();
                                                    db.Programms.RemoveRange(pg);
                                                }

                                                if (db.ProgrammCategories.Any(x => x.Programm_ID == programm_id))
                                                {
                                                    List<ProgrammCategory> pgcar = db.ProgrammCategories.Where(x => x.Programm_ID == programm_id).ToList();
                                                    db.ProgrammCategories.RemoveRange(pgcar);
                                                }

                                                db.Programms.Remove(pgg);
                                                db.SaveChanges();
                                            }
                                            else
                                            {
                                                pgg.Program_Name = txtb.Text;
                                                db.SaveChanges();

                                                foreach (Control f in c.Controls)
                                                {
                                                    if (f is CheckBox)
                                                    {
                                                        CheckBox cbx = (CheckBox)f;
                                                        Category ct = db.Categories.Where(x => x.Uni_ID == uni_id && x.Category_Name == cbx.Text).First();
                                                        int ct_id = ct.id;

                                                        if (IsDigitsOnly(cbx.ID))
                                                        {

                                                            if (cbx.Checked == false)
                                                            {
                                                                int IDD = Convert.ToInt32(cbx.ID);
                                                                ProgrammCategory pgcats = db.ProgrammCategories.Where(x => x.id == IDD).First();
                                                                db.ProgrammCategories.Remove(pgcats);
                                                                db.SaveChanges();
                                                            }

                                                        }
                                                        else
                                                        {
                                                            if (cbx.Checked == true)
                                                            {
                                                                ProgrammCategory prgcat = new ProgrammCategory
                                                                {
                                                                    Uni_ID = uni_id,
                                                                    Department_ID = dpt_id,
                                                                    Category_ID = ct_id,
                                                                    Programm_ID = programm_id
                                                                };
                                                                db.ProgrammCategories.Add(prgcat);
                                                                db.SaveChanges();
                                                            }
                                                        }



                                                    }



                                                }

                                            }
                                        }
                                        else
                                        {
                                            foreach(Control h in c.Controls)
                                            {
                                                if(h is CheckBox)
                                                {
                                                    CheckBox hh = (CheckBox)h;
                                                    Category ct = db.Categories.Where(x => x.Uni_ID == uni_id && x.Category_Name == hh.Text).First();
                                                    int ctt_id = ct.id;

                                                    if (IsDigitsOnly(hh.ID))
                                                    {

                                                        if (hh.Checked == false)
                                                        {
                                                            int ID = Convert.ToInt32(hh.ID);

                                                            ProgrammCategory pgcats = db.ProgrammCategories.Where(x => x.id == ID).First();
                                                            db.ProgrammCategories.Remove(pgcats);
                                                            db.SaveChanges();
                                                        }

                                                    }
                                                    else
                                                    {
                                                        if (hh.Checked == true)
                                                        {
                                                            ProgrammCategory prgcat = new ProgrammCategory
                                                            {
                                                                Uni_ID = uni_id,
                                                                Department_ID = dpt_id,
                                                                Category_ID = ctt_id,
                                                                Programm_ID = programm_id
                                                            };
                                                            db.ProgrammCategories.Add(prgcat);
                                                            db.SaveChanges();
                                                        }
                                                    }

                                                }



                                            }

                                        }
                                    }

                                }
                                else if (txtb.Text != "")
                                {
                                    Programm pgmm = new Programm
                                    {
                                        Program_Name = txtb.Text,
                                        Uni_ID = uni_id,
                                        Department_ID = dpt_id
                                    };
                                    db.Programms.Add(pgmm);
                                    db.SaveChanges();

                                    Programm pgm1 = db.Programms.Where(w => w.Uni_ID == uni_id && w.Department_ID == dpt_id && w.Program_Name == txtb.Text).First();
                                    int txtb_id = pgm1.id;


                                    foreach (Control g in c.Controls)
                                    {
                                        if (g is CheckBox)
                                        {
                                            CheckBox gg = (CheckBox)g;
                                            if (gg.Checked == true)
                                            {
                                                Category ctg = db.Categories.Where(r => r.Uni_ID == uni_id && r.Category_Name == gg.Text).First();
                                                int ctg_Id = ctg.id;

                                                ProgrammCategory prgmcategory = new ProgrammCategory
                                                {
                                                    Uni_ID = uni_id,
                                                    Department_ID = dpt_id,
                                                    Programm_ID = txtb_id,
                                                    Category_ID = ctg_Id

                                                };
                                                db.ProgrammCategories.Add(prgmcategory);
                                                db.SaveChanges();
                                            }

                                        }

                                    }


                                }



                            }
                        }
                    }
                }
            }
        }
        Response.Redirect(Request.RawUrl);
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        foreach (Control ctrl in PlaceHolder2.Controls)
        {
            if (ctrl is TextBox)
            {
                TextBox txtb = (TextBox)ctrl;
                string value = txtb.Text;
                string s_id = txtb.ID;

                if (IsDigitsOnly(s_id))
                {
                    int id = Convert.ToInt32(txtb.ID);
                    Department dpt = db.Departments.Single(x => x.id == id);
                    if (dpt != null)
                    {
                        if (dpt.Department_Name != value)
                        {
                            if (value == "")
                            {
                                if (db.Programms.Any(x => x.Department_ID == id))
                                {
                                    List<Programm> pg = db.Programms.Where(x => x.Department_ID == id).ToList();
                                    db.Programms.RemoveRange(pg);
                                }

                                if (db.ProgrammCategories.Any(x => x.Department_ID == id))
                                {
                                    List<ProgrammCategory> pgcat = db.ProgrammCategories.Where(x => x.Department_ID == id).ToList();
                                    db.ProgrammCategories.RemoveRange(pgcat);
                                }



                                db.Departments.Remove(dpt);
                                db.SaveChanges();

                            }
                            else
                            {
                                dpt.Department_Name = value;
                                db.SaveChanges();
                            }
                        }

                    }

                }
                else if (value != "" && !(db.Departments.Any(x => x.Department_Name == value && x.Uni_ID == uni_id)))
                {
                    Department department = new Department
                    {
                        Department_Name = value,
                        Uni_ID = uni_id
                    };
                    db.Departments.Add(department);
                    db.SaveChanges();

                }
            }
        }


        Response.Redirect(Request.RawUrl);
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

            if (univ_name != v)
            {
                univ.Name = v;
                db.SaveChanges();
            }
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
            University uv = db.Universities.Where(x => x.Name == univname).First();
            int uvid = uv.id;

            Portfolio portfolio = new Portfolio
            {
                Contact1 = TextBox2.Text,
                Contact2 = TextBox3.Text,
                Contact3 = TextBox4.Text,
                Contact4 = TextBox5.Text,
                Email = TextBox6.Text,
                Address = TextBox7.Text,
                Category = TextBox8.Text,
                Uni_ID = uvid

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
                        if (cmps.Campus_Name!= value)
                        {
                            if (value == "")
                            {
                                db.Campuses.Remove(cmps);
                                db.SaveChanges();

                            }
                            else
                            {
                                cmps.Campus_Name= value;
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

        Response.Redirect(Request.RawUrl);


    }

    protected void Criteria_Click(object sender, EventArgs e)
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

    protected void Document_Click(object sender, EventArgs e)
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

    protected void Fee_Click(object sender, EventArgs e)
    {
        if (db.AdmissionDetails.Any(x => x.Uni_ID == uni_id))
        {
            AdmissionDetail adm = db.AdmissionDetails.Where(x => x.Uni_ID == uni_id).First();
            string value = adm.FreeStructure;
            if (TextArea3.Value != value)
            {
                if (TextArea3.Value == "")
                {
                    adm.FreeStructure = "";
                    db.SaveChanges();
                }
                else
                {
                    adm.FreeStructure = TextArea3.Value;
                    db.SaveChanges();
                }


            }
        }
        else
        {
            AdmissionDetail adm = new AdmissionDetail
            {
                FreeStructure = TextArea3.Value,
                Uni_ID = uni_id
            };
            db.AdmissionDetails.Add(adm);
            db.SaveChanges();
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (Control ctrl in PlaceHolder1.Controls)
        {
            if (ctrl is TextBox)
            {
                TextBox txtb = (TextBox)ctrl;
                string value = txtb.Text;
                string s_id = txtb.ID;

                if (IsDigitsOnly(s_id))
                {
                    int id = Convert.ToInt32(txtb.ID);
                    Category cat = db.Categories.Single(x => x.id == id);
                    if (cat != null)
                    {
                        if (cat.Category_Name != value)
                        {
                            if (value == "")
                            {
                                if(db.ProgrammCategories.Any(x=> x.Category_ID == id))
                                {
                                    List<ProgrammCategory> pgcat = db.ProgrammCategories.Where(y => y.Category_ID == id).ToList();
                                    db.ProgrammCategories.RemoveRange(pgcat);
                                }
                                db.Categories.Remove(cat);
                                db.SaveChanges();

                            }
                            else
                            {
                                cat.Category_Name = value;
                                db.SaveChanges();
                            }
                        }

                    }

                }
                else if (value != "" && !(db.Categories.Any(x => x.Category_Name == value && x.Uni_ID == uni_id)))
                {
                    Category cat = new Category
                    {
                        Category_Name = value,
                        Uni_ID = uni_id
                    };
                    db.Categories.Add(cat);
                    db.SaveChanges();

                }
            }
        }


        Response.Redirect(Request.RawUrl);
    }
}