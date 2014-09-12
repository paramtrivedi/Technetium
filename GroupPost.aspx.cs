using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GroupPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(txtPost.ClientID);  
        //Session["unm"] = "Guest";
        //Session["uid"] = "2";
        //Session["gid"] = "9";
        //Session["subgid"] = "0";
        //Session["grpnm"] = (new Connection().FetchTable("Select * From Group_Master Where Group_id='" + Session["gid"].ToString() + "' ").Rows[0]["Group_Name"].ToString()); 

        if (Session["grpnm"] == null)
        {
            Response.Redirect("AdminHome.aspx");
            return;
        }
        lblGroup.Text = Session["grpnm"].ToString();
    }
    protected void btnPost_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Insert Into Post_Master (User_Id,Group_Id,Sub_Group_Id,Post_Title,Post_Description,Post_File,Post_Date_Time,Post_Status) values (@User_Id,@Group_Id,@Sub_Group_Id,@Post_Title,@Post_Description,@Post_File,@Post_Date_Time,@Post_Status)");
        cmd.Parameters.AddWithValue("User_Id", 0);
        cmd.Parameters.AddWithValue("Group_id", Session["gid"].ToString());
        cmd.Parameters.AddWithValue("Sub_Group_Id", Session["subgid"].ToString());
        cmd.Parameters.AddWithValue("Post_Title", "");
        string tpost = txtPost.Text;
        string chr13 = ((char)13).ToString();
        tpost = tpost.Replace(chr13, "<BR>");
        cmd.Parameters.AddWithValue("Post_Description", tpost);
        cmd.Parameters.AddWithValue("Post_File", "");
        cmd.Parameters.AddWithValue("Post_Date_Time", DateTime.Now);
        cmd.Parameters.AddWithValue("Post_Status", "Y");
        new Connection().Execute(cmd);
        SqlDataSource1.DataBind();
        GridView1.DataBind();
        txtPost.Text = "";
        //Response.Redirect("TechHub.aspx");

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label pid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblPid");
        TextBox cmt = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtComment");
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Insert Into Reply_Transaction (Post_Id,User_Id,Reply_Descr,Reply_Date_Time,Reply_Status) values (@Post_Id,@User_Id,@Reply_Descr,@Reply_Date_Time,@Reply_Status)");
        cmd.Parameters.AddWithValue("Post_Id", pid.Text);
        cmd.Parameters.AddWithValue("User_id", 0);
        cmd.Parameters.AddWithValue("Reply_Descr", cmt.Text);
        cmd.Parameters.AddWithValue("Reply_Date_Time", DateTime.Now);
        cmd.Parameters.AddWithValue("Reply_Status", "Y");
        new Connection().Execute(cmd);
        SqlDataSource1.DataBind();
        GridView1.DataBind();

        //Response.Redirect("TechHub.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Response.Write(e.CommandName + " " + e.CommandArgument.ToString());
        if (e.CommandName == "Remove")
        {

            new Connection().Execute("Update Post_Master Set Post_Status='N' Where Post_Id='" + e.CommandArgument.ToString() + "' ");
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
    }
}
