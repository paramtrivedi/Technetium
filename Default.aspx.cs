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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select * From Registration_Master where Email_Id=@Email");
        cmd.Parameters.AddWithValue("Email", txtUName.Text);
        //cmd.Parameters.AddWithValue("Pwd", txtPwd.Text);
        DataTable dt = new Connection().FetchTable(cmd);
        if (dt.Rows.Count == 0)
        {
            lblMsg.Text = "Invalid UserName Or Password";
            return;
        }
        if (dt.Rows[0]["password"].ToString() == txtPwd.Text)
        {
            Session["unm"] = dt.Rows[0]["First_Name"].ToString();
            Session["uid"] = dt.Rows[0]["User_Id"].ToString();
            Session["gid"] = dt.Rows[0]["Group_Id"].ToString();
            Session["subgid"] = "0";
            Session["Email"] = dt.Rows[0]["Email_Id"].ToString();
            Session["grpnm"] = (new Connection().FetchTable("Select * From Group_Master Where Group_id='"+Session["gid"].ToString()+"' ").Rows[0]["Group_Name"].ToString()); 
            Response.Redirect("Home.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid UserName Or Password";
            return;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgetPass.aspx");
    }
}
