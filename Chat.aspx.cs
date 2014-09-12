using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["uid"] == null && Request["unm"] == null)
            {
                Response.Redirect("Home.aspx");
                return;
            }
            lbluid.Text = Request["uid"].ToString();
            lblUser.Text = Request["unm"].ToString();
        }
        else
        {
            if (txtMessage.Text != "")
            {
                string edate = DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
                new Connection().Execute("Insert Into Chat_Message values (" + int.Parse(Session["uid"].ToString()) + "," + int.Parse(lbluid.Text) + ",'" + txtMessage.Text + "','" + edate + "')");
                SqlDataSource1.DataBind();
                DataList1.DataBind();
                txtMessage.Text = "";
            }

        }
    }
}