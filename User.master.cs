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
using System.Data.SqlClient;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblonline.Text = GridView1.Rows.Count.ToString()+" "+"Users";
        //Session["unm"] = "Guest";
        //Session["uid"] = "2";
        //Session["gid"] = "9";
        //Session["subgid"] = "0";
        //Session["grpnm"] = (new Connection().FetchTable("Select * From Group_Master Where Group_id='" + Session["gid"].ToString() + "' ").Rows[0]["Group_Name"].ToString()); 
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx");
            return;
        }
        lblUName.Text = Session["unm"].ToString();
        SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
        cmd.Parameters.AddWithValue("User_Id", Session["uid"]);
        DataTable dt = new Connection().FetchTable(cmd);
        ImgProfil.ImageUrl=dt.Rows[0]["User_Photo"].ToString();
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("update Chat set Active_Session=@Active_Session where User_Id=" + Session["uid"].ToString());
        cmd.Parameters.AddWithValue("Active_Session", "N");
        new Connection().Execute(cmd);
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
       // Response.Write(e.CommandName + "  " + e.CommandArgument.ToString());    
        string grp = e.CommandArgument.ToString();
        string []a = new string[2];
        a = grp.Split('-');
        Session["gid"] = a[0];
        Session["subgid"] = a[1];
        if(a[1]=="0")
            Session["grpnm"] = (new Connection().FetchTable("Select * From Group_Master Where Group_id='" + Session["gid"].ToString() + "' ").Rows[0]["Group_Name"].ToString());  
        else
            Session["grpnm"] = (new Connection().FetchTable("Select * From Sub_Group_Master Where Sub_Group_id='" + Session["subgid"].ToString() + "' ").Rows[0]["Sub_Group_Name"].ToString());  
        Response.Redirect("TechHub.aspx");

    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Accept")
            new Connection().Execute("Update Join_Sub_Group Set Status='Y' Where Join_Id='" + e.CommandArgument.ToString() + "' ");
        if (e.CommandName == "Reject")
            new Connection().Execute("Delete From Join_Sub_Group Where Join_Id='" + e.CommandArgument.ToString() + "' ");
        SqlDataSource2.DataBind();
        DataList2.DataBind();
        SqlDataSource1.DataBind();
        DataList1.DataBind();

    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        GridView1.DataBind();
    }
}