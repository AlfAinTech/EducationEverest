<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideNavBar.ascx.cs" Inherits="UserControls_SideNavBar" %>

<script type="text/javascript">
        $(document).ready(function () {
           
            $('#makeChoices').on('click', function () {

                var x = location.href;
                if (x.includes("NA=true")) {
                    window.location.href = 'choices.aspx?NA=true';
                } else {
                    window.location.href = 'choices.aspx';
                }
            });
            $('#testResult').on('click', function () {

                var x = location.href;
                if (x.includes("NA=true")) {
                    window.location.href = 'Test_Result.aspx?NA=true';
                }
                else {
                    window.location.href = 'Test_Result.aspx'
                }
            });
            $('#Upload_Documents').on('click', function () {

                var x = location.href;
                if (x.includes("NA=true")) {
                    window.location.href = 'Upload_Documents.aspx?NA=true';
                } else {
                    window.location.href = 'Upload_Documents.aspx'
                }
            });

            $('#fileAdmission').on('click', function () {
                var iSelector = $(this).find('span:first');
                

                if (iSelector.hasClass('glyphicon-chevron-right')) {
                    iSelector.removeClass('glyphicon-chevron-right hide-before')
                    iSelector.addClass('glyphicon-chevron-up hide-before')
                } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                    iSelector.removeClass('glyphicon-chevron-up hide-before')
                    iSelector.addClass('glyphicon-chevron-right hide-before')
                }
            });

        });
        $('#applicationDashbord').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
                
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
        
        $('#mypayments').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
    </script>
<div class="container-fluid text-center">
    <div class="row content" style="min-height: 200vh; height: 100vh">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 sidenav text-left side-menu">
            <div class="dropdown"  style="margin-bottom: 10px;">
                <a data-toggle="collapse" id="fileAdmission" data-target="#clps2" class="main_list NormalCharacterStyle25"><div>File Admission App<div class="pull-right"><span class="glyphicon glyphicon-chevron-right dropdown_icon " data-toggle="collapse" data-target="#clps2"></span></div></div></a>
                <div class="collapse" id="clps2">
                    <br/>
                    <li class="menu_list"><a href="Personal_Detail" class="NormalCharacterStyle24" id="prsonalDetail"><p>Personal Detail<span><img src="~/images/check_icon.png" runat="server" id="imgTickPersonalDetails"  visible="false"   style="float:right;height:20px;width:20px" /><img src="~/images/caution_icon.png" runat="server" id="imgExcPersonalDetails"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="makeChoices"><p>Make Choices&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickChoices"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcChoices"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li> 
                    <li class="menu_list"><a href="educational_detail" id="educationalDocument"  class="NormalCharacterStyle24" ><p>Educational Details&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickEducationDetails"  visible="false" style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcEducationDetails"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="testResult"><p>Test Results&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickTestResults"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcTestResults"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  id="Upload_Documents" class="NormalCharacterStyle24"><p>Documents&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickDocuments"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcDocuments"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a href="Payments" class="NormalCharacterStyle24" id="Payments"><p>Payments&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickPayments"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcPayments"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>


                </div>
            </div>

        </div>


