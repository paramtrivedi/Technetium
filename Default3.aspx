<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
   <script type='text/javascript'>

       $(function () {

           var iFrames = $('iframe');

           function iResize() {

               for (var i = 0, j = iFrames.length; i < j; i++) {
                   iFrames[i].style.height = iFrames[i].contentWindow.document.body.offsetHeight + 'px';
               }
           }

           if ($.browser.safari || $.browser.opera) {

               iFrames.load(function () {
                   setTimeout(iResize, 0);
               });

               for (var i = 0, j = iFrames.length; i < j; i++) {
                   var iSource = iFrames[i].src;
                   iFrames[i].src = '';
                   iFrames[i].src = iSource;
               }

           } else {
               iFrames.load(function () {
                   this.style.height = this.contentWindow.document.body.offsetHeight + 'px';
               });
           }

       });

</script>
</head>
<body >
    <form id="form1" runat="server">
    <table>
        
    <tr>
    <td>
       
    <iframe runat="server" class="iframe" id="frme1" frameborder="0" scrolling="no"  ></iframe>
    </td>
    
    </tr>
    <tr>
    <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1"
            runat="server" Text="Button" onclick="Button1_Click"/></td>
    </tr>
    </table>    
    </form>
</body>
</html>
