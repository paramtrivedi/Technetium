<%@ Page Title="" Language="C#" MasterPageFile="~/Forgot Pass.master" AutoEventWireup="true" CodeFile="ForgotSecure.aspx.cs" Inherits="ForgotSecure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <table align=center >
<tr>
<td colspan="2" align="center" 
        style="font-size: large; font-weight: bold; text-transform: uppercase">User Info</td>
</tr>
<tr>
<td>
    <asp:Image ID="imgprofle" runat="server" Height="75px" Width="75px" />
</td>
<td>
    <asp:Label ID="lblUsername" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="center" colspan="2">
    Thats You!!!!!</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnsubmit" runat="server" Text="Next----&gt;" 
        onclick="btnsubmit_Click" />
</td>
<td>
    <asp:Button ID="btngoback" runat="server" Text="&lt;---Go Back" 
        onclick="btngoback_Click" />
</td>
</tr>
</table>
</asp:Content>

