<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>:: Welcome To Technetium - The Element Which Force You To Learn Latest Technology :: </title>
    <LINK rel=stylesheet type=text/css href="Tcss/oldal-elrendezes.css">
    <LINK rel=stylesheet type=text/css href="Tcss/oldal-kinezet.css">
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


<table style="width:100%">
<tr>
<td style="height:300px;" valign="top">
    <table style="width:95%" align=center cellpadding=5 cellspacing=5 >
                    <tr>
                    <td align=left rowspan=10>
                    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="470" height="270" id="intro_Esta" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="intro.swf" />
<param name="quality" value="high" />
<param name="menu" value="0" />
<param name="bgcolor" value="#000000" />
<embed src="intro.swf" quality="high" bgcolor="#000000" width="500" height="281" name="intro_Esta" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
                    </td>
                    <td align=left>&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                    <td align=left class="bg" style="font-size:14px;font-weight:bold">&nbsp;&nbsp;1. Existing User </td>                    
                    </tr>
                    <tr>
                    <td valign=top><br />
                        <table align=center cellpadding=5 cellspacing=5>
                            <tr>
                                <td colspan=3 align=center>User Login</td>
                            </tr>
                            <tr>
                            <td>E-Mail Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td><td>:</td><td>
                                <asp:TextBox ID="txtUName" runat="server" Width="150px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtUName" Display="Dynamic" 
                                    ErrorMessage="* Reuired Email Id" SetFocusOnError="True" Font-Size="10px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtUName" Display="Dynamic" 
                                    ErrorMessage="* Invalid Email Id" Font-Size="10px" SetFocusOnError="True" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                            <td>Password</td><td>:</td><td>
                                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPwd" Display="Dynamic" ErrorMessage="* Reuired Password" 
                                    SetFocusOnError="True" Font-Size="10px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                            <td colspan=3 align=center>
                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                            <td colspan=3 align=center>
                                <asp:Button ID="btnLogin" runat="server" Text="Login" Height="25px" 
                                    Width="76px" onclick="btnLogin_Click" />
                                </td>
                            </tr>
                            <tr>
                            <td colspan=3 align=center 
                                    style="font-family: 'Courier New'; font-size: small; font-weight: normal">
                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                                    CausesValidation="False">Forget Password?</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        
                    </td>
                    </tr>
                    <tr>
                    <td align=left class="bg" style="font-size:14px;font-weight:bold">&nbsp;&nbsp;2. New User </td>
                    </tr>
                    <tr>
                    <td align=center>
                        <asp:HyperLink ID="lnkLink" NavigateUrl="~/Registration.aspx" runat="server">Click Here</asp:HyperLink></td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
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
