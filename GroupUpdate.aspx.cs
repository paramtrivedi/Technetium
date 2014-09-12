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

public partial class GroupUpdate : System.Web.UI.Page
{
    SqlConnection cn = null;
    SqlCommand cmd = null;
    SqlDataReader dr = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Technetium.mdf;Integrated Security=True;User Instance=True");
        //Response.Write(Server.MapPath("Images/Group/abc.jpg"));
        if (!IsPostBack)
        {
            try
            {


                if (Session["grpid"] == null)
                {
                    Response.Redirect("GroupView.aspx");
                    return;
                }
                int grpid = int.Parse(Session["grpid"].ToString());
                cn.Open();
                cmd = new SqlCommand("Select * From Group_Master WHere Group_Id=" + grpid, cn);
                dr = cmd.ExecuteReader();
                dr.Read();
                txtGrpName.Text = dr["Group_Name"].ToString();
                txtDescr.Text = dr["Group_Descr"].ToString();
                imgFile.ImageUrl = dr["Group_Image"].ToString();
                rblStatus.SelectedValue = dr["Group_Status"].ToString(); 
                dr.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error : " + ex.Message);
                Response.End();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == false)
            return;
        cn.Open();
        int grpid = int.Parse(Session["grpid"].ToString());
        cmd = new SqlCommand("Select * from Group_Master where group_Name=@group_Name And Group_Id<>"+grpid, cn);
        cmd.Parameters.AddWithValue("group_name", txtGrpName.Text);
        dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            dr.Read();
            lblMsg.Text = "Group Name Already Exist. [Group Id : " + dr[0].ToString() + "]";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            txtGrpName.Focus();
            dr.Close();
            cn.Close();
        }
        else
        {
            string fpath = imgFile.ImageUrl; 
            if (fluFile.HasFile == true)
            {
                fpath = "~/Images/Group/" + fluFile.FileName;
                fluFile.PostedFile.SaveAs(Server.MapPath(fpath));
            }
            dr.Close();
            //cmd = new SqlCommand("Insert Into Group_Master (group_Name,group_descr,group_image,create_date_time) values ('" + txtGrpName.Text + "','" + txtDescr.Text + "','','" + DateTime.Now.ToString() + "')", cn);
            cmd = new SqlCommand("Update Group_Master Set group_Name=@group_Name,group_descr=@group_descr,group_image=@group_image,group_status=@group_status where group_id="+grpid, cn);
            cmd.Parameters.AddWithValue("group_name", txtGrpName.Text);
            cmd.Parameters.AddWithValue("group_descr", txtDescr.Text);
            cmd.Parameters.AddWithValue("group_Image", fpath);
            cmd.Parameters.AddWithValue("group_status",rblStatus.SelectedValue);
            cmd.ExecuteNonQuery();
            cn.Close();
            Response.Redirect("GroupView.aspx");
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string ext = Path.GetExtension(fluFile.FileName);
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
