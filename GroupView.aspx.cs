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

public partial class GroupView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        Label1.Text = "Record(s) Found : " + GridView1.Rows.Count;
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Response.Write(e.CommandName + "  " + e.CommandArgument.ToString()); 
        if (e.CommandName == "Modify")
        {
            Session["grpid"] = e.CommandArgument.ToString();
            Response.Redirect("GroupUpdate.aspx");
        }
    }
}
