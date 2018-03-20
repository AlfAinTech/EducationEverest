<%@ Page Title="Register" Language="C#"  AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>
 
<html lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
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
    <%--<script type="text/javascript" src="/js/myScript.js"></script>--%>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script type="text/javascript">
      var isUserGettingRegistered = false;
    $(function() {
   var links = $('a.link').click(function() {
       links.removeClass('active');
       $(this).addClass('active');
   });
    });

    function gettingRegistered() {
         isUserGettingRegistered = true;
    }


    window.onbeforeunload = closingCode;
    function closingCode() {
        // alert("closing");
        if (!isUserGettingRegistered) {
            var email = $("[id*=Email]");
            var emailaddress = email.val();
            localStorage.setItem("Email", emailaddress);
            //incomplete_registration(email.value);
            //var email = Email.Text;
            // Response.Redirect("Register.aspx?emailRegistration=" + Email.Text);
            var emailTemp = localStorage.getItem("Email");
            $.ajax({
                type: "POST",
                url: "Register.aspx/incompleteregistration",
                data: '{"email":"' + emailTemp + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                },
                failure: function (response) {
                    alert(response.d);
                }

            });


        }
    }


     



    
    //window.onbeforeunload = function () {
    //    return "Bye now!";
    //}


     
    ////Maps an event to the window closing event
    //window.onbeforeunload = function (e) {
    //    alert("The Window is closing!");
    //};



    //$(window).on("beforeunload", function () {
    //    return confirm("Do you really want to close?");
    //})
   



    //window.onbeforeunload = check;
    //function check() {
    //    return "Are you sure you want to exit this page?";
    //    //or put whatever function you need to call when a user closes the web //browser.
    //}
  </script>
</head>
    <div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="/images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>





<%--<div class="navbar-inverse" style="border-radius: 0px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="/images/Logo_1_.png"></a>
    </div>--%>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <%--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#" style="font-size: 20px;top: 6px;">Home </a></li>
        <li><a href="#"><img src="/images/header_dashboard_button_1_.png" style="margin: -15px;height: 65px"></a></li>
        <li style="color: transparent;">home</li>
      </ul>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">
        </div>
        <span><a href=""><img src="/images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="/images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>--%>
     <%-- <ul class="nav navbar-nav navbar-right">
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
      </ul>--%>
    <%--</div>--%>
    <!-- /.navbar-collapse -->
</div>
<body>





    <%--fb login code starts here--%>
    <div id="fb-root"></div>
    

<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11&appId=516503188742935&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



   <script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = ' ' +
        '';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
        appId: '{516503188742935}',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.11' // use graph api version 2.8
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me?fields=id,name,email,first_name,last_name', function (response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'You are successfully logged in, ' + response.name + "<br>"+  ' ! and your Emaild is: '
        + response.email + "<br>"+ ' first name is:  ' + response.first_name + "<br>"+ ' last name is:  ' + response.last_name + '!';


      console.log(response);



    });
  }
</script>

    <%--Logout Code starte here
    <script>
        var logOut = function () {
            FB.logout(function (response) {
                document.getElementById("loggedout").innerHTML = "You are logged out of Fabebook";
                // Person is now logged out
            });
        };
    </script>
    <p id="loggedout"></p>
    Logout code ends here --%>

    
    <%--<button onclick="logOut()">Log Out of Facebook</button>--%>

   <%-- fb login code ends here--%>
    






<%--<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 15px">Dashboard &gt; Registration</div>

</div>--%>
<br/>
  
<div class="container-fluid text-left">   
	
	<div class="col-md-12"> 
        <div class="col-md-3"></div>
       <div class="col-md-6" style="height: 1135px;">
  <div class="text-center NormalCharacterStyle12">Create Account</div>

  <br/>
 <form id="form" runat="server">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Label ID="lblDuplicateID" runat="server" Font-Bold="True" ForeColor="Red" Text="This Email ID is already registered, Please choose different ID" Visible="False"></asp:Label>
     <br/>
<div class="col-md-6">
   
        <asp:TextBox ID="fName" MaxLength="20" runat="server" class="student_reg_inputs" placeholder="First Name"></asp:TextBox>
        <br />     <asp:RequiredFieldValidator ID="fNameRequired" runat="server" ErrorMessage="First Name is required" ControlToValidate="lName" ForeColor="Red"></asp:RequiredFieldValidator>

</div>
   


<div class="col-md-6">
   
        <asp:TextBox ID="lName" MaxLength="20" runat="server" class="student_reg_inputs"   placeholder="Last Name" ></asp:TextBox>
      <br />   <asp:RequiredFieldValidator ID="lNameRequired" runat="server" ErrorMessage="Last Name is required" ControlToValidate="lName" ForeColor="Red" ></asp:RequiredFieldValidator>

   
</div>
     
     
     <br /> <br />  <asp:RegularExpressionValidator ID="reFName" runat="server" ControlToValidate="fName" 
    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets as First Name "  ForeColor="Red"/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:RegularExpressionValidator ID="reLName" runat="server" ControlToValidate="lName" 
    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets as Last Name "  ForeColor="Red"/>



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
       <br /> <asp:regularexpressionvalidator display="Dynamic" id="RegularExpressionValidator1"  errormessage="Password must be minimum 6 characters long  at least  one upper case and one special character " forecolor="Red" validationexpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}" controltovalidate="password" runat="server"></asp:regularexpressionvalidator>

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
        <asp:TextBox ID="phone" MaxLength="15" runat="server" class="student_reg_inputs"  placeholder="Phone" ></asp:TextBox>
        
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
    <br />  <asp:RegularExpressionValidator ID="reCity" runat="server" ControlToValidate="city" 
    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in City field"  ForeColor="Red"/>

</div>

<br/><br/><br/><br/>
     
<%--<asp:CheckBox ID="CheckBox1" runat="server"  class="check_box" /><label  class="checkbox-inline NormalCharacterStyle112" style="  margin-left: 10px;"> <span >&nbsp;&nbsp;&nbsp;I agree to the Terms and Conditions</span></label>--%>
 <div class ="col-md-12">
     <asp:CheckBox ID="CheckBox1" runat="server"  style="height:100px; width:100px" /><label  class="checkbox-inline NormalCharacterStyle112" style="  margin-left: 10px;"> <span >&nbsp;&nbsp;&nbsp;I agree to the Terms and Conditions</span></label>
 </div>
     <div class="col-md-12">
         <asp:Label ID="lblCheckBox" runat="server" ForeColor="Red" Text="I agree to <i>terms and conditions</i>" Visible="False"></asp:Label>
     </div>
    


<br/><br/>
     
     <br/><br/>

      <div class="col-md-12">
          <asp:Button ID="Button1" runat="server" Text="Register" class=" btn registration_btn NormalCharacterStyle" OnClientClick="gettingRegistered()"   OnClick="CreateUser_Click" /> <span class="NormalCharacterStyle"></span> 
      </div>


 </form>
<br/><br/>



     <div class="NormalCharacterStyle7 col-md-12" style="margin-left:150px"><br/> Already have an account?&nbsp; <asp:HyperLink ID="hplSignIn" NavigateUrl="~/Login.aspx" runat="server">Sign in</asp:HyperLink>

     </div>
<br/>
      
 <%--<button type="button" class=" btn register_button_bg" ><a href="/Account/Register.aspx"><span class="NormalCharacterStyle220">Sign in</span></a></button>--%>
<br/><br/><br/>
           


<div class="NormalCharacterStyle7" style="margin-left: 280px;">OR</div>
<br/>
<div class="NormalCharacterStyle12" style="margin-left: 240px;">SignUp with</div>
<br/>
<div style="margin-left: 230px;"><a href=""> <fb:login-button scope="public_profile,email" style="background-repeat:no-repeat;position:absolute; padding-top:15px"   onlogin="checkLoginState();">
</fb:login-button></a><a href=""><span class="google_icon" style="margin-left: 80px;"></span></a></div>
<br/><br/><br/><br/>
           </div>
   <%--   fb login link starts here--%>
      

    
    </body>
</html>
