<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="col-xs-12">
        <div class="container" style="margin-top:50px;">
            <div class="col-md-2">
                <img src="Content/img/EducationEverestLogo.jpg"  />
            </div>
            <div class="col-md-9" style="padding-top:25px;">
                <h3>Something went wrong. We're working on it.</h3>
                <h4><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Go back to Login page</asp:HyperLink></h4>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
