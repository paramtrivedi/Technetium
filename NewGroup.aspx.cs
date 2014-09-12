using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

public partial class NewGroup : System.Web.UI.Page
{
    SqlConnection cn = null;
    SqlCommand cmd = null;
    SqlDataReader dr = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Technetium.mdf;Integrated Security=True;User Instance=True");
        //Response.Write(Server.MapPath("Images/Group/abc.jpg"));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == false)
            return;
        cn.Open();
        cmd = new SqlCommand("Select * from Group_Master where group_Name=@group_Name", cn);
        cmd.Parameters.AddWithValue("group_name", txtGrpName.Text);
        dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            dr.Read();
            lblMsg.Text = "Group Name Already Exist. [Group Id : "+dr[0].ToString()+"]";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            txtGrpName.Focus();
            dr.Close();
            cn.Close();
        }
        else
        {
            string fpath = "~/Images/Group/Sunset.jpg";
            if (fluFile.HasFile == true)
            {
                fpath = "~/Images/Group/" + fluFile.FileName;
                fluFile.PostedFile.SaveAs(Server.MapPath(fpath));  
            }
            dr.Close();
            System.Threading.Thread.Sleep(2000);   
            //cmd = new SqlCommand("Insert Into Group_Master (group_Name,group_descr,group_image,create_date_time) values ('" + txtGrpName.Text + "','" + txtDescr.Text + "','','" + DateTime.Now.ToString() + "')", cn);
            cmd = new SqlCommand("Insert Into Group_Master (group_Name,group_descr,group_image,create_date_time) values (@group_Name,@group_descr,@group_image,@create_date_time)", cn);
            cmd.Parameters.AddWithValue("group_name", txtGrpName.Text);
            cmd.Parameters.AddWithValue("group_descr", txtDescr.Text);
            cmd.Parameters.AddWithValue("group_Image", fpath);
            cmd.Parameters.AddWithValue("create_date_time", DateTime.Now);
            cmd.ExecuteNonQuery();
            cn.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "key", "alert('Successfully Add');", true);   
            Response.Redirect("GroupView.aspx");
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string ext = Path.GetExtension(fluFile.FileName);
        if (ext == ".jpg" || ext == ".gif" || ext == ".jpeg" || ext == ".bmp" || ext == ".png" ) // || ext==".zip")
        {
            args.IsValid = true;
            if (fluFile.PostedFile.ContentLength >= 5242880)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "File Size Must Be Less Than 5 MB";
            }
        }
        else
        {
            args.IsValid = false;
            CustomValidator1.ErrorMessage = "File Extension Not Supported";
        }
        
    }
}
