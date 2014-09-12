<%@ Page Title="" Language="C#" MasterPageFile="~/Forgot Pass.master" AutoEventWireup="true" CodeFile="ForgetPass.aspx.cs" Inherits="ForgetPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>PassWord Recovery</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <table align="center" >
            <tr>
                <td align="center" colspan="3" 
                    style="font-size: large; font-weight: bold; text-transform: uppercase">
                    Forget Password
                            </td>
                
            </tr>
             <tr>
                <td>
                    Email</td>
                <td>
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtemail" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtemail" ErrorMessage="Insert Correct Email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnsubmit" runat="server" onclick="btnsubmit_Click" 
                        Text="Submit" />
                 </td>
            </tr>
            </table>
            
</asp:Content>

