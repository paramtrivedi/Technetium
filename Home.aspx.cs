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
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            
            if (Session["Email"] != null)
            {
                SqlCommand cmd = new SqlCommand("Select * from Verification where Email=@email");
                cmd.Parameters.AddWithValue("email", Session["Email"].ToString());
                DataTable dt = new Connection().FetchTable(cmd);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("Verify.aspx");
                    return;
                }

            }
            else
            {
                Response.Redirect("default.aspx");
                return;
            }
            if (Session["uid"] != null)
            {
                SqlCommand cmd = new SqlCommand("Select * from Chat where User_id=@uid");
                cmd.Parameters.AddWithValue("uid",Session["uid"].ToString());
                DataTable dt = new Connection().FetchTable(cmd);
                if (dt.Rows.Count == 0)
                {
                     cmd = new SqlCommand("Select * from Registration_Master where User_id=@uid");
                    cmd.Parameters.AddWithValue("uid", Session["uid"].ToString());
                    dt = new Connection().FetchTable(cmd);
                    cmd = new SqlCommand("insert into Chat (User_Id,group_id,Active_Session,User_Name,User_Img,Group_name) values(@User_Id,@group_id,@Active_Session,@User_Name,@User_Img,@Group_name)");
                    cmd.Parameters.AddWithValue("User_Id",Session["uid"].ToString());
                    cmd.Parameters.AddWithValue("group_id", Session["gid"].ToString());
                    cmd.Parameters.AddWithValue("Active_Session","Y");
                    cmd.Parameters.AddWithValue("Group_name", Session["grpnm"].ToString());
                    cmd.Parameters.AddWithValue("User_Name", dt.Rows[0]["First_Name"].ToString()+" " + dt.Rows[0]["Last_Name"].ToString());
                    cmd.Parameters.AddWithValue("User_img",dt.Rows[0]["User_Photo"].ToString());

                    new Connection().Execute(cmd);

                }
                else if (dt.Rows.Count > 0)
                {
                    cmd = new SqlCommand("update Chat set Active_Session=@Active_Session where User_Id="+Session["uid"].ToString());
                    cmd.Parameters.AddWithValue("Active_Session", "Y");
                    new Connection().Execute(cmd);
                    
                }
                //cmd = new SqlCommand("Select * from Chat where Active_Session=@as AND group_id=" + Session["gid"].ToString() + "And User_Id<>" + Session["uid"].ToString());
                //    cmd.Parameters.AddWithValue("as","Y");
                //dt = new Connection().FetchTable(cmd);
                //GridView1.DataSource = dt;
                //GridView1.DataBind();


                

            }
        }
    }
    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    //cmd = new SqlCommand("Select * from Chat where Active_Session=@as AND group_id=" + Session["gid"].ToString() + "And User_Id<>" + Session["uid"].ToString());
    //    //cmd.Parameters.AddWithValue("as", "Y");
    //    //dt = new Connection().FetchTable(cmd);
    //    //GridView1.DataSource = dt;
    //    SqlDataSource1.DataBind();
    //    GridView1.DataBind();
    //}
   
}
