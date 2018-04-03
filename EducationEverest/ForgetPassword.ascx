<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.ascx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html>

<head>
    <title>Forgot Password</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
    <%--<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script type="text/javascript">
    $(function() {
   var links = $('a.link').click(function() {
       links.removeClass('active');
       $(this).addClass('active');
   });
});</script>--%>
</head>
<div class="navbar-inverse" style="border-radius: 0px; height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="margin-top: -30px">

        <a class="navbar-brand" href="#">
            <img src="images/Logo_1_.png"></a>
    </div>
</div>


<div class="container" style="font-family: 'Raleway', sans-serif;">

    <div class="navbar-brand">
        <%-- <img src="Content/img/EducationEverestLogo.jpg" alt="Eduaction Everest" />--%>
    </div>
    <div class="card card-login2 mx-auto mt-5" style="border: none;">
        <div class="card-header" style="text-align: center; font-weight: 600">Forgot Password</div>
        <div class="card-body">
            <asp:PlaceHolder runat="server" ID="status" Visible="false">
                <p class="text-danger">
                    <asp:Label runat="server" ID="status_text" />
                </p>
            </asp:PlaceHolder>
            <asp:Panel ID="forget_panel" runat="server">
                <div class="row" style="padding-left: 20px; padding-right: 20px;">
                    <p>Enter your email address that you used for registration. We shall send you a password reset link to help you login</p>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="Enter Your Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The Email field is required." ID="validator_Email" />
                    </div>
                </div>
                <div class="row" style="margin-top: 30px;">
                    <div class="col-md-12 text-center">
                        <asp:Button runat="server" OnClick="send_Click" Text="Send Email" CssClass="btn registration_btn" ID="send_btn" />
                        <%--<button class="btn btn-default">Reset Password Now</button>--%>
                    </div>
                    
                </div>

            </asp:Panel>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc3">
                        <%--<button type="button" class="btn registration_btn2"><a href="/Account/Register.aspx"><span class="NormalCharacterStyle220">REGISTER</span></a></button>--%>
                        <asp:Button ID="Button1" class="btn registration_btn2" runat="server" OnClick="btn_register_Click" Text="LOGIN" Style="font-size: 16px;" />
                    </div>
                </div>
        </div>
    </div>
</div>
