﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="875124232522-klqbuoi3qvr7ibiv42h0ajde0eonbgju.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://apis.google.com/js/api:client.js"></script>

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <%--google  button design ends here--%>
    <script type="text/javascript">
        $(function () {
            var links = $('a.link').click(function () {
                links.removeClass('active');
                $(this).addClass('active');
            });
        });

        function myFunction() {
            var fb_button = document.getElementById("btn_fb");
            fb_button.click();
        }
    </script>
</head>
<body>
    
    <form id="form" runat="server">
        <div>
            <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">

                    <a class="navbar-brand" href="#">
                        <img src="images/Logo_1_.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
    <div class="row">
                
        <div class="container-fluid text-left">
            <div class="alert text-center" id="div_Alert" runat="server" role="alert" style="visibility:hidden;margin-top: 50px; background-color: #f01970 !important; padding-bottom: 7px;padding-top: 7px;">
                        <span class="glyphicon glyphicon-warning-sign" aria-hidden="true" style="color: white; font-size: 14px"></span>
                        <span class="sr-only" style="color: white; font-size: 14px">Error:</span>
                        <span style="color: white; font-size: 16px">Wrong Email or Passowrd. Please provide valid ID details.</span>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-3 col-md-3 col-sm-3"></div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left NormalCharacterStyle12 mybspc4" style="margin-top: 20px">Login</div>
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger" style="font-size: 18px; margin-left: 100px">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc4">
                                <div class="form">
                                    <asp:TextBox runat="server" ID="Email" class="student_reg_inputs col-lg-6 col-md-6 col-sm-6 col-xs-12" data-error="Bruh, that email address is invalid"
                                        placeholder="Email"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ValidationGroup="loginForm" ErrorMessage="The User Name field is required."
                                        ForeColor="Red" Style="text-align: center; margin-top: 20px" />
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" class="student_reg_inputs col-lg-6 col-md-6 col-sm-6 col-xs-12"
                                        placeholder="Password"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="loginForm" ErrorMessage="The password field is required."
                                        ForeColor="red" Style="text-align: center" />
                                </div>
                            </div>
                    <div class="NormalCharacterStyle213 col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc3">
                                Forgot password?
                                <a href="ForgotPassword.aspx">
                                    <span class="NormalCharacterStyle221">
                                        <i>Reset Password</i>
                                    </span>
                                </a>
                            </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc3">
                                <asp:Button class=" btn registration_btn" runat="server" ValidationGroup="loginForm" OnClick="LogIn" Text="LOGIN" Style="font-size: 16px;" />
                            </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc3">
                            </div>

                    <div class="NormalCharacterStyle7 col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc1" style="font-size: 16px !important;">
                                Doesn’t Have Account?
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc3">
                                <%--<button type="button" class="btn registration_btn2"><a href="/Account/Register.aspx"><span class="NormalCharacterStyle220">REGISTER</span></a></button>--%>
                                <asp:Button ID="btn_register" class="btn registration_btn2" runat="server" OnClick="btn_register_Click" Text="REGISTER" Style="font-size: 16px;" />
                            </div>
    
                            <%--<div class="NormalCharacterStyle7 col-lg-12 col-md-12 col-sm-12 col-xs-12">OR</div>
                             <div class="NormalCharacterStyle12 col-lg-12 col-md-12 col-sm-12 col-xs-12 ">SignUp with</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

     <%--<div id="fb-root"></div>
    <a > <fb:login-button id="btn_fb"  scope="public_profile,email" data-width="350" data-max-rows="1" data-size="large" data-button-type="login_with"  style="background-repeat:no-repeat;position:absolute; padding-top:15px; "   onlogin="checkLoginState();"></fb:login-button></a>
    <br /> <br /> <br /> <br />


 <div id="my-signin2"></div>
 <div id="status" style="display:none">
 <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>

</div>
       
    <br/><br/><br/><br/>
          
        <div class="col-md-3"></div>
      

  
    
<br/>
     <button onclick="logOut()">Log Out of Facebook</button>

    <a href="#" onclick="signOut();">Sign out</a>--%>

     <script>
    function onSuccess(googleUser) {
        console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
       // onSignIn(googleUser);
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 350,
        'height': 30,
        'longtitle': true,
        'theme': 'light',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>

  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11&appId=516503188742935&autoLogAppEvents=1';
    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

</script>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
    <script>
        
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        //console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        

          //when user clicks on google plus login code starts here
          //alert("fb logged in user");
        //var email = response.email;

        var gpemail = profile.U3;//email ID
        var gpfullname = profile.ig;//full name
        var gpfirstname = profile.ofa; //first name
        var gplastname = profile.wea;//last name
        gploginclicked(gpfirstname, gplastname, gpemail);
          //var fbname = $("[name");

          //var fbname = document.getElementById('email').innerHTML;


        function gploginclicked(gpfirstname, gplastname, gpemail) {
            // alert("closing");

            //var id = $("[id*=id]");
            //var emailaddress = email.val();
            //localStorage.setItem("Email", emailaddress);

            //var emailTemp = localStorage.getItem("Email");

            $.ajax({
                type: "POST",
                url: "Login.aspx/loginUsingGP",
                data: '{"gpfirstname":"' + gpfirstname + '","gplastname":"' + gplastname + '","gpemail":"' + gpemail + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                   //window.location.href = "Dashboard.aspx";
                },
                failure: function (response) {
                    alert(response.d);
                }

            });



        }
          // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

          //when user click on google plus login code ends here




      };
    </script>
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
               document.getElementById('status').innerHTML = 'Please log ' +
                 'into this app.';
           }
       }

       // This function is called when someone finishes with the Login
       // Button.  See the onlogin handler attached to it in the sample
       // code below.
       function checkLoginState() {
           FB.login(function (response) {
               statusChangeCallback(response);
           });
       }

       window.fbAsyncInit = function () {
           FB.init({
               appId: '{516503188742935}',
               cookie: true,  // enable cookies to allow the server to access 
               // the session
               xfbml: true,  // parse social plugins on this page
               version: 'v2.11' // use graph api version 2.8
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

           FB.login(function (response) {
               statusChangeCallback(response);
           });

       };

       // Load the SDK asynchronously
       (function (d, s, id) {
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
           FB.api('/me?fields=id,name,first_name,last_name,email', function (response) {
               
               console.log('Successful login for: ' + response.name);
               document.getElementById('status').innerHTML =
                 'You are successfully logged in, ' + response.name + '!';

               console.log(response);
               //when user clicks on fb login code starts here
               //alert("fb logged in user");
               var fbemail = response.email;
               
               //var fbname = response.name;
               var fbfirstname = response.first_name;
               var fblastname = response.last_name;
               fbloginclicked(fbfirstname,fblastname, fbemail);
               //var fbname = $("[name");
             
               //var fbname = document.getElementById('email').innerHTML;
              
              
               function fbloginclicked(fbfirstname,fblastname, fbemail) {
                   // alert("closing");
                   
                       //var id = $("[id*=id]");
                       //var emailaddress = email.val();
                       //localStorage.setItem("Email", emailaddress);
                       
                   //var emailTemp = localStorage.getItem("Email");

                       $.ajax({
                           type: "POST",
                           url: "Login.aspx/loginUsingFB",
                           data: '{"fbfirstname":"' + fbfirstname + '","fblastname":"' + fblastname + '","fbemail":"' + fbemail + '"}',
                           contentType: "application/json; charset=utf-8",
                           dataType: "json",
                           success: function (result) {
                              // window.location.href = "Dashboard.aspx";

                           },
                           failure: function (response) {
                               alert(response.d);
                           }

                       });


                   
               }
               //when user click on fb login code ends here
             

           });
       }
        <%--Logout Code starte here--%>
   
        var logOut = function () {
            FB.logout(function (response) {
                document.getElementById("loggedout").innerHTML = "You are logged out of Fabebook";
                // Person is now logged out
            });
        };
  
   
       <%--  Logout code ends here --%>



       
</script>
</body>
</html>
