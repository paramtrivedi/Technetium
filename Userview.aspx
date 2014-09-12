<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Userview.aspx.cs" Inherits="Userview" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<script type="text/javascript" src="Script/jquery.js"></script>
	<script type="text/javascript" src="Script/thickbox.js"></script>
	<link rel="stylesheet" href="Script/thickbox.css" type="text/css" media="screen">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>User View</h2>
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

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

    <table style="width:100%">
        <tr>
            <td align="center">
                First Name :
                <asp:TextBox ID="txtUName" runat="server"></asp:TextBox>
                <asp:AutoCompleteExtender ID="txtUName_AutoCompleteExtender" runat="server" 
                    DelimiterCharacters="" Enabled="True" ServicePath="~/AutoComplete.asmx" 
                    TargetControlID="txtUName" MinimumPrefixLength="1" ServiceMethod="GetUserlist">
                </asp:AutoCompleteExtender>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="User_Id" DataSourceID="SqlDataSource1" 
                     PageSize="5" AllowPaging="True" 
                    EmptyDataText="No Record(s) Found" Width="100%">
                    <EmptyDataRowStyle Font-Size="14pt" ForeColor="Red" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="User_Id" HeaderText="User_Id" 
                            SortExpression="User_Id" InsertVisible="False" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Profile_Pic">
                            <EditItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="50px" 
                                    ImageUrl='<%# Eval("User_Photo") %>' Width="50px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="50px" 
                                    ImageUrl='<%# Eval("User_Photo") %>' Width="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First_Name" SortExpression="First_Name">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("First_Name") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("First_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email_Id" SortExpression="Email_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group Name" SortExpression="group_name">
                            <EditItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("group_name") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("group_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile_No" SortExpression="Mobile_No">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Mobile_No") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Mobile_No") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User_Status" SortExpression="User_Status">
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" RepeatLayout="Flow" 
                                    SelectedValue='<%# Bind("User_Status") %>'>
                                    <asp:ListItem Value="Y">Active</asp:ListItem>
                                    <asp:ListItem Value="N">InActive</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# Eval("User_Status").ToString()=="Y"?"Active":"InActive" %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" 
                    
                    
                    
                    
                    
                    SelectCommand="SELECT Registration_Master.User_Id, Registration_Master.Email_Id, Registration_Master.Password, Registration_Master.First_Name, Registration_Master.Last_Name, Registration_Master.Gender, Registration_Master.Date_Of_Birth, Registration_Master.Mobile_No, Registration_Master.Occupation, Registration_Master.Group_Id, Registration_Master.Security_Que, Registration_Master.Security_Ans, Registration_Master.User_Photo, Registration_Master.About_Me, Registration_Master.User_Status, Group_Master.group_name FROM Registration_Master INNER JOIN Group_Master ON Registration_Master.Group_Id = Group_Master.group_id WHERE (Registration_Master.First_Name LIKE @First_Name + '%') ORDER BY Registration_Master.First_Name" 
                    UpdateCommand="UPDATE [Registration_Master] SET [User_Status] = @User_Status WHERE [User_Id] = @User_Id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUName" Name="First_Name" 
                            PropertyName="Text" ConvertEmptyStringToNull="False" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User_Status" />
                        <asp:Parameter Name="User_Id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text="Record(s) Found : 0"></asp:Label>
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
</asp:Content>

