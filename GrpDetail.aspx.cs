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

public partial class GrpDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["id"] == null)
            {
                Response.Redirect("GroupView.aspx");
                return;
            }
            System.Threading.Thread.Sleep(1000);   
            DataTable dt = new Connection().FetchTable("Select group_descr from group_master Where Group_Id="+int.Parse(Request["id"].ToString()));
            lblDescr.Text = dt.Rows[0][0].ToString();

        }
    }
}
