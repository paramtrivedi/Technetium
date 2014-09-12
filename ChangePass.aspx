<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="ChangePass" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

<table align="center">
<tr><td>
    <asp:Label ID="lbloldpass" runat="server" Text="Old Pass"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="txtoldpass" runat="server" 
            AutoPostBack="True" ontextchanged="txtoldpass_TextChanged" 
            ViewStateMode="Enabled"></asp:TextBox>
        </td>
        <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtoldpass" ErrorMessage="Insert New Password">*</asp:RequiredFieldValidator>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
    </td>
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </td>
<td>
    &nbsp;</td>
</tr>

</table>
</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>

