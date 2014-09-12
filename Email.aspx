<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Email.aspx.cs" Inherits="Email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    <br />
    <div>
<table align=left>
<tr>
<td>
From 
</td>
<td>:</td>
<td>
    <asp:Label ID="lblsend" runat="server" Text="supertechnetium@gmail.com"></asp:Label></td>
</tr>
<tr>
<td>
To
</td>
<td>:</td>
<td>
    <asp:TextBox ID="Txtto" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="Txtto" ErrorMessage="Invalid Email" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
</tr>
<tr>
<td>
Bcc
</td>
<td>
    :</td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Invalid Email" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
</tr>
<tr>
<td>
    Sub</td>
<td>
    :</td>
<td>
    <asp:TextBox ID="txtsub" runat="server"></asp:TextBox>
    </td>
</tr>
<tr>
<td>
    Attachments</td>
<td>
    &nbsp;</td>
<td>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    </td>
</tr>
<tr>
<td>
    Body</td>
<td>
    :</td>
<td>
    <asp:TextBox ID="txtbody" runat="server" TextMode="MultiLine"></asp:TextBox>
    </td>
</tr>
<tr>
<td colspan="2">
    <asp:Button ID="btnsend" runat="server" Text="SEND" onclick="btnsend_Click" />
</td>
<td align="center">
    <asp:Button ID="btnback" runat="server" Text="Go Back" />
    </td>
</tr>
</table>
</div>



















</asp:Content>

