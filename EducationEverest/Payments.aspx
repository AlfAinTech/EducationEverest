<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Payments.aspx.cs" Inherits="Payments" %>
<%@ Register Src="~/UserControls/PaymentTiles.ascx" TagPrefix="uc1" TagName="PaymentTiles" %>
<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px"><a class="breadcrumbLinks" href="Dashboard.aspx">Dashboard </a> > <a class="breadcrumbLinks" href="Personal_Detail.aspx">File Admission Application </a> > <a class="breadcrumbLinks" href="Payments.aspx">Payments</a></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-left">
        <h3 class="NormalCharacterStyle12">Payments</h3>

        <div class="panel panel-default panel_shadow">
            <a id="menu_togglePersonalDoc" class="menu_toggles" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 50px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10">
                            Application Invoice<div class="icon-arrow-right pull-right">
                                <div class="check-"></div>
                                <i class="glyphicon glyphicon-chevron-up normal-color"></i>
                            </div>
                        </div>
                    </h4>
                </div>
            </a>
            <div id="collapse2" class="panel-collapse panel-heading collapse">
                <div class="panel-body">

                    <uc1:PaymentTiles runat="server" ID="PaymentTiles" />
                   
                </div>
            </div>
        </div>

        
        
</asp:Content>

