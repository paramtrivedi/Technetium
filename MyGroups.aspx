<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="MyGroups.aspx.cs" Inherits="MyGroups"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>My Sub Groups</h2>
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

    <table class="style1">
        <tr>
            <td>Sub Group Name : 
                <asp:DropDownList ID="ddlSubgroup" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="Sub_Group_Name" DataValueField="Sub_Group_Id" 
                    AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="0">-- Select --</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" SelectCommand="SELECT [Sub_Group_Id], [Sub_Group_Name] FROM [Sub_Group_Master] WHERE ([Group_Id] = @Group_Id) And User_Id=@User_Id

UNION
SELECT J.SUB_GROUP_ID, S.SUB_GROUP_NAME FROM JOIN_SUB_GROUP J INNER JOIN SUB_GROUP_MASTER S ON J.SUB_GROUP_ID=S.SUB_GROUP_ID AND STATUS='Y' AND INVITE_USER_ID=@User_Id
">
                    <SelectParameters>
                        <asp:SessionParameter Name="Group_Id" SessionField="gid" Type="Int32" />
                        <asp:SessionParameter Name="User_Id" SessionField="uid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="User_Id" DataSourceID="SqlDataSource2" 
                    onrowcommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="User Name" SortExpression="UName">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("UName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" Height="50px" 
                                    ImageUrl='<%# Eval("User_Photo") %>' Width="50px" />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("UName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Option">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text="Waiting..." 
                                    Visible='<%# Eval("JStatus").ToString()=="N"?true:false %>'></asp:Label>
                                <br />
                                <asp:LinkButton ID="lnkInvite" runat="server" 
                                    CommandArgument='<%# Eval("User_Id") %>' 
                                    CommandName='<%# Eval("JStatus").ToString()==""?"Invite":"Remove" %>' 
                                    Text='<%# Eval("JStatus").ToString()==""?"Invite":"Remove" %>' 
                                    Visible='<%# (Eval("JStatus").ToString()=="Y" || Eval("JStatus").ToString()=="")?true:false %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" 
                    
                    SelectCommand="SELECT First_Name + ' ' + Last_Name AS UName, User_Photo, User_Id,(Select Status From Join_Sub_Group Where Invite_User_id=R.User_Id And Sub_Group_Id=@subgid)  as JStatus FROM Registration_Master R WHERE (Group_Id = @grpid And User_Id<>0) And User_Id&lt;&gt;@uid And User_Id Not In(Select User_Id From Sub_Group_Master Where Sub_Group_Id=@subgid)">
                    <SelectParameters>
                        <asp:SessionParameter Name="grpid" SessionField="gid" />
                        <asp:SessionParameter Name="uid" SessionField="uid" />
                        <asp:ControlParameter ControlID="ddlSubgroup" Name="subgid" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
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

