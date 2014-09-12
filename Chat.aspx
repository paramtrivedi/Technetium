<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chat</title>
</head>
<body>
    <form id="form1" runat="server">

    <table height=350px width=200px border=0>
        <tr>
            <td>
                <asp:Label ID="lblUser" runat="server"></asp:Label><asp:Label ID="lbluid" runat="server"
                    Text="" Visible=false></asp:Label>
            </td>
        </tr>
        <tr>
            <td align=left valign=top height=280px>
                <asp:Panel ID="Panel1" runat="server" ScrollBars=Both Height=280px style="vertical-align:top">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" height=280px>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td rowspan="2" width="30" valign=top>
                                        <asp:Image ID="Image1" runat="server" Height="30px" 
                                            ImageUrl='<%# Eval("User_Img") %>' Width="30px" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_Name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TechnetiumConnectionString1 %>" 
    
                        
                        SelectCommand="SELECT Chat.User_Img, Chat_Message.Message, Chat.User_Name, Chat_Message.User_Id, Chat_Message.R_User_Id FROM Chat_Message INNER JOIN Chat ON Chat_Message.User_Id = Chat.User_Id WHERE (Chat_Message.User_Id = @uid or Chat_Message.User_Id = @ruid) And (Chat_Message.R_User_Id = @ruid or Chat_Message.R_User_Id = @uid) Order By Chat_Message.M_Date_Time">
                        <SelectParameters>
                            <asp:SessionParameter Name="uid" SessionField="uid" />
                            <asp:ControlParameter ControlID="lbluid" Name="ruid" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td><asp:TextBox ID="txtMessage" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        </table>

    </form>
</body>
</html>
