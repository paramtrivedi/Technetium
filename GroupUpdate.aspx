<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="GroupUpdate.aspx.cs" Inherits="GroupUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align=center border=1>
        <tr>
            <td align="center" colspan="3">
                Group Update</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGrpName" runat="server" Text="Group Name" 
                    AssociatedControlID="txtGrpName"></asp:Label>
            </td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="txtGrpName" runat="server" MaxLength="50" Width="250px" 
                    CssClass="bold"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtGrpName" ErrorMessage="Group Name Required" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Description</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="txtDescr" runat="server" Columns="30" Rows="10" 
                    TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtDescr" ErrorMessage="Description Required" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Image File</td>
            <td>
                :</td>
            <td>
                <asp:Image ID="imgFile" runat="server" Height="100px" Width="100px" />
                <br />
                <asp:FileUpload ID="fluFile" runat="server" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="fluFile" ErrorMessage="*" 
                    onservervalidate="CustomValidator1_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                Group Status</td>
            <td>
                :</td>
            <td>
                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Y">Active</asp:ListItem>
                    <asp:ListItem Value="N">Inactive</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Error In Page" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>