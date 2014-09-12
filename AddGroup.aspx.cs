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

public partial class AddGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx");
            return;
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == false)
            return;

        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select * from Sub_Group_Master where Group_Id="+int.Parse(Session["gid"].ToString())+" And  sub_group_Name=@group_Name");
        cmd.Parameters.AddWithValue("group_name", txtGrpName.Text);
        DataTable dt = new Connection().FetchTable(cmd);
        if (dt.Rows.Count>0)
        {
            lblMsg.Text = "Sub Group Name Already Exist.";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            txtGrpName.Focus();
        }
        else
        {
            string fpath = "~/Images/SubGroup/Sunset.jpg";
            if (fluFile.HasFile == true)
            {
                fpath = "~/Images/SubGroup/" + fluFile.FileName;
                fluFile.PostedFile.SaveAs(Server.MapPath(fpath));
            }
            System.Threading.Thread.Sleep(1000);
            cmd = new System.Data.SqlClient.SqlCommand("Insert Into Sub_Group_Master (Group_Id,User_Id,Sub_group_Name,Sub_group_desc,Sub_group_image,creation_date_time) values (@Group_Id,@User_Id,@Sub_group_Name,@Sub_group_desc,@Sub_group_image,@creation_date_time)");
            cmd.Parameters.AddWithValue("Group_Id", Session["gid"].ToString());
            cmd.Parameters.AddWithValue("User_Id", Session["uid"].ToString());
            cmd.Parameters.AddWithValue("Sub_group_name", txtGrpName.Text);
            cmd.Parameters.AddWithValue("Sub_group_desc", txtDescr.Text);
            cmd.Parameters.AddWithValue("Sub_group_Image", fpath);
            cmd.Parameters.AddWithValue("creation_date_time", DateTime.Now);
            new Connection().Execute(cmd);
            ScriptManager.RegisterStartupScript(this, GetType(), "key", "alert('Successfully Add');", true);
            Response.Redirect("TechHub.aspx");
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string ext = System.IO.Path.GetExtension(fluFile.FileName);
        if (ext == ".jpg" || ext == ".gif" || ext == ".jpeg" || ext == ".bmp" || ext == ".png") // || ext==".zip")
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

