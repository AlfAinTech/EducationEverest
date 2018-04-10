﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search_Results.aspx.cs" EnableEventValidation="false" Inherits="Search_Results" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Results</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/myScript.js"></script>
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

        function clicked() {
            alert("hello there");

        }
        
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
<form id="form1" runat="server">
    <div class="navbar-inverse" style="border-radius: 0px; height: 60px;">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <a class="navbar-brand" href="Dashboard.aspx">
                <img src="images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="https://educationeverest.org/" target="_blank" style="font-size: 20px; top: 6px;">Home </a></li>
                <li><a href="Dashboard.aspx" style="font-size: 20px; top: 6px;">Dashboard</a></li>
                <li style="color: transparent;">home</li>
            </ul>
            <div class="navbar-form navbar-left">
                <div class="form-group" style="margin-top: -40px">

                    <span>
                        <asp:textbox id="TextBox1" runat="server" style="height: 32px"></asp:textbox>
                    </span>

                    <%--<input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">--%>
                </div>
                <span>
                    <asp:imagebutton id="btnSearch" imageurl="images/search_button.png" style="margin-top: 4px;" runat="server" onclick="btnSearch_Click"></asp:imagebutton>
                </span>
                <span>
                    <asp:imagebutton id="btnFilter" imageurl="images/filter_button.png" style="margin-top: 4px; margin-left: -10px" runat="server" onclick="btnFilter_Click"></asp:imagebutton>
                </span>

                <%--<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"  />--%>
                <%--<asp:Button ID="btnFilter" runat="server" OnClick="btnFilter_Click" Text="Filter"  />--%>

                <%--<span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>--%>
                <%--<span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>--%>
            </div>
           <ul class="nav navbar-nav navbar-right">
                    <%-- <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>--%>
                    <li class="dropdown" style="height: 60px;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px; margin-right: 10px; border-bottom: 1px solid white;">
                            <asp:Label ID="lblLoggedUser" runat="server" Text="" Style="font-size: 20px; color: #0094ff; border-bottom: 1px solid; border-color: white"></asp:Label>
                        </span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
                        <ul class="dropdown-menu myprofile_dropdown">
                            <li><a href="My_Profile.aspx" class="myprofile_dropdown_link NormalCharacterStyle24">Profile</a></li>
                            <li role="separator" class="profile_divider"></li>
                            <%--<li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>--%>
                            <%--<li><a href="Login.aspx"  class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>--%>
                            <li>
                                <asp:LinkButton ID="logout" CausesValidation="false" OnClick="logout_Click" runat="server">
                                        <i class="myprofile_dropdown_link NormalCharacterStyle24"></i>Logout
                                </asp:LinkButton></li>
                        </ul>
                    </li>
                </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>


    <%--Filter Starts here--%>



    <%--Filter Ends here--%>



    <body style="background: #F2F2F2; background: rgba(242, 242, 242, 1);">

        <br />

        <div class="container-fluid text-center">
            <div class="row" style="height: 100%;">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 sidenav text-left">
                    <div class="NormalCharacterStyle16">
                        <asp:Label ID="lblcount" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:Label ID="lblShowSearchCount" runat="server" Text="Label" Visible="false"></asp:Label>
                    </div>
                    <asp:Label ID="lblNoData" runat="server" Text="No Data to load" Visible="false"></asp:Label>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:Repeater ID="rptSearch" runat="server" OnItemDataBound="rptSearch_ItemDataBound" OnItemCommand="rptSearch_ItemCommand">
                        <ItemTemplate>


                            
                            <div  class="panel panel-default panel_shadow results_cards" onclick="Div_repeaterclick('<%# Eval("UniversityID") %>')" style="cursor: pointer;">
                                
                                <div class="container-fluid row">
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
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Always">
                                                        <ContentTemplate>

                                                            <ajaxToolkit:Rating ID="Rating1" runat="server"
                                                                StarCssClass="starrating"
                                                                EmptyStarCssClass="emptystars"
                                                                FilledStarCssClass="filledstars"
                                                                WaitingStarCssClass="waitingstars" OnChanged="Rating1_Changed" Tag='<%# Eval("UniversityID") %>'>
                                                            </ajaxToolkit:Rating>
                                                            &nbsp;&nbsp;<br />

                                                            <asp:Label ID="lblRating" runat="server"></asp:Label>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
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

                                        <div class="pull-right" style="font-weight: 600;">
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
                <div class="col-md-6 filter_results_details_callout right  text-left uni_details_page_bg_2_" id="dvUnivDetailsShow" runat="server" style="height: 100%">
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

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Always">
                                        <ContentTemplate>

                                            <ajaxToolkit:Rating ID="Rating2" runat="server"
                                                StarCssClass="starrating"
                                                EmptyStarCssClass="emptystars"
                                                FilledStarCssClass="filledstars"
                                                WaitingStarCssClass="waitingstars" OnChanged="Rating1_Changed" Tag="0">
                                            </ajaxToolkit:Rating>
                                            &nbsp;&nbsp;
                    
                    <asp:Label ID="lblRating2" runat="server"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <%--Rating Ends here--%>


                                    <%--<img src="images/rating.png"></span><span class="NormalCharacterStyle216 pull-right">--%>
                                    <span class="NormalCharacterStyle216 pull-right">
                                        <asp:Label ID="lbl_IsAdmissionOpen2" runat="server" Text="Label"> </asp:Label></span>

                                </span>

                            </div>
                            <br />
                            <div>
                                <span>
                                    <button type="button" class="btn filter_results_apply_button_bg_2_"><a href="Personal_Detail.aspx" style="color: white;">Apply</a></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=""><span class="NormalCharacterStyle217">View Prospectus</span></a>
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
                        <span>
                            <button type="button" class="btn filter_results_apply_button_bg_2_"><a href="Personal_Detail.aspx" style="color: white;">Apply</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=""><span class="NormalCharacterStyle217">View Prospectus</span></a><br />
                        <br />
                    </div>

                </div>

            </div>
        </div>
        <asp:HiddenField runat="server" ID="hf1"/>
        <asp:Button runat="server" ID="btn_UniversityClicked" OnClick="btn_UniversityClicked_Click" style="display:none;" />
</form>
</body>
</html>
