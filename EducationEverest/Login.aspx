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

    <!-- Collect the nav links, forms, and other content for toggling -->
    <%--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#" class="NormalCharacterStyle2019" style="top: 6px;">Home </a></li>
        <li><a href="#" class="dashboard_image" style="color: white; font-size : 18px; line-height : 22px;"><div style="margin-top: 5px">Dashboard</div></a></li>
        <li style="color: transparent;">home</li>&nbsp;&nbsp;&nbsp;
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">
        </div>
        <span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>
      </form>
      <%--<ul class="nav navbar-nav navbar-right">
        <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>
        <li class="dropdown" style="height: 60px;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px;margin-right: 10px;border-bottom: 1px solid white;">Login</span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.html" class="myprofile_dropdown_link NormalCharacterStyle25">Profile</a></li>
             <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>
          </ul>
        </li>
      </ul>--%>
   <%-- </div>--%>
    <!-- /.navbar-collapse -->
</div>
<body>


    <form id="form" runat="server">
<%--<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 12px">Dashboard > Login</div>

</div>--%>
<br/>
  
<div class="container-fluid text-left">   
	
	<div class="col-md-12"> 
		<div class="col-md-3"></div>
  <div class="col-md-6">
  <div class="text-left NormalCharacterStyle12" style="margin-top: 50px;margin-left: 15px">Login</div>
      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                   <p class="text-danger" style="font-size:20px;margin-left:100px" >
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
  <br/><br/>

<div class="col-md-12">
    <div class="form">
        <asp:TextBox runat="server" ID="Email" class="student_reg_inputs" data-error="Bruh, that email address is invalid" placeholder="Email"></asp:TextBox>
                    <br /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                         ErrorMessage="The User Name field is required." ForeColor="Red" style="text-align:center;margin-top:20px" />
     <%--<input class="student_reg_inputs" type="text" name="Email" placeholder="Email" >--%>
    </div>
</div>

<br/><br/><br/><br/>
<div class="col-md-12">
    <div class="form">
        <asp:TextBox runat="server" ID="Password" TextMode="Password" class="student_reg_inputs" placeholder="Password"></asp:TextBox>
                    <br /> <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"  ErrorMessage="The password field is required." ForeColor="red" style="text-align:center" />
     <%--<input class="student_reg_inputs" type="text" name="password" placeholder="Password" >--%>
    </div>
</div>
      
<br/><br/>
      
<div class="NormalCharacterStyle213" style="margin-left: 15px;">Forgot password? <a href="ForgotPassword.aspx"><span class="NormalCharacterStyle221"><i>Reset Password</i></span></a></div>

<br/><br/>
      <asp:Button class=" btn registration_btn" runat="server" OnClick="LogIn" Text="LOGIN" /> 
 <%--<button type="button" class=" btn registration_btn"><span class="NormalCharacterStyle">Login</span></button>--%>
<br/><br/>
      </form>
<div class="NormalCharacterStyle7" style="margin-top: 50px;margin-left: 15px; padding-bottom:2%">Doesn’t Have Account? </div>
    <button type="button" class="btn registration_btn2"><a href="/Account/Register.aspx"><span class="NormalCharacterStyle220">REGISTER</span></a></button>

<br/>

<br/><br/><br/>

<div class="NormalCharacterStyle7" style="margin-left: 280px;">OR</div>
<br/>
<div class="NormalCharacterStyle12" style="margin-left: 240px;">SignUp with</div>
<br/>
<div style="margin-left: 230px;"><a href=""><span class="facebook_icon"></span></a><a href=""><span class="google_icon" style="margin-left: 80px;"></span></a></div>
<br/><br/><br/><br/>

  		<div class="col-md-2"></div>

</body>
</html>
