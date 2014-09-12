<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:: Welcome To Technetium - The Element Which Force You To Learn Latest Technology :: </title>
    <LINK rel=stylesheet type=text/css href="Tcss/oldal-elrendezes.css"/>
    <LINK rel=stylesheet type=text/css href="Tcss/oldal-kinezet.css"/>
    <style type="text/css">
        .hide {display:none}
        .disp {display:block}
        INPUT { font-size:10pt}
        .bg 
        { background-color:#C0C0C0;}
        .bg1 
        { background-color:#F0F0F0;}
        .tright
        { text-align:right;}
        .highlight {background-color: yellow;}
        .bg2 {color:#C0C0C0}
        .style1
        {
            width: 239px;
        }
        .style2
        {
            width: 375px;
        }
        </style>
    
</head>
<body>

    <form id="form1" runat="server">
    <DIV id=tarolo>
<DIV id=fejlec>
<DIV id=fejlec-felso></DIV>
<DIV id=fejlec-kozepso>
<table width=95% cellpadding=0 cellspacing=0>
<tr>
<td rowspan=2><IMG alt="Technetium" src="images/Symbol.gif"></td>
<td valign=top><h1><A id=oldal-nev title="Technetium" href="#">Technetium.com</A></h1>
<div align=center>The Element Which Force You To Learn Latest Technology</div>
</td>
</tr>
<tr>
<td colspan=2><marquee scrollamount=3>Welcome To Technetium  </marquee></td>
</tr>
</table>
</DIV>
<DIV id=fejlec-also><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="lnk1">&nbsp;</span></DIV></DIV>
<DIV id=tartalmi-resz>
<DIV id=tartalom>
    
        <table align=center>
            <tr>
                <td align="center" colspan="3" 
                    style="font-size: large; font-weight: bold; text-transform: uppercase">
                    Registration<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                            </td>
                <td align="center" class="style1" rowspan="14" 
                    style="font-weight: normal; font-family: 'Courier New';">
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                        CausesValidation="False" Font-Size="Small">If Already a User </asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    First Name</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtFName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtFName" ErrorMessage="First Name Required" 
                        SetFocusOnError="True" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtLName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtLName" ErrorMessage="Last Name Required" 
                        SetFocusOnError="True" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Gender</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" 
                        RepeatLayout="Flow">
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="rblGender" ErrorMessage="Select Gender" 
                        SetFocusOnError="True" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    E-mail Id</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" AutoPostBack="True" 
                            ontextchanged="txtEmail_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email Required" 
                        SetFocusOnError="True" ValidationGroup="reg">*</asp:RequiredFieldValidator><br /><asp:Label ID="lblMsg" runat="server"></asp:Label>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                    <ProgressTemplate>
                    <img src="Images/loading.gif" />
                    </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
            <tr>
                <td>
                    Password</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtPwd" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
                    <asp:PasswordStrength ID="txtPwd_PasswordStrength" runat="server" 
                        BarIndicatorCssClass="" CalculationWeightings="50;15;15;20" Enabled="True" 
                        MinimumLowerCaseCharacters="2" MinimumNumericCharacters="1" 
                        MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" 
                        TargetControlID="txtPwd" TextCssClass="TextIndicator_TextBox1" 
                        TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent" 
                        TextStrengthDescriptionStyles="cssClass1;cssClass2;cssClass3;cssClass4;cssClass5">
                    </asp:PasswordStrength>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtPwd" ErrorMessage="Password Required" 
                        SetFocusOnError="True" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtCPwd" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtCPwd" ErrorMessage="Confirm Password Required" 
                        SetFocusOnError="True" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile No.</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtmobi" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtmobi" ErrorMessage="Invalid Mobile No." 
                        ValidationExpression="\d{10}" ValidationGroup="reg">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Group Name</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:ComboBox ID="ddlGrpName" runat="server" AutoCompleteMode="SuggestAppend">
                        <asp:ListItem Value="-1">-----Select Group----</asp:ListItem>
                    </asp:ComboBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="ddlGrpName" ErrorMessage="Select Group Name" 
                        SetFocusOnError="True" InitialValue="-1" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Question</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:DropDownList ID="drpque" runat="server">
                        <asp:ListItem>In what city or town was your first job</asp:ListItem>
                        <asp:ListItem>What is your maternal grandmother&#39;s maiden name</asp:ListItem>
                        <asp:ListItem>What was the name of your elementary / primary schoo</asp:ListItem>
                        <asp:ListItem>What is your youngest brother’s birthday</asp:ListItem>
                        <asp:ListItem>Where does your nearest sibling live</asp:ListItem>
                        <asp:ListItem>What was the last name of your third grade teacher</asp:ListItem>
                        <asp:ListItem>In what city or town did your mother and father meet</asp:ListItem>
                        <asp:ListItem>What was the name of your first stuffed animal</asp:ListItem>
                        <asp:ListItem>What is your oldest cousin&#39;s first and last name</asp:ListItem>
                        <asp:ListItem>What school did you attend for sixth grade</asp:ListItem>
                        <asp:ListItem>What is your oldest sibling&#39;s middle name</asp:ListItem>
                        <asp:ListItem>What is your oldest sibling’s birthday month and year</asp:ListItem>
                        <asp:ListItem>What is the middle name of your youngest child</asp:ListItem>
                        <asp:ListItem>What street did you live on in third grade</asp:ListItem>
                        <asp:ListItem>What is the name of your favorite childhood friend</asp:ListItem>
                        <asp:ListItem>What was your childhood nickname</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="drpque" ErrorMessage="Select A Vaild Quetion">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Answer</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtans" runat="server" Height="16px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtans" ErrorMessage="Answer Required" 
                        ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    <eo:Captcha ID="Captcha1" runat="server" ValidationGroup="reg">
                    </eo:Captcha>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="reg" />
                </td>
            </tr>
        </table>
    
</td>
</tr>
</table>
<DIV class=clear>
<DIV class=egyebek></DIV></DIV></DIV></DIV>
<DIV id=lablec> 
© Powered by Technetium. Contact : <a href="mailto:supertechnetium@gmail.com">supertechnetium@gmail.com</a></DIV></DIV>
    </form>
</body>
</html>
