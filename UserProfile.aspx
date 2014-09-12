<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile"%>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align=center>
            <tr>
                <td align="center" colspan="3">
                    Registration
                            </td>
            </tr>
            <tr>
                <td align="center" colspan="3" 
                    style="font-weight: bold; text-transform: uppercase; font-size: large">
                    Basic Information</td>
            </tr>
            <tr>
                <td>
                    First Name</td>
                <td>
                    :</td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtFName" ErrorMessage="First Name Required" 
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name</td>
                <td>
                    :</td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtLName" ErrorMessage="Last Name Required" 
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Gender</td>
                <td>
                    :</td>
                <td>
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" 
                        RepeatLayout="Flow">
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="rblGender" ErrorMessage="Select Gender" 
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Date Of Birth</td>
                <td>
                    :</td>
                <td>
                    <asp:TextBox ID="Txtdob" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Txtdob" ErrorMessage="Enter Birth date">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Occupation</td>
                <td>
                    :</td>
                <td>
                    <asp:DropDownList ID="Drpoccup" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    About Me</td>
                <td>
                    :</td>
                <td>
                    <asp:TextBox ID="Txtabtme" runat="server" TextMode="MultiLine" Width="128px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" 
                    style="font-size: large; font-weight: bold; text-transform: uppercase">
                    Contact Information</td>
            </tr>
            <tr>
                <td>
                    Mobile No.</td>
                <td>
                    :</td>
                <td>
                    <asp:TextBox ID="Txtmobi" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="Txtmobi" ErrorMessage="Mobile No. Requied">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="Txtmobi" ErrorMessage="Enter Correct Mobile No." 
                        ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td>
                    :</td>
                <td>
                    <asp:Label ID="lblemail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" 
                    style="font-size: large; font-weight: bold; text-transform: uppercase">
                    Security Information</td>
            </tr>
            <tr>
                <td>
                    Question</td>
                <td>
                    :</td>
                <td>
                    <asp:DropDownList ID="drpque" runat="server">
                        <asp:ListItem>In what city or town was your first job</asp:ListItem>
                        <asp:ListItem>What is your maternal grandmother&#39;s maiden name</asp:ListItem>
                        <asp:ListItem>What was the name of your elementary / primary schoo</asp:ListItem>
                        <asp:ListItem>What is your youngest brother’s birthday</asp:ListItem>
                        <asp:ListItem>Where does your nearest sibling live</asp:ListItem>
                        <asp:ListItem>What was the last name of your third grade teacher</asp:ListItem>
                        <asp:ListItem>In what city or town did your mother and father meet</asp:ListItem>
                        <asp:ListItem>What was the name of your first stuffed animal</asp:ListItem>
                        <asp:ListItem>What is your oldest cousin&#39;s first and last name</asp:ListItem>
                        <asp:ListItem>What school did you attend for sixth grade</asp:ListItem>
                        <asp:ListItem>What is your oldest sibling&#39;s middle name</asp:ListItem>
                        <asp:ListItem>What is your oldest sibling’s birthday month and year</asp:ListItem>
                        <asp:ListItem>What is the middle name of your youngest child</asp:ListItem>
                        <asp:ListItem>What street did you live on in third grade</asp:ListItem>
                        <asp:ListItem>What is the name of your favorite childhood friend</asp:ListItem>
                        <asp:ListItem>What was your childhood nickname</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="drpque" ErrorMessage="Select A question">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Answer                <td class="style2">
                    :</td>
                <td class="style2">
                    <asp:TextBox ID="txtans" runat="server" Height="16px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtans" ErrorMessage="Answer Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
</asp:Content>

