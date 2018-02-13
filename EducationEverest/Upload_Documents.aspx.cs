using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;


public partial class Upload_Documents : System.Web.UI.Page
{
    EducationEverestEntities db = new EducationEverestEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void useCNICUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string Extension = Path.GetExtension(FileUpload1.FileName);
            if (Extension.ToLower() != ".gif" && Extension.ToLower() != ".png" && Extension.ToLower() != ".jpg" && Extension.ToLower() != ".jpeg")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('invalid image format');", true);

            }
            int filesize = FileUpload1.PostedFile.ContentLength;
            if (filesize > 1048576) //file size equal to 1MB
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Maximum File Size is 1MB');", true);
            }
            else
            {
                string Pathname = "Document_Images/" + Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                SqlConnection con = new SqlConnection("Data Source=AZEEM\\SQLEXPRESS; Initial Catalog=EducationEverest;User ID=sa;Password=123");
                String query = "insert into Media2 ( Image_Name,Image_Path)values ('" + filename + "','" + Pathname + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FileUpload1.SaveAs(Server.MapPath("~/Document_Images/" + FileUpload1.FileName));
                //GvBind();
                lblSuccessfull.Visible = true;
                //if (IsPostBack)
                //{

                    



                //}

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Please select an image to upload');", true);


        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //button next click from Educational Details to Test Result
        Response.Redirect("Payments.aspx");
    }
}