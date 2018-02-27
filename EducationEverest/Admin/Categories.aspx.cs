using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["categories"] == null)
        {
            ViewState["categories"] = 10;
        }
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && (HttpContext.Current.User.IsInRole("Super Admin"))))
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        }
        else if (!Page.IsPostBack)
        {
            
        }
        populateCategories();
    }

    protected void populateCategories()
    {
        EducationEverestEntities db = new EducationEverestEntities();
        ph_Categories.Controls.Clear();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        if(CampusId != 0)
        {
            List<Category> categories = db.Categories.Where(a => a.CampusID == CampusId).ToList();
            int categories_textboxes = categories.Count();
            if(categories_textboxes < Convert.ToInt32(ViewState["categories"]))
            {
                categories_textboxes = Convert.ToInt32(ViewState["categories"]);
            }
            for (int i = 0; i < categories_textboxes; i++)
            {
                HtmlGenericControl NewControl = new HtmlGenericControl("div");
                NewControl.Attributes.Add("class", "col-md-12");

                TextBox MyTextBox = new TextBox();
                //nd = new category

                MyTextBox.ID = "nc" + i.ToString();
                if (i < categories.Count)
                {
                    MyTextBox.Text = categories[i].Category_Name;
                    //ec = existing category
                    MyTextBox.ID = "ec" + categories[i].id.ToString();
                }
                else
                {
                    MyTextBox.Text = string.Empty;
                }

                MyTextBox.Attributes.Add("placeholder", "Enter Category Name " + (i + 1));
                MyTextBox.Attributes.Add("style", "margin-bottom:5px");
                MyTextBox.Attributes.Add("class", "form-control");
                MyTextBox.Attributes.Add("runat", "server");


                NewControl.Controls.Add(MyTextBox);
                ph_Categories.Controls.Add(NewControl);
            }
        }
    }

    protected void saveCategories()
    {
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        if (CampusId != 0)
        {
            EducationEverestEntities db = new EducationEverestEntities();
            foreach (Control ctrl in ph_Categories.Controls)
            {
                if (ctrl.Controls[0] is TextBox)
                {
                    TextBox txtb = (TextBox)ctrl.Controls[0];
                    if (txtb.Text != "")
                    {
                        string textboxID = txtb.ID;
                        int categoryId = Convert.ToInt32(Regex.Match(textboxID, @"\d+").Value);

                        if (textboxID.Contains("ec") && db.Categories.Any(a => a.id == categoryId && a.CampusID == CampusId))
                        {
                            //update that categpry
                            Category existingCategory = db.Categories.Where(a => a.id == categoryId && a.CampusID == CampusId).First();
                            existingCategory.Category_Name = txtb.Text;

                            db.SaveChanges();
                        }
                        else
                        {
                            //create new category
                            Category newCategory = new Category();
                            newCategory.Category_Name = txtb.Text;
                            newCategory.CampusID = CampusId;
                            db.Categories.Add(newCategory);
                            db.SaveChanges();
                        }

                    }

                }
            }
        }
        
    }

    protected void btn_SaveCategories_Click(object sender, EventArgs e)
    {
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        saveCategories();
        Response.Redirect("CampusPage.aspx?cid="+CampusId);
    }

    protected void lb_Universities_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main_Uni.aspx");
    }

    protected void lb_campuses_Click(object sender, EventArgs e)
    {
        EducationEverestEntities db = new EducationEverestEntities();
        int CampusId = 0;
        if (Request.QueryString["cid"] != null)
        {
            CampusId = Convert.ToInt32(Request.QueryString["cid"]);
        }
        int universityId = db.Campuses.Where(a => a.id == CampusId).First().Uni_ID;
        Response.Redirect("campuses.aspx?uid=" + universityId);
    }
}