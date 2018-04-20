<%@ Page Title="Register" Language="C#"  AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <link href="../Content/img/EducationEverestIcon.jpg" rel="shortcut icon" type="image/jpg" />
     <title>Registration</title>
    <meta charset="utf-8" />
    <meta name="google-signin-client_id" content="569202583432-j80c5hsj78tippoqicmfucf8hld4pa2m.apps.googleusercontent.com" />

  <link rel="stylesheet" href="/css/bootstrap.css" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="/css/bootstrap-theme.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/File_admission_application.css" />
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="/js/bootstrap.js"></script>
    <%--<script type="text/javascript" src="/js/myScript.js"></script>--%>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
  <script src="https://apis.google.com/js/platform.js" async defer></script>

    <style type="text/css">
        /* Customize the label (the container) */
        .checkbox-container {
            display: block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Hide the browser's default checkbox */
        .checkbox-container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        /* Create a custom checkbox */
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 23px;
            width: 23px;
            /*background-color: #eee;*/
            border:2px solid rgb(255, 152, 0);
        }

        /* On mouse-over, add a grey background color */
        .checkbox-container:hover input ~ .checkmark {
            background-color: rgba(255, 162, 10, 0.1);
        }

        /* When the checkbox is checked, add a blue background */
        .checkbox-container input:checked ~ .checkmark {
            background-color: rgb(255, 152, 0);
        }

        /* Create the checkmark/indicator (hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the checkmark when checked */
        .checkbox-container input:checked ~ .checkmark:after {
            display: block;
        }

        /* Style the checkmark/indicator */
        .checkbox-container .checkmark:after {
            left: 6px;
            top: 2px;
            width: 7px;
            height: 13px;
            border: solid white;
            border-width: 0 3px 3px 0;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
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
    <div id="fb-root"></div>    
<br/>
  
<div class="container-fluid text-left">   
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="text-left NormalCharacterStyle12">Create Account</div>

                <br />
                <form id="form" runat="server">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Label ID="lblDuplicateID" runat="server" Font-Bold="True" ForeColor="Red" Text="This Email ID is already registered, Please choose different ID" Visible="False"></asp:Label>
                    <br />
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                        <asp:TextBox ID="fName" MaxLength="20" runat="server" class="student_reg_inputs" placeholder="First Name"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="fNameRequired" runat="server" ErrorMessage="First Name is required" ControlToValidate="lName" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reFName" runat="server" ControlToValidate="fName"
                        ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets as First Name " ForeColor="Red" />
                    </div>



                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 30px;">

                        <asp:TextBox ID="lName" MaxLength="20" runat="server" class="student_reg_inputs" placeholder="Last Name"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="lNameRequired" runat="server" ErrorMessage="Last Name is required" ControlToValidate="lName" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />    
                        <asp:RegularExpressionValidator ID="reLName" runat="server" ControlToValidate="lName"
                        ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets as Last Name " ForeColor="Red" />

                    </div>
                    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
                    

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form">
                            <asp:TextBox ID="Email" runat="server" class="student_reg_inputs" placeholder="Email"></asp:TextBox>
                        </div>
                        <br />
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="Email is Required" ControlToValidate="Email" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form">
                            <asp:TextBox ID="password" runat="server" class="student_reg_inputs" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <br />
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ErrorMessage="Password is Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <%--<asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ErrorMessage="Password must be minimum 6 characters long  at least  one upper case and one special character " ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}" ControlToValidate="password" runat="server"></asp:RegularExpressionValidator>--%>

                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form">
                            <asp:TextBox ID="confirmPassword" runat="server" class="student_reg_inputs" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <br />
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ErrorMessage="Confirm is Required" ControlToValidate="confirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmPassword" ErrorMessage="Both passwords must match" ForeColor="Red"></asp:CompareValidator>

                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form">
                            <asp:TextBox ID="phone" MaxLength="15" runat="server" class="student_reg_inputs" placeholder="Phone"></asp:TextBox>

                        </div>
                        <br />
                        <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ErrorMessage="Phone Number is Required" ControlToValidate="phone" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionphone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ControlToValidate="phone" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form">
                            <asp:TextBox ID="city" runat="server" class="student_reg_inputs" placeholder="City"></asp:TextBox>
                        </div>
                        <br />
                        <asp:RequiredFieldValidator ID="CityRequired" runat="server" ErrorMessage="City is Required" ControlToValidate="city" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reCity" runat="server" ControlToValidate="city"
                            ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in City field" ForeColor="Red" />

                    </div>

                    <%--<asp:CheckBox ID="CheckBox1" runat="server"  class="check_box" /><label  class="checkbox-inline NormalCharacterStyle112" style="  margin-left: 10px;"> <span >&nbsp;&nbsp;&nbsp;I agree to the Terms and Conditions</span></label>--%>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="CheckBox1" class="checkbox-inline checkbox-container NormalCharacterStyle112"<%-- style="margin-left: 10px;"--%>>
                            I agree to the <i>Terms and Conditions</i>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblCheckBox" runat="server" ForeColor="Red" Text="I agree to <i>terms and conditions</i>" Visible="False"></asp:Label>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc5">
                        <asp:Button ID="Button1" runat="server" Text="REGISTER" class=" btn registration_btn NormalCharacterStyle" OnClientClick="gettingRegistered()" OnClick="CreateUser_Click" />
                        <span class="NormalCharacterStyle"></span>
                    </div>


                </form>
                <br />
                <br />



                <div class="NormalCharacterStyle7 col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center " >
                    <br />
                    Already have an account?&nbsp;
                    <asp:HyperLink ID="hplSignIn" NavigateUrl="~/Login.aspx" runat="server">Sign in</asp:HyperLink>

                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 NormalCharacterStyle7 text-center" style="padding:15px 0;">OR</div>
               
                <%--<br />
                <div class="NormalCharacterStyle12 text-center">SignUp with</div>--%>
                
                

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                         <%--<fb:login-button scope="public_profile,email" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"  onlogin="checkLoginState();"></fb:login-button>--%>
                        <div class="g-signin2" data-width="350" data-height="50" style="display:inline-block;" data-theme="dark" data-longtitle="true"  data-onsuccess="onSignIn"></div>

                    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc5">
                         <fb:login-button scope="public_profile,email" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"  onlogin="checkLoginState();"></fb:login-button>
                    </div>--%>
                
                
            </div>
            


        </div>

        </div>
    </div>
    </body>

    <script>
        window.onload = load();
        function load() {
           // gapi.auth2.getAuthInstance().signOut();
            logOut();
        }
        window.onbeforeunload = function (e) {
            gapi.auth2.getAuthInstance().signOut();
            logOut();
        };
        //google code
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.


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
                    url: "Register.aspx/loginUsingGP",
                    data: '{"gpfirstname":"' + gpfirstname + '","gplastname":"' + gplastname + '","gpemail":"' + gpemail + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        FB.logout();
                        window.location.replace(window.location.origin + "/Dashboard.aspx");
                        //alert(window.location.origin);
                       
                    },
                    failure: function (response) {
                        alert(response.d);
                    }

                });



            }

        }

        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
            });
        }


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
               
            }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '516503188742935',
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

            FB.getLoginStatus(function (response) {
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
               //document.getElementById('status').innerHTML =
               //  'You are successfully logged in, ' + response.name + '!';

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
                           url: "Register.aspx/loginUsingFB",
                           data: '{"fbfirstname":"' + fbfirstname + '","fblastname":"' + fblastname + '","fbemail":"' + fbemail + '"}',
                           contentType: "application/json; charset=utf-8",
                           dataType: "json",
                           success: function (result) {
                               window.location.replace(window.location.origin + "/Dashboard.aspx");
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
                //document.getElementById("loggedout").innerHTML = "You are logged out of Fabebook";
                // Person is now logged out
            });
        };
        <%--  Logout code ends here --%>
        

       
       
</script>
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
              //signing out google user
              gapi.auth2.getAuthInstance().signOut();
              logOut();
              FB.logout();
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


  
  </script>
  
</html>
