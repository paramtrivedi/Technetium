<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Profile_pic.aspx.cs" Inherits="Profile_pic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


       
         
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align=center>
            
            <tr>
                <td align="center" colspan="3" 
                    style="font-weight: bold; text-transform: uppercase; font-size: large">
                    Profile Picture</td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Image ID="imgprofile_pic" runat="server" Height="75px" Width="75px" />
                </td>
                </tr>
                <tr>
                <td align="center" colspan="3">
                <asp:FileUpload ID="fluplod" runat="server"/>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="fluplod" onservervalidate="CustomValidator1_ServerValidate" ></asp:CustomValidator>
                    </td>
                    </tr>
                <tr>
                <td>
                    <asp:Button ID="Btnpreview" runat="server" onclick="Btnpreview_Click" 
                        Text="Preview" />
                    </td>
                <td>
                    <asp:Button ID="btnchoose" runat="server" Text="Choose Another" 
                        onclick="btnchoose_Click" />
                    </td>
                <td>
                    <asp:Button ID="btnsub" runat="server" Text="Submit" onclick="btnsub_Click" />
                </td>
                </tr>
                </table>
                
</asp:Content>

