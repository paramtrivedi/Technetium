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

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUName.Focus();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select * From AdminLogin where UserName=@UName And Password=@pwd");
        cmd.Parameters.AddWithValue("UName", txtUName.Text);
        cmd.Parameters.AddWithValue("Pwd", txtPwd.Text);
        DataTable dt = new Connection().FetchTable(cmd);
        if (dt.Rows.Count == 0)
        {
            lblMsg.Text = "Invalid UserName Or Password";
            return;
        }
        Session["admin"] = txtUName.Text;
        Response.Redirect("AdminHome.aspx");
    }
}
