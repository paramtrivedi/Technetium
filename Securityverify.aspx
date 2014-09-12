<%@ Page Title="" Language="C#" MasterPageFile="~/Forgot Pass.master" AutoEventWireup="true" CodeFile="Securityverify.aspx.cs" Inherits="Serurityverify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Security Verification</title>
    <style type="text/css">
        .style2
        {
        }
        .style3
        {
            width: 77px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table ID="Table1" runat="server" align=center >
    <tr>
    <td align="left" colspan="2">:::Security Verification:::
    </td>
    </tr>
    <tr>
    <td align="left" colspan="2">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Value="Q">Answer Security Quetion</asp:ListItem>
        <asp:ListItem Value="S">Verify Yourself by Sms</asp:ListItem>
            <asp:ListItem Value="E">Email(UserName And Password)</asp:ListItem>
        </asp:RadioButtonList>
    </td>
    </tr>
    <tr>
    <td align="left" colspan="2">
        <asp:Label ID="lblQue" runat="server" Text=""></asp:Label>
    </td>
    
    
    </tr>
    <tr>
    <td class="style3">
        <asp:TextBox ID="Txtans" runat="server"></asp:TextBox>
    </td>
    <td>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="Txtans" ErrorMessage="Answer Requied">*</asp:RequiredFieldValidator>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>

    </td>
    </tr>
    <tr>
    <td class="style2" colspan="2">
            </td>
    </tr>
    <tr>
    <td class="style3">
        <asp:Label ID="lblmobi" runat="server" Text="Mobile No."></asp:Label>
        </td>
    <td>

        <asp:Label ID="lblno" runat="server"></asp:Label>

    </td>
    </tr>
    <tr>
    <td class="style2" colspan="2">
        <asp:Label ID="lblverify" runat="server" Text="Verify Code:"></asp:Label>
        </td>
    </tr>
    <tr>
    <td class="style3">

        <asp:TextBox ID="txtverify" runat="server" Height="20px" Width="67px"></asp:TextBox>

        </td>
    <td>

        <asp:Label ID="lblmsg0" runat="server"></asp:Label>

    </td>
    </tr>
    <tr>
    <td class="style3">

        <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>

        </td>
    <td>

        <asp:Label ID="lblmsgE" runat="server"></asp:Label>

    </td>
    </tr>
    <tr>
    <td class="style3">
        <asp:Button ID="btnsub" runat="server" onclick="btnsub_Click" Text="Submit" />
    </td>
    <td>

        <asp:Button ID="btncancel" runat="server" CausesValidation="False" 
            Text="Cancel" />

    </td>
    </tr>
    </table>
</asp:Content>

