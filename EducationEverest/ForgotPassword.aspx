<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<%@ Register Src="~/ForgetPassword.ascx" TagPrefix="uc1" TagName="ForgetPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ForgetPassword runat="server" ID="ForgetPassword" />
</asp:Content>
