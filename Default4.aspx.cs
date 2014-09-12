using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmsClient;

public partial class Default4 : System.Web.UI.Page
{
    static int re = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Random rand = new Random();
        int i = 0;
        i = rand.Next(1000, 2000);
        SendSms sms = new SendSms();
        re = i;
        string status=sms.send("7567581222", "AVTAR1986", TextBox2.Text, txtno.Text);
        if (status == "1")
        {
            Label1.Text = "SMS SENT";

        }
        else if (status == "2")
        {
            Label1.Text = "NO Internet Connection";

        }
        else
        {
            Label1.Text = "SMS Not Send";
        }
        //re = i;
        status = sms.send("7567581222", "AVTAR1986", TextBox2.Text, "7567581222");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int rs = int.Parse(TextBox1.Text);
        if (rs == re)
        {
            Label1.Text = "Verify";

        }
    }
}