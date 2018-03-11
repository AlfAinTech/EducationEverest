<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS_Activation.aspx.cs" Inherits="CS_Activation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
  <link rel="stylesheet" href="/css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/File_admission_application.css">
    <style type="text/css">
         #form {
             width: 714px;
             margin-right: 0px;
         }
     </style>
</head>
    <div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="/images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<body>
    <form id="form1" runat="server">
    <h1 style="text-align: center; color: #009933"><asp:Literal ID="ltMessage" runat="server" /></h1>
        <p style="text-align: center">
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Larger" NavigateUrl="~/Login.aspx">Click here to login</asp:HyperLink>
        </p>
    </form>
</body>
</html>
