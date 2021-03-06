﻿<%@ Page Language="C#" MasterPageFile="Admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Applications.aspx.cs" Inherits="Applications" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Navigation-->
     <%--<script src="https://code.jquery.com/jquery.js"></script>--%>
    <script src="Content/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(window).on('load', (function () {
            $(".overlay").fadeOut(1000);
        }));
        jQuery(document).ready(function ($) {
            $(document).on('click', '[id*=LinkButton1]', function () {
                
                    $('.overlay').css("display", "block");
                
            });
            $('#ddl_current_status').change(function () {
                
                    $('.overlay').css("display", "block");
                
            });
            $('#ddl_current_status').change(function () {

                $('.overlay').css("display", "block");

            });
        });
//        $(function () {
//            $("#btn_view").click(function () {
//                window.open('http://www.google.com', "NewWindow");
//            });
//});
        function fading(){
            $(".overlay").fadeOut(1000);
}
        
        function ConfirmDeletion() {
            alert("are you sure?");
        }
        
        function Confirm() {
            $('#exampleModalCenter').modal('show');
           // return true;
        };
        

    </script>
    
    <div class="container" style="margin-top: 100px;">
        <div class="container-fluid">
            <div class="overlay">
                <img src="Content/img/contact_loading.gif" />
            </div>
            <span style="float:right"><asp:Button ID="btnSendEmail" CssClass="btn btn-primary form-control" runat="server" Text="Send Email to Incomplete Applicants" Font-Size="Small"  OnClick="btnSendEmail_Click" Width="350px"  /></span>
            <div class="row">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <asp:HyperLink runat="server" ID="admin_login" ClientIDMode="Static" NavigateUrl="Applications.aspx">Home</asp:HyperLink>
                    </li>
                </ol>
            </div>
            <div class="row">

                <!-- Start Search Panel-->
                <div class="card mb-3 col-md-12">
                    <div class="row">
                        <div class="card-header" style="width: 100%;">
                            <i class="fa fa-search" style="margin-right: 10px;"></i>Search
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">


                            <!-- Start Search-->
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">ApplicationID</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="tb_ApplicationID"  placeholder="Please enter Application ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">CandidateID</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control"  ID="tb_CandidateId" placeholder="Candidate ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                            <label class="col-xs-3 control-label">University</label>
                                            <%--<div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="tb_Region" placeholder="Region"></asp:TextBox>
                                            </div>--%>
                                                <asp:DropDownList runat="server" ID="ddl_University" CssClass="form-control">

                                                </asp:DropDownList>
                                                </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-xs-3 control-label">Current Status</label>
                                                <asp:DropDownList ID="ddl_current_status" CssClass="form-control" runat="server">
                                                    <asp:ListItem Text="Select Status"></asp:ListItem>
                                                    <asp:ListItem Text="Received" Value="Received"></asp:ListItem>
                                                    <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                                                    <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                    <asp:ListItem Text="Dispatched" Value="Dispatched"></asp:ListItem>
                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="row" style="margin-top: 25px;">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">TrackingID</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control"  ID="tb_TrackingID" placeholder="Tracking Id"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="meeting">Start Date : </label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tb_startDate" TextMode="Date" placeholder="Please select startdate"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="meeting">End Date : </label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tb_EndDate" TextMode="Date" placeholder="Please select enddate"></asp:TextBox>
                                    </div>

                                    <div class="col-md-3">
                                        
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-xs-3 control-label">&nbsp;
                                                </label>
                                                &nbsp;<asp:Button CssClass="btn btn-primary form-control" ID="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!--<button class="btn btn-search" type="button"><i class="fa fa-search fa-fw"></i> Search</button>-->
                            </div>
                            <!-- End Search-->
                        </div>
                        <div class="row">
                            <div class="col-md-10" style="padding: 0; padding-top: 5px;">
                                <ul class="tags">
                                    <asp:Panel ID="panel1" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton ID="btn1" CssClass="tag" data-role="tagsinput" runat="server" CommandArgument="1" OnClick="delete_filter">Application ID</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel2" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton ID="btn2" runat="server" CssClass="tag" CommandArgument="2" OnClick="delete_filter">Candidate ID</asp:LinkButton></li>
                                    </asp:Panel>

                                    <asp:Panel ID="panel3" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn3" CssClass="tag" CommandArgument="3" OnClick="delete_filter">University</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel4" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn4" CssClass="tag" CommandArgument="4" OnClick="delete_filter">Start Date</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel5" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn5" CssClass="tag" CommandArgument="5" OnClick="delete_filter">End Date</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel6" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn6" CssClass="tag" CommandArgument="6" OnClick="delete_filter">Current Status</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel7" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn7" CssClass="tag" CommandArgument="7" OnClick="delete_filter">Tracking Id</asp:LinkButton></li>
                                    </asp:Panel>

                                </ul>
                            </div>
                            <div class="col-md-2">
                                <asp:Button Text="Reset" CssClass="btn btn-dark form-control" Visible="false" ID="btn_reset" runat="server" OnClick="btn_reset_Click" />
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!-- End Search Panel-->

        <!-- Example DataTables Card-->
        <asp:Panel ID="panel_active" runat="server">
            <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <%--<div class="overlay">
                        <img src="../../Content/img/contact_loading.gif" />
                    </div>--%>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="card mb-3">

                        <div class="card-header">
                            <div class="col-md-3" style="float: left;">
                                <i class="fa fa-table" style="margin-right: 10px;"></i>Received Applications
                            </div>

                            <div class="col-md-3" style="float: left;">
                                
                                    <%--asp:LinkButton ID="export_excel" OnClick="export_excel_Click" runat="server"> <i class="fa fa-file-excel-o" aria-hidden="true"></i> Export to Excel</asp:LinkButton>--%>
                            </div>
                            <div class="col-md-3" style="float: right;">
                                No. of Records
                    <asp:DropDownList ID="ddl_paging_size" AutoPostBack="true" OnSelectedIndexChanged="ddl_paging_size_SelectedIndexChanged" Style="float: right;" runat="server">
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                        <asp:ListItem Text="100" Value="100"></asp:ListItem>
                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                    </asp:DropDownList>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">



                                <asp:GridView ID="dataTable" style="table-layout:fixed;" OnRowDataBound="dataTable_RowDataBound" OnPageIndexChanging="dataTable_PageIndexChanging" OnRowDeleting="dataTable_RowDeleting" OnRowCommand="dataTable_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" ClientIDMode="Static" CssClass="table table-bordered" runat="server">
                                    <Columns>
                                        <asp:BoundField DataField="appID" HeaderText="ApplicationID" />
                                        <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" />
                                        <asp:BoundField DataField="University.Name" HeaderText="University" />
                                        <asp:BoundField DataField="TrackingID" HeaderText="TrackingId" />
                                        <asp:BoundField DataField="SubmittedOn" HeaderText="Submitted On" />
                                        <asp:TemplateField HeaderText="Current Status">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddl_current_status" data-applicationid='<%# Eval("id")%>' data-candidateId='<%# Eval("UserID")%>' AutoPostBack="true" OnSelectedIndexChanged="ddl_current_status_SelectedIndexChanged" CssClass="form-control" runat="server">
                                                    <asp:ListItem Text="Received" Value="Received"></asp:ListItem>
                                                    <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                    <asp:ListItem Text="Dispatched" Value="Dispatched"></asp:ListItem>
                                                    <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText ="Confirm Payment">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" data-fileid='<%#Eval("id")%>' data-candidateId='<%# Eval("UserID")%>' OnClick="LinkButton1_Click1" runat="server" Text="Confirm"></asp:LinkButton>
                                                <asp:Label ID="Label1" runat="server" Visible="false" Text="Confirmed"> </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText ="View Application">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btn_view" CssClass="btn btn-primary" data-fileid='<%#Eval("id")%>' OnClick="btn_view_Click" runat="server" >View</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <div class="template_field">
                                                    <div class="dropdown grid-ddw" style="float: left;">
                                                        <a id='<%#eval("id")%>' class="btn btn-dark" style="margin-right: 5px;" data-target="#" href="http://example.com" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-files-o" aria-hidden="true"></i>
                                                            <span class="caret"></span>
                                                        </a>
                                                        <div class="dropdown-menu" aria-labelledby='<%#eval("id")%>'>
                                                            <h5>uploaded files</h5>
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <asp:repeater id="rptr_files" runat="server">
                                                                        <itemtemplate>
                                                                            <div class="col-md-3" style="font-size: 11px; padding: 15px;">
                                                                                <asp:hiddenfield id="file_path" runat="server" value='<%#eval("sharedfilepath")%>' />
                                                                                <asp:hiddenfield id="file_value" runat="server" value='<%#eval("filename")%>' />
                                                                                <a onclick="window.open('<%#eval("sharedfilepath")%>', 'mywin','left=20,top=20,width=800,height=600,toolbar=1,resizable=0');" data-fileid='<%#eval("onedriveid")%>'>
                                                                                    <asp:image id="file_thumb" width="100%" imageurl="~/content/img/google_docs.png" runat="server" />
                                                                                    <%#eval("filename")%>
                                                                                </a>
                                                                            </div>
                                                                        </itemtemplate>
                                                                    </asp:repeater>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" data-fileid='<%#Eval("id")%>' OnClick="LinkButton1_Click" runat="server"><i class="fa fa-download" aria-hidden="true"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Do you really want to delete?');" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("id")%>' runat="server"><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h4>Nothing found to display</h4>
                                    </EmptyDataTemplate>
                                    
                                    <PagerSettings NextPageText="Next" PreviousPageText="Back"  Mode="NumericFirstLast" PageButtonCount="10" FirstPageText="First"  LastPageText="Last" />
                                </asp:GridView>


                            </div>
                        </div>
                    </div>

                    <%--<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>--%>
                </ContentTemplate>
                <Triggers>
                    <%--<asp:PostBackTrigger ControlID="export_excel" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
        <%--<asp:Panel ID="panel_inactive" runat="server">
            <div class="card mb-3">
                <div class="card-header">
                    <h3>Unable to load records. Please contact administrator.</h3>
                </div>
            </div>
        </asp:Panel>--%>

    </div>

    <div class="modal fade" id="exampleModalCenter"  >
            <div class="modal-dialog">
                <div class="panel panel-heading pop_bg text-center">
                    

                </div>
            </div>
        </div>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#admin_login">
        <i class="fa fa-angle-up"></i>
    </a>
   
    <asp:HiddenField ID="hf_code" ClientIDMode="Static" runat="server" />
</asp:Content>


