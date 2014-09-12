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

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            DataTable dt = new Connection().FetchTable("Select * From Registration_Master where User_Id='" + Session["uid"].ToString() + "' ");
            DataRow dr = dt.Rows[0];
            txtFName.Text = dr["First_Name"].ToString();
            txtLName.Text = dr["Last_Name"].ToString();
            rblGender.SelectedValue = dr["Gender"].ToString();
            lblemail.Text = dr["Email_id"].ToString();
            drpque.SelectedValue = dr["Security_Que"].ToString();
            txtans.Text = dr["Security_Ans"].ToString();

            if (dr["Date_Of_Birth"].ToString() != "")
            { 
            //    Txtdob_CalendarExtender.SelectedDate = Convert.ToDateTime(dr["Date_Of_Birth"].ToString()); 
            }
            
            Txtmobi.Text = dr["Mobile_No"].ToString();
            Txtabtme.Text = dr["About_Me"].ToString();
            }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int uid = int.Parse(Session["uid"].ToString());
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Update Registration_Master set Date_Of_Birth=@dob,Mobile_No=@Mobile_No,First_Name=@First_Name, Last_Name=@Last_Name, Gender=@Gender,Security_Que=@Security_Que,Security_Ans=@Security_Ans,About_Me=@me where User_Id="+uid);
        cmd.Parameters.AddWithValue("dob",Txtdob.Text);
        cmd.Parameters.AddWithValue("Mobile_No",Txtmobi.Text);
        cmd.Parameters.AddWithValue("First_Name", txtFName.Text);
        cmd.Parameters.AddWithValue("Last_Name", txtLName.Text);
        cmd.Parameters.AddWithValue("Gender", rblGender.SelectedValue);
        //cmd.Parameters.AddWithValue("Occupation",Drpoccup.SelectedValue);
        cmd.Parameters.AddWithValue("Security_Que",drpque.SelectedValue);
        cmd.Parameters.AddWithValue("Security_Ans",txtans.Text);
        cmd.Parameters.AddWithValue("me",Txtabtme.Text);
        new Connection().Execute(cmd);

        
        Response.Redirect("Profile_pic.aspx");
    }
}
