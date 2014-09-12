using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ForgetPass : System.Web.UI.Page
{
    //SqlConnection cn = null;
    //SqlCommand cmd = null;
    //SqlDataReader dr = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Technetium.mdf;Integrated Security=True;User Instance=True");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        //cn.Open();
        //cmd = new SqlCommand("Select * From Registration_Master where Email_Id=@email",cn);
        //cmd.Parameters.AddWithValue("email", txtemail.Text);

        //dr = cmd.ExecuteReader();
        //if (dr.HasRows == true)
        //{
        //    dr.Read();
        //    Label1.Text = "j"+dr["User_Id"].ToString();
        //    dr.Close();
        //}
        SqlCommand cmd = new SqlCommand("Select * From Registration_Master where Email_Id=@email");
        cmd.Parameters.AddWithValue("email", txtemail.Text);
        DataTable dt = new Connection().FetchTable(cmd);
        if (dt.Rows.Count == 0)
        {
            lblmsg.Text = "Email does not exists";
            return;
        }
        if (dt.Rows[0]["Email_Id"].ToString() == txtemail.Text)
        {
            lblmsg.Text = "hhh";
            Session["Fuid"] = dt.Rows[0]["User_Id"];
            Session["fname"] = (dt.Rows[0]["First_Name"].ToString() + dt.Rows[0]["Last_Name"].ToString());
            Response.Redirect("ForgotSecure.aspx");
        }





    }
}