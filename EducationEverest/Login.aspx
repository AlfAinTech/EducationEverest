<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/File_admission_application.css" />
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/myScript.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
        <script type="text/javascript">
            $(function () {
                var links = $('a.link').click(function () {
                    links.removeClass('active');
                    $(this).addClass('active');
                });
            });
        </script>
    </head>

    <body>


        <form id="form" runat="server">
            <div>
                <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                
                        <a class="navbar-brand" href="#">
                            <img src="images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                <div class="container-fluid text-left">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-3 col-md-3 col-sm-3"></div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left NormalCharacterStyle12" style="margin-top: 50px">Login</div>
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
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ValidationGroup="loginForm" ErrorMessage="The User Name field is required."
                                        ForeColor="Red" Style="text-align: center; margin-top: 20px" />
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc4">
                                <div class="form">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" class="student_reg_inputs col-lg-6 col-md-6 col-sm-6 col-xs-12"
                                        placeholder="Password"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="loginForm" ErrorMessage="The password field is required."
                                        ForeColor="red" Style="text-align: center" />
                                </div>
                            </div>
                            <div class="NormalCharacterStyle213 col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc3">Forgot password?
                                <a href="ForgotPassword.aspx">
                                    <span class="NormalCharacterStyle221">
                                        <i>Reset Password</i>
                                    </span>
                                </a>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc3">
                                <asp:Button class=" btn registration_btn" runat="server" ValidationGroup="loginForm" OnClick="LogIn" Text="LOGIN" />
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc5">
                            </div>

                            <div class="NormalCharacterStyle7 col-lg-12 col-md-12 col-sm-12 col-xs-12 myspc1">Doesn’t Have Account? </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center myspc3">
                                <%--<button type="button" class="btn registration_btn2"><a href="/Account/Register.aspx"><span class="NormalCharacterStyle220">REGISTER</span></a></button>--%>
                                    <asp:Button ID="btn_register" class="btn registration_btn2" runat="server" OnClick="btn_register_Click" Text="Register" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>