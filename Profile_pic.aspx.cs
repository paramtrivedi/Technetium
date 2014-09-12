using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Profile_pic : System.Web.UI.Page
{
    SqlConnection cn = null;
    SqlCommand cmd = null;
    SqlDataReader dr = null;
    


    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Technetium.mdf;Integrated Security=True;User Instance=True");
        if (!IsPostBack)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            try
            {
                int uid = int.Parse(Session["uid"].ToString());
                cn.Open();
                cmd = new SqlCommand("select * from Registration_Master where User_Id=" + uid, cn);
                dr = cmd.ExecuteReader();
                dr.Read();
                imgprofile_pic.ImageUrl = dr["User_Photo"].ToString();
                btnchoose.Enabled = false;
                dr.Close();
                cn.Close();
            }
            catch
            {
            }
        }


    }

    protected void Btnpreview_Click(object sender, EventArgs e)
    {
        imgprofile_pic.Visible = true;
        int uid = int.Parse(Session["uid"].ToString());
        if (fluplod.HasFile == true)
        {
            cn.Open();
            cmd = new SqlCommand("Select Email_id from Registration_Master Where User_Id=" + uid,cn);
            dr = cmd.ExecuteReader();
            dr.Read();
            string email = dr["Email_Id"].ToString();
            dr.Close();
            if(!Directory.Exists(Server.MapPath("~/User/"+email+"/Images")))
            {
            Directory.CreateDirectory(Server.MapPath("~/Users/"+email+"/Profilepic"));
            }
            string fpath = "~/Users/"+email+"/Profilepic/" + fluplod.FileName;
            fluplod.PostedFile.SaveAs(Server.MapPath(fpath));
            cmd = new SqlCommand("Update Registration_Master set User_Photo=@user_photo where User_Id=" + uid, cn);
            cmd.Parameters.AddWithValue("user_photo", fpath);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        //int uid = int.Parse(Session["uid"].ToString());
        cn.Open();
        cmd = new SqlCommand("select * from Registration_Master where User_Id=" + uid, cn);
        dr = cmd.ExecuteReader();
        dr.Read();
        imgprofile_pic.ImageUrl = dr["User_Photo"].ToString();
        fluplod.Enabled = false;
        btnchoose.Enabled = true;
        cn.Close();


    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string ext = Path.GetExtension(fluplod.FileName);
        if (ext == ".jpg" || ext == ".gif" || ext == ".jpeg" || ext == ".bmp" || ext == ".png" || ext == ".JPG" || ext == ".GIF" || ext == ".JPEG" || ext == ".BMP" || ext == ".PNG") // || ext==".zip")
        {
            args.IsValid = true;
            if (fluplod.PostedFile.ContentLength >= 5242880)
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
    protected void btnchoose_Click(object sender, EventArgs e)
    {
        string img = imgprofile_pic.ImageUrl.ToString();
        File.Delete(Server.MapPath(img));
        imgprofile_pic.Visible = false;
        fluplod.Enabled = true;
        btnchoose.Enabled = false;

    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        int uid = int.Parse(Session["uid"].ToString());
        cn.Open();
        string fpath = imgprofile_pic.ImageUrl;
        if (fluplod.HasFile == true)
        {
            cmd = new SqlCommand("Select Email_id from Registration_Master Where User_Id=" + uid, cn);
            dr = cmd.ExecuteReader();
            dr.Read();
            string email = dr["Email_Id"].ToString();
            dr.Close();
            if (!Directory.Exists(Server.MapPath("~/User/" + email + "/Images")))
            {
                Directory.CreateDirectory(Server.MapPath("~/Users/" + email + "/Profilepic"));
            }
            fpath = "~/Users/" + email + "/Profilepic/" + fluplod.FileName;
            fluplod.PostedFile.SaveAs(Server.MapPath(fpath));
        }
        cmd = new SqlCommand("Update Registration_Master set User_Photo=@user_photo where User_Id=" + uid, cn);
        cmd.Parameters.AddWithValue("user_photo", fpath);
        cmd.ExecuteNonQuery();
        cn.Close();
        Response.Redirect("Home.aspx");


    }
}