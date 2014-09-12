using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Userview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        Label1.Text = "Record(s) Found : " + GridView1.Rows.Count;

    }
}