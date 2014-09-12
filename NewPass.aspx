<%@ Page Title="" Language="C#" MasterPageFile="~/Forgot Pass.master" AutoEventWireup="true" CodeFile="NewPass.aspx.cs" Inherits="NewPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>New Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
 <table align=center >
<tr>
<td colspan="2" align="center" 
        style="font-size: small; font-weight: lighter; text-transform: none">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </td>
<td align="center" 
        style="font-size: large; font-weight: bold; text-transform: uppercase">&nbsp;</td>
</tr>
<tr>
<td colspan="2" align="center" 
        style="font-size: large; font-weight: bold; text-transform: uppercase">User Info</td>
<td align="center" 
        style="font-size: large; font-weight: bold; text-transform: uppercase">&nbsp;</td>
</tr>
<tr>
<td>
    New Password:
</td>
<td>
    <asp:TextBox ID="Txtnpass" runat="server" TextMode="Password"></asp:TextBox>
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="Txtnpass" ErrorMessage="Insert New Password">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
    Confrim Password:
</td>
<td>
    <asp:TextBox ID="Txtconpass" runat="server" TextMode="Password"></asp:TextBox>
</td>
<td>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="Txtnpass" ControlToValidate="Txtconpass" 
        ErrorMessage="Password Didn't Match">*</asp:CompareValidator>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btn" runat="server" onclick="btn_Click" Text="Submit" />
</td>
<td>
    &nbsp;</td>
<td>
    &nbsp;</td>
</tr>
    </table>
</asp:Content>

