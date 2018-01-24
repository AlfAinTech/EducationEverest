<%@ Page Title="Register" Language="C#"  AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <title>Registration</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="/css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/File_admission_application.css">
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script type="text/javascript">
    $(function() {
   var links = $('a.link').click(function() {
       links.removeClass('active');
       $(this).addClass('active');
   });
});

  </script>
     <style type="text/css">
         #form {
             width: 714px;
             margin-right: 0px;
         }
     </style>
</head>
<div class="navbar-inverse" style="border-radius: 0px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="/images/Logo_1_.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#" style="font-size: 20px;top: 6px;">Homee </a></li>
        <li><a href="#"><img src="/images/header_dashboard_button_1_.png" style="margin: -15px;height: 65px"></a></li>
        <li style="color: transparent;">homee</li>
      </ul>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">
        </div>
        <span><a href=""><img src="/images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="/images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><img src="/images/header_notification_icon_1_.png"></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="/images/Guest_Image.png">&nbsp;<img src="/images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.html" class="myprofile_dropdown_link NormalCharacterStyle24">Profilee</a></li>
             <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle24">Settingss</a></li>
            <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle24">Log Outt</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
</div>
<body>

    

<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 15px">Dashboard &gt; Registration</div>

</div>
<br/>
  
<div class="container-fluid text-left">   
	
	<div class="col-md-12"> 
		<div class="col-md-2"></div>
  <div class="col-md-8" style="margin-left: 320px; height: 1135px;">
  <div class="text-left NormalCharacterStyle12" style="margin-top: 50px;margin-left: 15px">Create Account</div>

  <br/><br/>
 <form id="form" runat="server">
<div class="col-md-4">
   
        <asp:TextBox ID="fName" runat="server" class="student_reg_inputs" placeholder="First Name" style="width: 213px; top: 2px; left: 15px;"></asp:TextBox>
</div>
   


<div class="col-md-4">
   
        <asp:TextBox ID="lName" runat="server" class="student_reg_inputs"   placeholder="Last Name" style="width: 212px; top: 2px; left: 15px;"></asp:TextBox>
   
</div>
     <br />
     <br />
     &nbsp;&nbsp;&nbsp;    <asp:RequiredFieldValidator ID="fNameRequired" runat="server" ErrorMessage="First Name is required" ControlToValidate="lName" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

     <asp:RequiredFieldValidator ID="lNameRequired" runat="server" ErrorMessage="Last Name is required" ControlToValidate="lName" ForeColor="Red" ></asp:RequiredFieldValidator>

<br/><br/>
<div class="col-md-12">
    <div class="form">
        <asp:TextBox ID="Email" runat="server" class="student_reg_inputs" placeholder="Email"></asp:TextBox>
    </div>
    <br />
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="Email is Required" ControlToValidate="Email" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

</div>

<br/><br/><br/><br/>
<div class="col-md-12">
    <div class="form">
        <asp:TextBox ID="password" runat="server" class="student_reg_inputs" placeholder="Password" TextMode="Password"></asp:TextBox>
    </div>
    <br />
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ErrorMessage="Password is Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:regularexpressionvalidator display="Dynamic" id="RegularExpressionValidator1"  errormessage="Password must be minimum 6 characters long  at least  one upper case and one special character " forecolor="Red" validationexpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}" controltovalidate="password" runat="server"></asp:regularexpressionvalidator>

</div>

<br/><br/><br/><br/>
<div class="col-md-12">
    <div class="form">
        <asp:TextBox ID="confirmPassword" runat="server" class="student_reg_inputs" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
    </div>
    <br />
            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ErrorMessage="Confirm is Required" ControlToValidate="confirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmPassword" ErrorMessage="Both passwords must match" ForeColor="Red"></asp:CompareValidator>

</div>

<br/><br/><br/><br/>
<div class="col-md-12">
    <div class="form">
        <asp:TextBox ID="phone" runat="server" class="student_reg_inputs"  placeholder="Phone" ></asp:TextBox>
        
    </div>
    <br />
            <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ErrorMessage="Phone Number is Required" ControlToValidate="phone" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionphone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ControlToValidate="phone" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>
</div>

<br/><br/><br/><br/>
<div class="col-md-12">
    <div class="form">
        <asp:TextBox ID="city" runat="server" class="student_reg_inputs"  placeholder="City"></asp:TextBox>
    </div>
    <br />
            <asp:RequiredFieldValidator ID="CityRequired" runat="server" ErrorMessage="City is Required" ControlToValidate="city" ForeColor="Red"></asp:RequiredFieldValidator>

</div>

<br/><br/><br/><br/>
     
<asp:CheckBox ID="CheckBox1" runat="server" class="check_box"/><label  class="checkbox-inline NormalCharacterStyle112" style="  margin-left: 10px;"> <span >&nbsp;&nbsp;&nbsp;I agree to the Terms and Conditions</span></label>
     


<br/><br/>
     <asp:Label ID="lblCheckBox" runat="server" ForeColor="Red" Text="You must agree our terms and conditions" Visible="False"></asp:Label>
     <br/><br/>

      <asp:Button ID="Button1" runat="server" Text="Register" class=" btn registration_btn NormalCharacterStyle"   OnClick="CreateUser_Click" /> <span class="NormalCharacterStyle"></span> 


 </form>
<br/><br/><br/>
     
<div class="NormalCharacterStyle7" style="margin-left: 280px;">OR</div>
<br/>
<div class="NormalCharacterStyle12" style="margin-left: 240px;">SignUp with</div>
<br/>
<div style="margin-left: 230px;"><a href=""><span class="facebook_icon"></span></a><a href=""><span class="google_icon" style="margin-left: 80px;"></span></a></div>
<br/><br/><br/><br/>
</div>	
  		<div class="col-md-2"></div>
  </div>

</div>

    <p>
        &nbsp;</p>
    
    </body>
</html>