<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddGroup.aspx.cs" Inherits="AddGroup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
<div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>New Group</h2>
							<span class="title_wrapper_left"></span>
							<span class="title_wrapper_right"></span>
						</div>
						<!--[if !IE]>end title wrapper<![endif]-->
						<!--[if !IE]>start section content<![endif]-->
						<div class="section_content">
							<!--[if !IE]>start section content top<![endif]-->
							<div class="sct">
								<div class="sct_left">
									<div class="sct_right">
										<div class="sct_left">
											<div class="sct_right">
												
												
												<div  id="product_list">
												<!--[if !IE]>start table_wrapper<![endif]-->
												<div class="table_wrapper">
													<div class="table_wrapper_inner">


   
    <table align=center border=0>
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
                <asp:FileUpload ID="fluFile" runat="server" Height="22px" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="fluFile" ErrorMessage="*" 
                    onservervalidate="CustomValidator1_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center" colspan="3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Error In Page" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
    </div>
												</div>
												<!--[if !IE]>end table_wrapper<![endif]-->
												</div>
												
												
												
												
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--[if !IE]>end section content top<![endif]-->
							<!--[if !IE]>start section content bottom<![endif]-->
							<span class="scb"><span class="scb_left"></span><span class="scb_right"></span></span>
							<!--[if !IE]>end section content bottom<![endif]-->
							
						</div>
						<!--[if !IE]>end section content<![endif]-->
					</div>
    </form>
</body>
</html>
