<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="TechHub.aspx.cs" Inherits="TechHub" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta http-equiv="refresh" content="15">
    <script language=javascript>
        function com_vis(ctl)
        {
            var cid = ctl.id;
            var pid = cid.replace("lnkComment","Panel1");
            var txt = cid.replace("lnkComment","txtComment");
            //alert(cid+"\n"+pid);
            //alert(pid);
            if(document.getElementById(pid).style.display=='block')
            {
                document.getElementById(pid).style.display='none';
             }
               else
              {
                document.getElementById(pid).style.display='block';
                document.getElementById(txt).focus();
               }
            
        }
    </script>
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
							<h2>Tech Post</h2>
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <table>
        <tr>
        <td>
        <table id=tblpost runat=server>
        <tr>
        <td>
        Group Name : <asp:Label ID="lblGroup" runat="server" Text=""></asp:Label>
        </td>
        </tr>
        <tr>
            <td>
                New Post</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtPost" runat="server" Columns="50" Rows="3" 
                    TextMode="MultiLine"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtPost" ErrorMessage="Post Description Required" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align=right>
                <asp:Button ID="btnPost" runat="server" Text="Post" onclick="btnPost_Click" /></td>
        </tr>
        </table>
        </td>
        </tr>
        <tr>
            <td>
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" Width="500px" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="First_Name" HeaderText="UserName" 
                            SortExpression="First_Name" >
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Post" SortExpression="Post_Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    Text='<%# Bind("Post_Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Post_Description") %>'></asp:Label>
                                <asp:Label ID="lblPid" runat="server" Text='<%# Eval("Post_Id") %>' 
                                    Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" 
                                    Width="100%">
                                    <ItemTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td rowspan="2" width="50">
                                                    <asp:Image ID="Image2" runat="server" Height="50px" 
                                                        ImageUrl='<%# Eval("User_Photo") %>' Width="50px" />
                                                </td>
                                                <td valign="top">
                                                    <asp:Label ID="First_NameLabel" runat="server" 
                                                        Text='<%# Eval("First_Name") %>' />
                                                    <br />
                                                    <asp:Label ID="Reply_Date_TimeLabel" runat="server" Font-Size="10px" 
                                                        Text='<%# Eval("Reply_Date_Time") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-style: solid; border-width: thin; border-color: #C0C0C0" 
                                                    valign="top">
                                                    <asp:Label ID="Reply_DescrLabel" runat="server" Font-Size="16px" 
                                                        Text='<%# Eval("Reply_Descr") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" 
                                    SelectCommand="SELECT Registration_Master.User_Photo, Registration_Master.First_Name, Reply_Transaction.Reply_Descr, Reply_Transaction.Reply_Date_Time, Reply_Transaction.Post_Id FROM Reply_Transaction INNER JOIN Registration_Master ON Reply_Transaction.User_Id = Registration_Master.User_Id WHERE (Reply_Transaction.Reply_Status = 'Y') AND (Reply_Transaction.Post_Id = @Pid)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblPid" Name="Pid" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:HyperLink ID="lnkComment" href="javascript:void()" onclick="com_vis(this)" runat="server">Comment</asp:HyperLink>
                                <br />
                                <asp:Panel  ID="Panel1" style="display:none"  runat="server">
                                    <asp:TextBox ID="txtComment" runat="server" Columns="30" Rows="3" 
                                        TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtComment" ErrorMessage="Comment Required" 
                                        SetFocusOnError="True" ValidationGroup='<%# Eval("Post_Id") %>'></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Button ID="btnComment" 
                                        runat="server" Text="Comment" CommandName="Update" 
                                        ValidationGroup='<%# Eval("Post_Id") %>' />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Post_Date_Time" HeaderText="Date Time" 
                            SortExpression="Post_Date_Time" >
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" 
                    
                    
                    
                    SelectCommand="SELECT Registration_Master.First_Name, Post_Master.Post_Description, Post_Master.Post_Date_Time, Post_Master.Post_Id FROM Post_Master INNER JOIN Registration_Master ON Post_Master.User_Id = Registration_Master.User_Id WHERE (Post_Master.Group_Id = @gid) AND (Post_Master.Sub_Group_Id = @subgid) Order By Post_Master.Post_Id Desc" 
                    UpdateCommand="Select * From Post_Master">
                    <SelectParameters>
                        <asp:SessionParameter Name="gid" SessionField="gid" />
                        <asp:SessionParameter Name="subgid" SessionField="subgid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
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

