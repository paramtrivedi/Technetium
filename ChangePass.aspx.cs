using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ChangePass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Txtnpass.Enabled = false;
        Txtconpass.Enabled = false;

    }
    protected void btn_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select * From Registration_Master where User_Id=@uid");
        cmd.Parameters.AddWithValue("uid", Session["uid"]);
        //cmd.Parameters.AddWithValue("Pwd", txtPwd.Text);
        DataTable dt = new Connection().FetchTable(cmd);

        if (dt.Rows.Count != 0)
        {
            if (txtoldpass.Text != dt.Rows[0]["Password"].ToString())
            {
                lblmsg.Text = "Invalid password";
            }
            else
            {
                cmd = new SqlCommand("Update Registration_Master set Password=@password where User_Id=@uid");
                cmd.Parameters.AddWithValue("password", Txtnpass.Text);
                cmd.Parameters.AddWithValue("uid", Session["uid"]);
                new Connection().Execute(cmd);
                Response.Redirect("Home.aspx");
            }
        }

    }
    protected void txtoldpass_TextChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select * From Registration_Master where User_Id=@uid");
        cmd.Parameters.AddWithValue("uid", Session["uid"]);
        //cmd.Parameters.AddWithValue("Pwd", txtPwd.Text);
        DataTable dt = new Connection().FetchTable(cmd);

        if (dt.Rows.Count != 0)
        {
            if (txtoldpass.Text != dt.Rows[0]["Password"].ToString())
            {
                lblmsg.Text = "Invalid password";
                Txtconpass.Enabled = false;
                Txtnpass.Enabled = false;
            }
            else
            {
                lblmsg.Text = "";
                Txtconpass.Enabled = true;
                Txtnpass.Enabled = true;
            }
        }
    }
}