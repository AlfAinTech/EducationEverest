﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Filter_Results.aspx.cs" Inherits="Filter_Results" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/UserControls/TopNavBar.ascx" TagPrefix="uc1" TagName="TopNavBar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="Content/img/EducationEverestIcon.jpg" rel="shortcut icon" type="image/jpg" />
    <title>Results</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>

    <link rel="Stylesheet" type="text/css" href="Content/css/MyStyle.css" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <!-- Latest compiled and minified JavaScript -->
    <script src="js/bootstrap.js"></script>
    <%--<script type="text/javascript" src="js/myScript.js"></script>--%>
    <script src="Content/vendor/jquery/jquery.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <script type="text/javascript">
        function Div_repeaterclick(id) {
            
            document.getElementById("<%= hf1.ClientID %>").value = id;
            document.getElementById("<%= btn_UniversityClicked.ClientID %>").click();
        }

        $(function () {
            var links = $('a.link').click(function () {
                links.removeClass('active');
                $(this).addClass('active');
            });
        });

        //function clicked() {
        //    alert("hello there");

        //}

    </script>
    <style>
        .linkbutton {
            display: none;
        }

        .starrating {
            width: 20px;
            height: 20px;
            cursor: pointer;
            background-repeat: no-repeat;
            display: inline;
        }

        .filledstars {
            background-image: url("images/filledstar.png");
        }

        .emptystars {
            background-image: url("images/emptystar.png");
        }

        .waitingstars {
            background-image: url("images/waitingstar.png");
        }
    </style>
</head>
<body style="background: #F2F2F2; padding-top: 0px; background: rgba(242, 242, 242, 1);">
    <form id="form1" runat="server">
        <uc1:TopNavBar runat="server" ID="TopNavBar" />

        <div class="container-fluid">
            <div class="row">
            <%--Filter Starts here--%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 filter_results_border" style="background: white">

            <div class="filter_results_callout bottom text-left">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="NormalCharacterStyle12 myspc1 mybspc1" style="border-bottom: 1px solid #b3b3b3">Filter Universities</div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  myspc1 mybspc2" style="/*border-bottom: 1px solid #b3b3b3; margin-bottom: 20px*/">
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">

                            <div class="form">
                                <asp:DropDownList ID="ddlLocation" CssClass="form-control" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" AutoPostBack="true" runat="server" Style="background-color: #e6e2e2">
                                    <asp:ListItem Text="City"></asp:ListItem>
                                    <asp:ListItem Text="Lahore"></asp:ListItem>
                                    <asp:ListItem Text="Karachi"></asp:ListItem>
                                    <asp:ListItem Text="Islamabad"></asp:ListItem>
                                    <asp:ListItem Text="Peshawar"></asp:ListItem>
                                    <asp:ListItem Text="Sialkot"></asp:ListItem>
                                    <asp:ListItem Text="Quetta"></asp:ListItem>
                                    <asp:ListItem Text="Faisalabad"></asp:ListItem>
                                    <asp:ListItem Text="Gujranwala"></asp:ListItem>
                                    <asp:ListItem Text="Multan"></asp:ListItem>
                                    <asp:ListItem Text="Sahiwal"></asp:ListItem>

                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <div class="form">
                                <asp:DropDownList ID="ddlUniversityType" runat="server" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="background-color: #e6e2e2">
                                    <Items>
                                        <asp:ListItem Text="University Type" Enabled="true" Selected="true" Value="1" />
                                    </Items>


                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">

                            <div class="form">
                                <div class="form">
                                    <asp:DropDownList ID="ddlAdmissionStatus" runat="server" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" AutoPostBack="true" Class="form-control" Style="background-color: #e6e2e2">
                                        <Items>
                                            <asp:ListItem Text="Admission Status" Enabled="true" Selected="true" />
                                        </Items>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <div class="form">
                                <asp:DropDownList ID="ddlHECRanking" runat="server" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" AutoPostBack="true" Class="form-control" Style="background-color: #e6e2e2">
                                    <Items>
                                        <asp:ListItem Text="HEC Ranking" Enabled="true" Selected="true" Value="1" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        </div>
        </div>
        
        <%--Filter Ends here--%>
        <div class="container-fluid text-center">
            <div class="row" style="height: 100%;margin-bottom:30px;">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 sidenav text-left">

                    <div class="NormalCharacterStyle16">
                        <asp:Label ID="lblcount" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:Label ID="lblShowSearchCount" runat="server" Text="Label" Visible="false"></asp:Label>
                    </div>
                    <asp:Label ID="lblNoData" runat="server" Text="No Data to load" Visible="false"></asp:Label>

                    <div class="row">
                        <div class="col-md-10" style="padding: 0; padding-top: 5px;">
                            <ul class="tags">
                                <asp:Panel ID="panel1" runat="server" Visible="false">
                                    <li>
                                        <asp:LinkButton ID="btn1" CssClass="tag" data-role="tagsinput" runat="server" CommandArgument="1" OnClick="delete_filter">Location</asp:LinkButton></li>
                                </asp:Panel>
                                <asp:Panel ID="panel2" runat="server" Visible="false">
                                    <li>
                                        <asp:LinkButton ID="btn2" runat="server" CssClass="tag" CommandArgument="2" OnClick="delete_filter">Degree/Course</asp:LinkButton></li>
                                </asp:Panel>
                                <asp:Panel ID="panel3" runat="server" Visible="false">
                                    <li>
                                        <asp:LinkButton runat="server" ID="btn3" CssClass="tag" CommandArgument="3" OnClick="delete_filter">University Type</asp:LinkButton></li>
                                </asp:Panel>
                                <asp:Panel ID="panel4" runat="server" Visible="false">
                                    <li>
                                        <asp:LinkButton runat="server" ID="btn4" CssClass="tag" CommandArgument="4" OnClick="delete_filter">Admission Status</asp:LinkButton></li>
                                </asp:Panel>
                                <asp:Panel ID="panel5" runat="server" Visible="false">
                                    <li>
                                        <asp:LinkButton runat="server" ID="btn5" CssClass="tag" CommandArgument="5" OnClick="delete_filter">Ranking Status</asp:LinkButton></li>
                                </asp:Panel>


                            </ul>
                        </div>
                        <div class="col-md-2" style="margin-left: -20px">
                            <asp:Button Text="Reset Filters" CssClass="btn btn-dark" Visible="false" ID="btn_reset" runat="server" OnClick="btn_reset_Click" />
                        </div>
                    </div>

                    <%--panels end here--%>

                    <span></span>
                    <asp:Label ID="lblNoDatainFilter" runat="server" Text="No Match Found" Visible="false"></asp:Label>

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div id="university_lists" style="position:relative;overflow:auto;/*max-height:calc(100vh - 200px);*/">
                        <asp:Repeater ID="rptSearch" runat="server" OnItemDataBound="rptSearch_ItemDataBound" OnItemCommand="rptSearch_ItemCommand">
                        <ItemTemplate>



                            <div class="panel panel-default panel_shadow results_cards container-fluid " 
                                onclick="Div_repeaterclick('<%# Eval("UniversityID") %>')" style="cursor: pointer;margin-bottom:7px;">


                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="centered text-center">

                                            <%--<asp:GridView ID="GridView1" align="center" Height="40px" Width="40px" ShowHeader="false"   BorderStyle="none"   runat="server" AutoGenerateColumns="False">
             <Columns>
                 <asp:ImageField DataImageUrlField="Path">
                      <ControlStyle Height="40px"  Width="40px" />
                 </asp:ImageField>
             </Columns>
         </asp:GridView>--%>
                                            <%--<p><img src="images/pic1.jpg" class="img-responsive img-circle" /></p>--%>
                                        </div>

                                        <%--<img src='<%# Eval("Path") %>'' style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">--%>
                                        <%--<img  id="logoImage" style="width: 90px;height: 90px;margin-left: 0px;margin-top: 10px;">--%>
                                        <asp:Image  ImageUrl="~/images/university_icon.png" ID="Image1" runat="server" />

                                        <%--<img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">--%>
                                    </div>

                                    <div class="col-md-10 text-left">
                                        <div class="NormalCharacterStyle_new1">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Eval("University.Name") %>' />
                                                </div>
                                                <div class="col-md-4 myspc1">
                                                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Always">
                                                        <ContentTemplate>

                                                            <ajaxToolkit:Rating ID="Rating1" ReadOnly="true" runat="server"
                                                                StarCssClass="starrating"
                                                                EmptyStarCssClass="emptystars"
                                                                FilledStarCssClass="filledstars"
                                                                WaitingStarCssClass="waitingstars" >
                                                            </ajaxToolkit:Rating>
                                                            &nbsp;&nbsp;<br />

                                                            <asp:Label ID="lblRating" runat="server"></asp:Label>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>--%>
                                                </div>
                                            </div>

                                            <%--<span class="rating_img"></span><span><img src="images/fav_icon.png" class="pull-right" style="margin-top: 5px;"></span>--%>
                                        </div>

                                        <div class="NormalCharacterStyle211">
                                            <span>
                                                <img src="images/location_icon2.png"></span>
                                            <asp:Label ID="lblUnivAddress" runat="server" Text="Label"></asp:Label>
                                            <%--<span style="font-size: 16px">
                                                    <asp:LinkButton ID="lb_UniversityPanel" runat="server" Text="Details" CommandName="Select" ClientIDMode="Static" CommandArgument='<%# Eval("University.id") %>' Style="float: right"></asp:LinkButton></span>--%>
                                        </div>

                                        <div class="pull-right" style="font-weight:600;">
                                            <span class="NormalCharacterStyle213">Apply Before:</span><span class="NormalCharacterStyle212">
                                                <asp:Label ID="lblDeadLine" runat="server" Text="Label"></asp:Label></span>
                                        </div>
                                        <%-- <br/>--%>
                                        <%--<div class="NormalCharacterStyle214"> <asp:Label ID="lbl_IsAdmissionOpen" runat="server" Text="Label"></asp:Label></div>--%>
                                        <span class="NormalCharacterStyleGreen">
                                            <asp:Label ID="lbl_IsAdmissionOpen" runat="server" Text="Label"></asp:Label></span>

                                        <div class="NormalCharacterStyle213">
                                            <asp:Label ID="lblCountDegreePrograms" runat="server" Text="Label"></asp:Label>&nbsp;Degree Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCountDepartments" runat="server" Text="Label"></asp:Label>&nbsp;Departments
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
                </div>







                <div class="col-md-6 filter_results_details_callout right  text-left uni_details_page_bg_2_" id="dvUnivDetailsShow" runat="server" style="height: 100%">
                    <div id="university_content" style="/*overflow:auto;max-height:calc(100vh - 200px);*/" class="container-fluid">
                        <div class="row" style="border-bottom: 1px solid #b3b3b3; padding-bottom: 4%">
                        <div class="col-md-2">
                            <asp:Image  ImageUrl="~/images/university_icon.png" ID="Image2" runat="server" />
                            <%--<img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: -5px;margin-top: 10px;">--%>
                        </div>
                        <div class="col-md-10 text-left" style="margin-top: 10px">
                            <div class="NormalCharacterStyle215">
                                <asp:Label ID="lblUniversityName2" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="NormalCharacterStyle211" style="margin-top: 5px">
                                <span>
                                    <img src="images/location_icon2.png"></span>
                                <asp:Label ID="lblUnivAddress2" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div>
                                <span style="margin-top: 5px">
                                    <%--Rating Started here--%>

                                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Always">
                                        <ContentTemplate>

                                            <ajaxToolkit:Rating ID="Rating2" ReadOnly="true" runat="server"
                                                StarCssClass="starrating"
                                                EmptyStarCssClass="emptystars"
                                                FilledStarCssClass="filledstars"
                                                WaitingStarCssClass="waitingstars">
                                            </ajaxToolkit:Rating>
                                            &nbsp;&nbsp;
                    
                    <asp:Label ID="lblRating2" runat="server"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    <%--Rating Ends here--%>


                                    <%--<img src="images/rating.png"></span><span class="NormalCharacterStyle216 pull-right">--%>
                                    <span class="NormalCharacterStyle216 pull-right">
                                        <asp:Label ID="lbl_IsAdmissionOpen2" runat="server" Text="Label"> </asp:Label></span>

                                </span>

                            </div>
                            <br />
                            <div>
                                <span>
                                    <asp:Button ID ="btn_Apply" CssClass="btn filter_results_apply_button_bg_2_"  OnClick="btn_Apply_Click" runat="server" Text="Apply" style="display:none;color:white;" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <asp:LinkButton ID="lb_viewProspectus" runat="server" CssClass="NormalCharacterStyle217" style="display:none;color:white;" Text="View Prospectus"></asp:LinkButton>
                                   
                            </div>

                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-12">
                            <div class="NormalCharacterStyle218">
                                About
                <asp:Label ID="lblUniversity2" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="panel_text">

                                <asp:Label ID="lblAbout" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>

                    </div>


                    <div class="col-md-12" style="margin-top: 40px;">
                        <div class="col-md-12">
                            <div class="NormalCharacterStyle218">Criteria</div>

                            <div class="panel_text">
                                <asp:Label ID="lblCriteria" runat="server" Text="Label"></asp:Label>

                            </div>
                        </div>
                    </div>


                    <div class="col-md-12" style="margin-top: 30px;">
                        <div class="col-md-12">
                            <div class="NormalCharacterStyle218">Admission Documents</div>

                            <div class="panel_text">

                                <asp:Label ID="lblAdmissionDocuments" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                    </div>



                    <div class="col-md-12" style="margin-top: 30px;">
                        <div class="col-md-12">
                            <div class="NormalCharacterStyle218">Fee Structure</div>

                            <div class="panel_text">
                                <asp:Label ID="lblFeeStructure" runat="server" Text="Label"></asp:Label>


                            </div>
                        </div>
                    </div>
                    <div class="pull-right" style="margin-top: 50px;">
                        <%--<span>
                            <button type="button" class="btn filter_results_apply_button_bg_2_"><a href="Personal_Detail.aspx" style="color: white;">Apply</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=""><span class="NormalCharacterStyle217">View Prospectus</span></a><br />--%>
                        <br />
                    </div>

                    </div>
                </div>
            </div>
        </div>
         <asp:HiddenField runat="server" ID="hf1"/>
        <asp:Button runat="server" ID="btn_UniversityClicked" OnClick="btn_UniversityClicked_Click" style="display:none;" />
    </form>

    <script>
        $(document).ready(function () {
            var heightContent = $('#university_content').height();
            console.log(heightContent); 
            if (heightContent > 50) {
                $('#university_lists').height(heightContent-23);
            }
        })
    </script>
</body>
</html>
