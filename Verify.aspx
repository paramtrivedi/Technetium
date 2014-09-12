<%@ Page Title="" Language="C#" MasterPageFile="~/Forgot Pass.master" AutoEventWireup="true" CodeFile="Verify.aspx.cs" Inherits="Verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td align="left">
Activation Code
</td>
<td>:
</td>
<td align="left">
    <asp:TextBox ID="Txtactivation" runat="server" 
        ToolTip="Enter 6-digit Activation Key Provided to your Email"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Invalid Code" ValidationExpression="\d{6}" 
        ControlToValidate="Txtactivation"></asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="Btnsub" runat="server" Text="Activate" onclick="Btnsub_Click" />
</td>
<td colspan="2">
    <asp:Label ID="Lblstatus" runat="server"></asp:Label>
</td>
</tr>
</table>
</asp:Content>

