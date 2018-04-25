<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllCandidates.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_AllCandidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Navigation-->
    <script src="Content/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(window).on('load', (function () {
            $(".overlay").fadeOut(1000);
        }));
        jQuery(document).ready(function ($) {

        });
        function OpenPopup(value) {
            window.open(value, 'mywin', 'left=20,top=20,width=800,height=600,toolbar=1,resizable=0');
        }
        function ConfirmDeletion() {
            alert("are you sure?");
        }
    </script>
    <div class="container" style="margin-top: 100px;">
        <div class="container-fluid">
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
                                            <label class="col-xs-3 control-label">Candidate Id</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="tb_CandidateId" TextMode="SingleLine" placeholder="Please enter Candidate ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">First Name</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="tb_Fname" TextMode="SingleLine" placeholder="Please enter FirstName"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">Last Name</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="tb_Lname" TextMode="SingleLine" placeholder="Please enter LastName"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">Username</label>
                                            <div class="col-xs-5">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="tb_username" TextMode="SingleLine" placeholder="Please enter Username"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row" style="margin-top: 25px;">
                                    

                                    <div class="col-md-9">
                                        
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-xs-3 control-label">&nbsp;</label>
                                                <asp:Button CssClass="btn btn-primary form-control" ID="Button1" runat="server" Text="Search" OnClick="btn_Search_Click" />
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
                                            <asp:LinkButton ID="btn1" CssClass="tag" data-role="tagsinput" runat="server" CommandArgument="1" OnClick="delete_filter">Candidate ID</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel2" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton ID="btn2" runat="server" CssClass="tag" CommandArgument="2" OnClick="delete_filter">First Name</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel3" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn3" CssClass="tag" CommandArgument="3" OnClick="delete_filter">Last Name</asp:LinkButton></li>
                                    </asp:Panel>
                                    <asp:Panel ID="panel4" runat="server" Visible="false">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btn4" CssClass="tag" CommandArgument="4" OnClick="delete_filter">Username</asp:LinkButton></li>
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
                    <div class="overlay">
                        <img src="../../Content/img/contact_loading.gif" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="card mb-3">

                        <div class="card-header">
                            <div class="col-md-3" style="float: left;">
                                <i class="fa fa-table" style="margin-right: 10px;"></i>Candidates
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
                                        <asp:BoundField DataField="CandidateID" HeaderText="CandidateId" />
                                        <%--<asp:BoundField DataField="UserID" HeaderText="UserID" />--%>
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                        <asp:BoundField DataField="AspNetUser.UserName" HeaderText="Username" />

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
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#admin_login">
        <i class="fa fa-angle-up"></i>
    </a>
   
    <asp:HiddenField ID="hf_code" ClientIDMode="Static" runat="server" />
</asp:Content>


