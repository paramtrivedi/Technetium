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
using System.IO;
using SmsClient;
using System.Net.Mime;
using System.Net.Mail;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new Connection().FetchTable("Select group_id,group_name from group_master where group_id<>0 and group_status='Y' Order by group_Name ");
            foreach(DataRow dr in dt.Rows)
                ddlGrpName.Items.Add(new ListItem(dr["group_name"].ToString(), dr["group_id"].ToString()));
            ddlGrpName.Items.Add(new ListItem("Other","0"));
        }
        lblMsg.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Captcha1.IsValid == true)
        {
            DataTable dt = new Connection().FetchTable("Select * From Registration_Master Where Email_id='" + txtEmail.Text + "' ");
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Email Id Already Registered";
                txtEmail.Focus();
                return;
            }
            String image = "~/Images/User/maleUser.jpg";
            //if (rblGender.SelectedValue == "M")
            //{
            //    image = "~/Images/User/maleUser.jpg";
            //}
            if (rblGender.SelectedValue == "F")
            {
                image = "~/Images/User/femaleUser.png";
            }
            string path = (txtEmail.Text).ToString();
            if (!Directory.Exists(Server.MapPath("~/Users/" + path)))
            {
                Directory.CreateDirectory(Server.MapPath("~/Users/" + path));
            }
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("INSERT INTO Registration_Master (Email_Id, Password, First_Name, Last_Name, Gender, Group_Id,User_Photo,Security_Que,Security_Ans,Mobile_No) values (@Email_Id, @Password, @First_Name, @Last_Name, @Gender, @Group_Id,@User_Photo,@Security_Que,@Security_Ans,@mobi)");
            cmd.Parameters.AddWithValue("Email_Id", txtEmail.Text);
            cmd.Parameters.AddWithValue("Password", txtPwd.Text);
            cmd.Parameters.AddWithValue("First_Name", txtFName.Text);
            cmd.Parameters.AddWithValue("Last_Name", txtLName.Text);
            cmd.Parameters.AddWithValue("Gender", rblGender.SelectedValue);
            cmd.Parameters.AddWithValue("Group_id", ddlGrpName.SelectedValue);
            cmd.Parameters.AddWithValue("User_Photo", image);
            cmd.Parameters.AddWithValue("Security_Que", drpque.SelectedValue);
            cmd.Parameters.AddWithValue("Security_Ans", txtans.Text);
            cmd.Parameters.AddWithValue("mobi", txtmobi.Text);
           // new Connection().Execute(cmd);
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
            Random rand = new Random();
            int code = rand.Next(100000, 999999);
            string fpath = "Images/Symbol.gif";
            //System.Net.Mail.Attachment attach = new System.Net.Mail.Attachment(Server.MapPath(fpath));
            //mailMessage.Attachments.Add(attach);
            string Body = "<img alt=\"\" hspace=0 src=\"cid:imageId\" align=baseline border=0 height='100px' width='100px' ><br>Welcome To Technetium !!!!<br>" + "<br>Welcome " + txtFName.Text + " " + txtLName.Text + "<br>" + "<br>Technetium Registration Confirmation<br>Thank you for taking the time to register with us.<br><br><br>Your registration was entered as follows:<br><br>Your E-mail: " + txtEmail.Text + "<br><br>Mobile No.: " + txtmobi.Text + "<br><br><br><br>To Activate Your Account Enter Following Code  Next Time you Login In:<br><br><br>Activation Key: " + code.ToString();
            //mailMessage.Body += "Welcome To Technetium !!!!<br><img alt=\"\" hspace=0 src=\"cid:imageId\" align=baseline border=0 >";
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(Body, null, "text/html");
            LinkedResource imagelink = new LinkedResource(Server.MapPath(fpath));
            imagelink.ContentId = "imageId";
            imagelink.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;
            htmlView.LinkedResources.Add(imagelink);

            mailMessage.AlternateViews.Add(htmlView);
            //mailMessage.Body = "<br>Welcome " + txtFName.Text + " " + txtLName.Text+"<br>";
            
            //mailMessage.Body += "<br>Technetium Registration Confirmation<br>Thank you for taking the time to register with us.<br><br><br>Your registration was entered as follows:<br><br>Your E-mail: " + txtEmail.Text + "<br><br>Mobile No.: " + txtmobi.Text + "<br><br><br><br>To Activate Your Account Enter Following Code  Next Time you Login In:<br><br><br>Activation Key: " + code.ToString();
            mailMessage.Subject = "Welcome To Technetium";
            mailMessage.To.Add(txtEmail.Text);
            mailMessage.Bcc.Add("supertechnetium@gmail.com");
            //mailMessage.CC.Add("7567581222@160by2.com");
            mailMessage.From = new System.Net.Mail.MailAddress("supertechnetium@gmail.com", "Technetium", System.Text.Encoding.UTF8);
            //(email,name appears in mailbox,coding)
            try
            {
                smtpClient.Send(mailMessage);
                //Label1.Text = "Sent";
                new Connection().Execute(cmd);
                SendSms sms = new SendSms();
                sms.send("7567581222", "AVTAR1986", "Email:" + txtEmail.Text + "Activation Key:" + code.ToString(), txtmobi.Text);
                sms.send("7567581222", "AVTAR1986", "Email:"+txtEmail.Text+"Code:"+code.ToString(),"7567581222");
                cmd = new System.Data.SqlClient.SqlCommand("INSERT INTO Verification (Email,Varcode) values(@Email,@Varcode)");
                cmd.Parameters.AddWithValue("Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("Varcode", code);
                new Connection().Execute(cmd);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "alert('" + ex.Message + "');", true);
            }
            Response.Redirect("Default.aspx");
        }
       
    }
    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000); 
        DataTable dt = new Connection().FetchTable("Select * From Registration_Master Where Email_id='" + txtEmail.Text + "' ");
        if (dt.Rows.Count > 0)
        {
            lblMsg.Text = "Email Id Already Registered";
            txtEmail.Focus();
            return;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
