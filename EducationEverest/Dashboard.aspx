<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<%@ Register Src="~/UserControls/ApplicationRecords.ascx" TagPrefix="uc1" TagName="ApplicationRecords" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px">Dashboard > Applications</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 text-center">
        <h3 class="NormalCharacterStyle12 text-left">My Applications</h3>
            <div>
                <img src="images/Dashboard.png" />
                <h3 style="color:#a7a7a7">You have no admission applicaiton yet!</h3>
            </div>
                <uc1:ApplicationRecords runat="server" ID="ApplicationRecords" />
            <div style="display:inline-block">
                <asp:Button ID="btnFileAdmission" class=" btn File_Admission_btn NormalCharacterStyle pull-right" runat="server" Text="File Admission Application" OnClick="btnFileAdmission_Click" />
            </div>
            <div class="homecallout right" style="display:inline-block;margin-top: 0px;margin-right: 0px;">
                <p class="orange_text">No Admission File yet?</p>
                <p class="panel_text">Click here to file a new admission application</p>
                <br />
                <a href="#"><p class="pull-right" style="font-weight:600">GOT IT</p></a>

            </div>
    </div>




    <%--         <button type="button" class=" btn File_Admission_btn"><span class="NormalCharacterStyle">File Admission Application</span></button>--%>
    </div>
    <%--</div>--%>
    <script type="text/javascript">
        $('#menu_toggle').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
        $('#menu_toggle2').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
        $('#menu_toggle3').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
        function OpenCurrentPage() {

            $("#applicationDashbord").addClass("NormalCharacterStyle18");

        }
    </script>



</asp:Content>

