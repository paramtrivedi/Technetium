<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>:: Welcome To Technetium Administator Login Page ::</title>
    <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
</head>
<body id="login-bg"> 
    <form id="form1" runat="server">
<!-- Start: login-holder -->
<div id="login-holder">

	<!-- start logo -->
	<div id="logo-login">
		<img src="Images/logo.png" width="456" height="80" alt="" />
	</div>
	<!-- end logo -->
	
	<div class="clear"></div>
	
	<!--  start loginbox ................................................................................. -->
	<div id="loginbox">
	
	<!--  start login-inner -->
	<div id="login-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Username</th>
			<td>
                <asp:TextBox ID="txtUName" CssClass="login-inp" runat="server"></asp:TextBox>
			    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUName" ErrorMessage="* User Name Required" 
                    ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<th>Password</th>
			<td>
                <asp:TextBox ID="txtPwd" CssClass="login-inp" runat="server" 
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPwd" ErrorMessage="*Password Required" ForeColor="White"></asp:RequiredFieldValidator>
                        </td>
		</tr>
		<tr>
			<th></th>
			<td valign="top">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="White"></asp:Label> </td>
		</tr>
		<tr>
			<th></th>
			<td>
                <asp:Button ID="btnSubmit" CssClass="submit-login" runat="server" Text="" 
                    onclick="btnSubmit_Click" /></td>
		</tr>
		</table>
	</div>
 	<!--  end login-inner -->
	<div class="clear"></div>
 </div>
 <!--  end loginbox -->
 

    </form>
</body>
</html>
