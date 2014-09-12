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

public partial class MyGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }

    }
    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (ddlSubgroup.Items.Count > 1)
                ddlSubgroup.SelectedIndex = 1;
            SqlDataSource2.DataBind();
            GridView1.DataBind();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (ddlSubgroup.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "a", "alert('Select Sub Group Name');", true);
            return;
        }
        if (e.CommandName == "Invite")
        {
            new Connection().Execute("Insert Into Join_Sub_Group (Sub_Group_Id,Sender_User_Id,Invite_User_Id) values (" + int.Parse(ddlSubgroup.SelectedValue) + "," + int.Parse(Session["uid"].ToString()) + "," + int.Parse(e.CommandArgument.ToString()) + ")");
            ScriptManager.RegisterStartupScript(this, GetType(), "a", "alert('Successfully Invite!!!!!')", true);
            SqlDataSource2.DataBind();
            GridView1.DataBind();
        }
        if (e.CommandName == "Remove")
        {
            new Connection().Execute("Delete Join_Sub_Group Where Sub_Group_Id='"+ddlSubgroup.SelectedValue+"' And Invite_User_Id='"+e.CommandArgument.ToString()+"' ");
            ScriptManager.RegisterStartupScript(this, GetType(), "a", "alert('Successfully Remove!!!!!')", true);
            SqlDataSource2.DataBind();
            GridView1.DataBind();
        }

    }
   
}
