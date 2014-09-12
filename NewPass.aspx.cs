using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.Mail;

public partial class NewPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["fuid"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        int uid = int.Parse(Session["fuid"].ToString());
        SqlCommand cmd = new SqlCommand("Update Registration_Master set Password=@password where User_Id=@uid");
        cmd.Parameters.AddWithValue("password",Txtnpass.Text);
        cmd.Parameters.AddWithValue("uid",uid);
        new Connection().Execute(cmd);
        
       
        
        Response.Redirect("Default.aspx");

    }
}