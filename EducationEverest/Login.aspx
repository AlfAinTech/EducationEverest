<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <title>Login</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
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
});
  </script>
</head>
<div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<body>


    <form id="form" runat="server">
<%--<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 12px">Dashboard > Login</div>

</div>--%>
<br/>
  
<div class="container-fluid text-left">   
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
    <div class="col-md-12 text-left NormalCharacterStyle12" style="margin-top: 50px">Login</div>
        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
            <p class="text-danger" style="font-size:18px;margin-left:100px" >
                <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc4">
        <div class="form">
            <asp:TextBox runat="server" ID="Email" class="student_reg_inputs" data-error="Bruh, that email address is invalid" placeholder="Email"></asp:TextBox>
                <br /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="The User Name field is required." ForeColor="Red" style="text-align:center;margin-top:20px" />
        </div>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc4">
        <div class="form">
            <asp:TextBox runat="server" ID="Password" TextMode="Password" class="student_reg_inputs" placeholder="Password"></asp:TextBox>
                <br /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"  ErrorMessage="The password field is required." ForeColor="red" style="text-align:center" />
        </div>
    </div>
    <div class="NormalCharacterStyle213 col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc3">Forgot password? <a href="ForgotPassword.aspx"><span class="NormalCharacterStyle221"><i>Reset Password</i></span></a></div>
      <asp:Button class=" btn registration_btn col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc3" runat="server" OnClick="LogIn" Text="LOGIN" />
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc5">
         
    </div>
    </form>
    <div class="NormalCharacterStyle7 col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc1">Doesn’t Have Account? </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc5">
        <button type="button" class="btn registration_btn2"><a href="/Account/Register.aspx"><span class="NormalCharacterStyle220">REGISTER</span></a></button>
    </div>
    <div class="NormalCharacterStyle7 col-md-12">OR</div>
    <div class="NormalCharacterStyle12 col-md-12">SignUp with</div>
    <div class="col-md-12">
        <div><a href=""><span class="facebook_icon"></span></a><a href=""><span class="google_icon" style="margin-left: 80px;"></span></a></div>
    </div>
    </div>



</body>
</html>
