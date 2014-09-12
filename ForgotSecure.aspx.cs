using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ForgotSecure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Fuid"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
            cmd.Parameters.AddWithValue("User_Id",Session["Fuid"]);
            DataTable dt = new Connection().FetchTable(cmd);
            lblUsername.Text = Session["fname"].ToString();
            imgprofle.ImageUrl=dt.Rows[0]["User_Photo"].ToString();
        }

    }
    protected void btngoback_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgetPass.aspx");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Securityverify.aspx");
    }
}