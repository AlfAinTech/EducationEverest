<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="navbar-brand">
            <img src="Content/img/EducationEverestLogo.jpg" alt="EducationEverest" />
        </div>
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">Login</div>
            <div class="card-body">
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
                <div class="form-group">
                    <label for="exampleInputEmail1">User Name</label>
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" data-error="Bruh, that email address is invalid" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The User Name field is required." />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
                <div class="col-xs-6">
                    <div class="row">
                        <div class="form-group">
                            <div class="form-check">
                                <label class="form-check-label" style="padding:0px;">
                                    <input class="form-check-input" runat="server" id="RememberMe" type="checkbox" />
                                    Remember Me</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="row" style="float:right;">
                        <div class="form-group">
                            <div class="form-check">
                                <asp:HyperLink ID="hp_forget_pass" NavigateUrl="~/ForgotPassword.aspx" Style="text-align:right;" runat="server">Forgot Password?</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Button CssClass="btn btn-primary btn-block" runat="server" OnClick="LogIn" Text="Log In" />
                <div class="text-center">
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>


