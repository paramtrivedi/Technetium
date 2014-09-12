using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["admin"] = "Admin";
        if (Session["admin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
            return;
        }
        lblUName.Text = Session["admin"].ToString();
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("AdminLogin.aspx");
        
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        // Response.Write(e.CommandName + "  " + e.CommandArgument.ToString());    
        string grp = e.CommandArgument.ToString();
        string[] a = new string[2];
        a = grp.Split('-');
        Session["gid"] = a[0];
        Session["subgid"] = a[1];
        if (a[1] == "0")
            Session["grpnm"] = (new Connection().FetchTable("Select * From Group_Master Where Group_id='" + Session["gid"].ToString() + "' ").Rows[0]["Group_Name"].ToString());
        else
            Session["grpnm"] = (new Connection().FetchTable("Select * From Sub_Group_Master Where Sub_Group_id='" + Session["subgid"].ToString() + "' ").Rows[0]["Sub_Group_Name"].ToString());
        Response.Redirect("GroupPost.aspx");
    }
}
