using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using SmsClient;

public partial class Serurityverify : System.Web.UI.Page
{
    static int Code=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Fuid"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            //SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
            //cmd.Parameters.AddWithValue("User_Id", Session["Fuid"]);
            //DataTable dt = new Connection().FetchTable(cmd);
            //lblQue.Text = dt.Rows[0]["Security_Que"].ToString();
            lblQue.Visible = false;
            Txtans.Visible = false;
            txtverify.Visible = false;
            lblno.Visible = false;
            lblmobi.Visible = false;
            lblverify.Visible = false;
            lblemail.Visible = false;
            

        }

    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
            cmd.Parameters.AddWithValue("User_Id", Session["Fuid"]);
            DataTable dt = new Connection().FetchTable(cmd);
            if (RadioButtonList1.SelectedValue == "Q")
            {
                if (Txtans.Text == dt.Rows[0]["Security_Ans"].ToString())
                {
                    Response.Redirect("NewPass.aspx");
                }
                else
                {
                    Txtans.Text = "";
                    lblmsg.Text = "Wrong Answer";
                }
            }
            else if (RadioButtonList1.SelectedValue == "S")
            {
                int tmp=Int32.Parse(txtverify.Text);
                if (int.Parse(ViewState["code"].ToString()) == tmp)
                {
                    Response.Redirect("NewPass.aspx");
                }
                else
                {
                    txtverify.Text = "";
                    lblmsg0.Text = "Wrong Code";
                }
            }
            else if (RadioButtonList1.SelectedValue == "E")
            {
                btnsub.CausesValidation = false;
                System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new System.Net.NetworkCredential("supertechnetium@gmail.com", "Avtar2012");
                //(email,password)
                smtpClient.Port = 587;
                // or 465;
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.EnableSsl = true;
                System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
                mailMessage.IsBodyHtml = true;

                mailMessage.Body = "Hi!!! " + dt.Rows[0]["First_Name"].ToString() + " " + dt.Rows[0]["Last_Name"].ToString();
                Random rand = new Random();
                string code = "Tech"+rand.Next(10000000, 99999999);
                
                ViewState["pass"]=code.ToString();
                mailMessage.Body += "<br>Technetium Recovery Information<br><br><br>Your registrated information is entered as follows:<br><br>Your E-mail: " + lblmsgE.Text + "<br><br><br><br>To Access Your Account  Enter Following Password<br><br><br>Password: " + code.ToString();
                mailMessage.Subject = "Welcome To Technetium";
                mailMessage.To.Add(lblmsgE.Text);
                mailMessage.Bcc.Add("supertechnetium@gmail.com");

                mailMessage.From = new System.Net.Mail.MailAddress("supertechnetium@gmail.com", "Technetium", System.Text.Encoding.UTF8);
                //(email,name appears in mailbox,coding)
                try
                {
                    smtpClient.Send(mailMessage);
                    //Label1.Text = "Sent";
                    SendSms sms = new SendSms();
                    string status = sms.send("7567581222", "AVTAR1986","UserName:"+dt.Rows[0]["Email_Id"].ToString()+"Pass:"+ViewState["pass"].ToString() , "7567581222");
                    cmd = new SqlCommand("Update Registration_Master set Password=@Password where User_Id="+Session["fuid"].ToString());
                    cmd.Parameters.AddWithValue("Password", ViewState["pass"].ToString());
                    new Connection().Execute(cmd);
                    Response.Redirect("Default.aspx");
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "alert('" + ex.Message + "');", true);
                }
            }

    }
   
   
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (RadioButtonList1.SelectedIndex == 0)
        {
            lblQue.Visible = true;
            Txtans.Visible = true;
            txtverify.Visible = false;
            lblno.Visible = false;
            lblmobi.Visible = false;
            lblverify.Visible = false;
            SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
            cmd.Parameters.AddWithValue("User_Id", Session["Fuid"]);
            DataTable dt = new Connection().FetchTable(cmd);
            lblQue.Text = dt.Rows[0]["Security_Que"].ToString();
        }
        else if(RadioButtonList1.SelectedIndex==1)
        {
            lblQue.Visible = false;
            Txtans.Visible = false;
            txtverify.Visible = true;
            lblno.Visible = true;
            lblmobi.Visible = true;
            lblverify.Visible = true;
            SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
            cmd.Parameters.AddWithValue("User_Id", Session["Fuid"]);
            DataTable dt = new Connection().FetchTable(cmd);
            lblno.Text = dt.Rows[0]["Mobile_No"].ToString();
            Random Rand = new Random();
      
             int GenrateCode = 0;
             GenrateCode= Rand.Next(1000, 2000);
             Code = GenrateCode;
             ViewState["code"] = Code.ToString();
            string msg="Hi"+" "+ dt.Rows[0]["First_Name"].ToString()+ "Your Verification Code is:" + GenrateCode.ToString();
             SendSms sms = new SendSms();
             string status= sms.send("7567581222", "AVTAR1986",msg, lblno.Text);
             if (status == "1")
             {
                 lblmsg0.Text = "Sent";

             }
             else if (status == "2")
             {
                 lblmsg0.Text = "NO Internet Connection";

             }
             else
             {
                 lblmsg0.Text ="SMS Not Send";
             }
        
             
        
        }
           
        else if (RadioButtonList1.SelectedIndex == 2)
        {
            lblemail.Visible = true;
            lblmsgE.Visible = true;
            SqlCommand cmd = new SqlCommand("Select * From Registration_Master where User_Id=@User_Id");
            cmd.Parameters.AddWithValue("User_Id", Session["Fuid"]);
            DataTable dt = new Connection().FetchTable(cmd);
            lblmsgE.Text=dt.Rows[0]["Email_Id"].ToString();
            btnsub.Text = "Send new pass word";
            
            


        }
    }

}