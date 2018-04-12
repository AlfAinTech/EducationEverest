<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideNavBar.ascx.cs" Inherits="UserControls_SideNavBar" %>

<script type="text/javascript">
        $(document).ready(function () {
            $('#prsonalDetail').on('click', function () {
                var x = location.href;
                if(x.includes("apps")){
                    window.location.href = 'Personal_Detail.aspx?apps=' + getParameterByName('apps',x);
                } else if (x.includes("appID")) {
                    window.location.href = 'Personal_Detail.aspx?appID=' + getParameterByName('appID', x);
                }
                else {
                    window.location.href = 'Personal_Detail.aspx';
                }
            });
            $('#makeChoices').on('click', function () {

                var x = location.href;
                if (x.includes("apps")) {
                    window.location.href = 'choices.aspx?apps=' + getParameterByName('apps', x);
                } else if (x.includes("appID")) {
                    window.location.href = 'choices.aspx?appID=' + getParameterByName('appID', x);
                } else {
                    window.location.href = 'choices.aspx';
                }
            });
            
            $('#educationalDocument').on('click', function () {

                var x = location.href;
                if (x.includes("apps")) {
                    window.location.href = 'educational_detail.aspx?apps=' + getParameterByName('apps', x);
                } else if (x.includes("appID")) {
                    window.location.href = 'educational_detail.aspx?appID=' + getParameterByName('appID', x);
                } else {
                    window.location.href = 'educational_detail.aspx';
                }
            });
            $('#testResult').on('click', function () {

                var x = location.href;
                if (x.includes("apps")) {
                    window.location.href = 'Test_Result.aspx?apps=' + getParameterByName('apps', x);
                } else if (x.includes("appID")) {
                    window.location.href = 'Test_Result.aspx?appID=' + getParameterByName('appID', x);
                }
                else {
                    window.location.href = 'Test_Result.aspx'
                }
            });
            $('#Upload_Documents').on('click', function () {

                var x = location.href;
                if (x.includes("apps")) {
                    window.location.href = 'Upload_Documents.aspx?apps=' + getParameterByName('apps', x);
                } else if (x.includes("appID")) {
                    window.location.href = 'Upload_Documents.aspx?appID=' + getParameterByName('appID', x);
                } else {
                    window.location.href = 'Upload_Documents.aspx'
                }
            });
            $('#Payments').on('click', function () {

                var x = location.href;
                if (x.includes("apps")) {
                    window.location.href = 'Payments.aspx?apps=' + getParameterByName('apps', x);
                } else if (x.includes("appID")) {
                    window.location.href = 'Payments.aspx?appID=' + getParameterByName('appID', x);
                } else {
                    window.location.href = 'Payments.aspx'
                }
            });
            function getParameterByName(name, url) {
                if (!url) url = window.location.href;
                name = name.replace(/[\[\]]/g, "\\$&");
                var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return null;
                return decodeURIComponent(results[2].replace(/\+/g, " "));
            }

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
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="prsonalDetail"><p>Personal Detail<span><img src="~/images/check_icon.png" runat="server" id="imgTickPersonalDetails"  visible="false"   style="float:right;height:20px;width:20px" /><img src="~/images/caution_icon.png" runat="server" id="imgExcPersonalDetails"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="makeChoices"><p>Make Choices&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickChoices"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcChoices"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li> 
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="educationalDocument" ><p>Educational Details&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickEducationDetails"  visible="false" style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcEducationDetails"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="testResult"><p>Test Results&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickTestResults"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcTestResults"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="Upload_Documents" ><p>Documents&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickDocuments"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcDocuments"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>
                    <li class="menu_list"><a  class="NormalCharacterStyle24" id="Payments"><p>Payments&nbsp;&nbsp;&nbsp;&nbsp;<span><img src="~/images/check_icon.png" runat="server" id="imgTickPayments"  visible="false"  style="float:right;height:20px;width:20px"  /><img src="~/images/caution_icon.png" runat="server" id="imgExcPayments"  visible="false"   style="float:right;height:20px;width:20px" /></span></p></a></li>


                </div>
            </div>

        </div>


