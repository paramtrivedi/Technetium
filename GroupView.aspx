<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="GroupView.aspx.cs" Inherits="GroupView" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="Script/jquery.js"></script>
	<script type="text/javascript" src="Script/thickbox.js"></script>
	<link rel="stylesheet" href="Script/thickbox.css" type="text/css" media="screen">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Group View</h2>
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
                Group Name :
                <asp:TextBox ID="txtGName" runat="server"></asp:TextBox>
                <cc1:AutoCompleteExtender ID="txtGName_AutoCompleteExtender" runat="server" 
                    DelimiterCharacters="" Enabled="True" MinimumPrefixLength="1" 
                    ServiceMethod="GetGroupList" ServicePath="AutoComplete.asmx" 
                    TargetControlID="txtGName">
                </cc1:AutoCompleteExtender>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="group_id" DataSourceID="SqlDataSource1" 
                    onrowcommand="GridView1_RowCommand" PageSize="5" AllowPaging="True" 
                    EmptyDataText="No Record(s) Found" Width="100%">
                    <EmptyDataRowStyle Font-Size="14pt" ForeColor="Red" />
                    <Columns>
                        <asp:TemplateField HeaderText="Option">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                    CommandArgument='<%# Eval("group_id") %>' CommandName="Modify" 
                                    onclientclick="return confirm('Are u sure to edit?')">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name Of Group" SortExpression="group_name">
                            <ItemTemplate>
                                <asp:HyperLink ToolTip="Group Description" CssClass="thickbox" ID="HyperLink2" runat="server" 
                                    NavigateUrl='<%# "GrpDetail.aspx?height=200&amp;width=200&amp;id="+Eval("group_id").ToString() %>' 
                                    Text='<%# Eval("group_name") %>'></asp:HyperLink>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("group_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group Image" SortExpression="group_image">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("group_image") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="105px" 
                                    ImageUrl='<%# Eval("group_image") %>' Width="100px" />
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="create_date_time" HeaderText="Create Date Time" 
                            SortExpression="create_date_time" >
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Group Status" SortExpression="group_status">
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    SelectedValue='<%# Bind("group_status") %>'>
                                    <asp:ListItem Value="Y">Active</asp:ListItem>
                                    <asp:ListItem Value="N">Inactive</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# (Eval("group_status").ToString()=="Y"?"Active":"Inactive") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" 
                    
                    SelectCommand="SELECT * FROM [Group_Master] WHERE ([group_name] LIKE @group_name + '%') ORDER BY [group_name]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtGName" ConvertEmptyStringToNull="False" 
                            Name="group_name" PropertyName="Text" Type="String" />
                    </SelectParameters>
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