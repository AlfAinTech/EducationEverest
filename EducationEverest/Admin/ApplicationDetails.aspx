<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="ApplicationDetails.aspx.cs" Inherits="Admin_ApplicationDetails" %>
<%@ Register Src="~/UserControls/ApplicationDetails.ascx" TagPrefix="uc1" TagName="ApplicationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Navigation-->
    <script src="Content/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
    </script>
    <div class="container" style="margin-top: 100px;">
        
                    <div class="row">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <asp:HyperLink runat="server" ID="admin_login" ClientIDMode="Static" NavigateUrl="Applications.aspx">Back</asp:HyperLink>
                    </li>
                </ol>
            </div>
            
        <uc1:ApplicationDetails runat="server" ID="ApplicationDetails"  />
               
        

    </div>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#admin_login">
        <i class="fa fa-angle-up"></i>
    </a>
   
    
</asp:Content>



