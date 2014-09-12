using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using SmsClient;

public partial class Verify : System.Web.UI.Page
{
    static int wrong = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
        }
    }
    protected void Btnsub_Click(object sender, EventArgs e)
    {
        if (Txtactivation.Text == "")
        {
            Lblstatus.Text = "Enter Activatio Key To Access Your Account";
            Txtactivation.Focus();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Select * from Verification where Email=@email");
            cmd.Parameters.AddWithValue("email", Session["Email"].ToString());
            DataTable dt = new Connection().FetchTable(cmd);
            if (Txtactivation.Text == dt.Rows[0]["VarCode"].ToString())
            {
                cmd = new SqlCommand("Delete from verification where Email=@email");
                cmd.Parameters.AddWithValue("email", Session["Email"].ToString());
                new Connection().Execute(cmd);
                Response.Redirect("Home.aspx");
                Lblstatus.Text = "No. of Tries: " + " " + wrong.ToString();

            }
            else
            {
                ViewState["wrong"] = wrong.ToString();
                if (int.Parse(ViewState["wrong"].ToString()) == 3)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    
                    wrong = wrong + 1;
                    int st = 3;
                        st = st - wrong;
                        Lblstatus.Text = "No. of Tries: " + " " + st.ToString();
                    ViewState["wrong"] = wrong.ToString();
                }

            }
        }
    }
}