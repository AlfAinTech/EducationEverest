<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" href="css/File_admission_application.css">
    <link href="~/Content/img/EducationEverestIcon.jpg" rel="shortcut icon" type="image/jpg" />
    <title>EducationEverest</title>
    <!-- Bootstrap core CSS-->
    <link href="Content/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="Content/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template-->
    <link href="Content/css/sb-admin.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/css/bootstrap-select.min.css" />
    <link href="Content/css/live-search-bootstrap.min.css" rel="stylesheet" />
     <script src="Content/vendor/jquery/jquery.min.js"></script>
    <script src="Content/vendor/popper/popper.min.js"></script>
    <script src="Content/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="Content/vendor/jquery-easing/jquery.easing.min.js"></script>
    <style>
        .navbar-brand {
            display: block;
            text-align: center;
            margin: 30px auto 0;
        }

        .special {
            font-weight: bold !important;
            color: #fff !important;
            background: #bc0000 !important;
            text-transform: uppercase;
        }

        .overlay {
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(255, 255, 255, 0.5);
            position: absolute;
            z-index: 1000000;
            padding: 40%;
            padding-top: 30%;
        }
    </style>
<%--<!DOCTYPE html>

<head>
     <title>Password Reset</title>
  <meta charset="utf-8" /><link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
    <link href="Content/css/sb-admin.css" rel="stylesheet" />
    <link href="Content/css/live-search-bootstrap.min.css" rel="stylesheet" />
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
<div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="margin-top:-30px">
      
      <a class="navbar-brand" href="#"><img src="images/Logo_1_.png"></a>
    </div>
    </div>



    <form id="form1" runat="server"  >
    <div>
    
       <%-- set password code stars here--%>
       <div class="container">

    <%--<div class="navbar-brand">
        <img src="Content/img/EducationEverestLogo.jpg" alt="Eduaction Everest" />
    </div>--%>
    <div class="card card-login2 mx-auto mt-5" style="max-width:25rem">
        <div class="card-header" style="text-align:center">Password Reset</div>
        <div class="card-body">
            <asp:PlaceHolder runat="server" ID="status" Visible="false">
                <p class="text-danger">
                    <asp:Label runat="server" ID="status_text" />
                </p>
            </asp:PlaceHolder>
            <asp:Panel ID="forget_panel" runat="server">
                <div class="row" style="padding-left: 20px; padding-right: 20px;">
                    <p>
                        <asp:Label ID="lblFailure" runat="server" Font-Bold="True" ForeColor="Red" Text="Failed to reset password!" Visible="False"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="lblSuccess" runat="server" Font-Bold="True" ForeColor="green" Text="Password Reset Successfully!" Visible="False"></asp:Label>
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Enter Your New Password" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                            CssClass="text-danger" ErrorMessage="New Password field is required." ID="validator_Password" />
                               <br /><span style="font-size:12px"> <asp:regularexpressionvalidator display="Dynamic" id="rePassword"   errormessage="Password must be minimum 6 characters long  at least  one upper case and one special character " forecolor="Red" validationexpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}" controltovalidate="txtPassword" runat="server"></asp:regularexpressionvalidator></span>

                        <br />
                        <br />
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Your New Password" TextMode="Password" />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                            CssClass="text-danger" ErrorMessage="Confirm Password field is required." ID="Validator_ConfirmPassword" />
                          <br />  <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Both passwords must match" ForeColor="Red"></asp:CompareValidator>

                    </div>
                </div>
                <div class="row" style="margin-top: 30px; margin-bottom: 40px;">
                    <div class="col-md-12">
                        <asp:Button runat="server" OnClick="SetPassword_Click" Text="Reset Password Now" CssClass="btn registration_btn" ID="send_btn" />
                        <%--<button class="btn btn-default">Reset Password Now</button>--%>
                    </div>
                </div>

            </asp:Panel>
        </div>
    </div>
</div>
        <%--set password code ends here--%>



    </div>
    </form>


