<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<%@ Register Src="~/UserControls/ApplicationRecords.ascx" TagPrefix="uc1" TagName="ApplicationRecords" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" Runat="Server">
    <div style="margin-top: 15px">Dashboard > Applications</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <div class="dropdown"  style="margin-bottom: 15px;">
    <a data-toggle="collapse" data-target="#clps2" class="main_list " ><div><span class="NormalCharacterStyle25"> </span><span class="icon-arrow-right pull-right main_list"><img src="images/arrow.png" style="display:none"></span></div></a>
    <div class="collapse" id="clps2">
      <br/>
        <li class="list_items"><a href="Personal_Details.html" class="menu_list "><span  class="NormalCharacterStyle24">Personal Details</span></a>
      </li>
      <li class="list_items"><a href="Make_Choices.html" class="menu_list "><span  class="NormalCharacterStyle24">Make Choices</span></a>
      </li>
      <li class="list_items"><a href="Educational_Details.html" class="menu_list "><span  class="NormalCharacterStyle24">Educational Details</span></a>
      </li>
      <li class="list_items"><a href="Test_Results.html" class="menu_list "><span  class="NormalCharacterStyle24">Test Results</span></a>
      </li>
      <li class="list_items"><a href="Upload_Documents.html" class="menu_list "><span  class="NormalCharacterStyle24">Documents</span></a>
      </li>
       <li class="list_items"><a href="Payments.html" class="menu_list "><span  class="NormalCharacterStyle24">Payments</span></a>
      </li>
    </div>   
</div>

  <%--<a class="main_list " href="My_Profile.html">  <div style="margin-bottom: 15px;">
    <span class="NormalCharacterStyle25">My Payments</span><span class="icon-arrow-right pull-right"><img src="images/arrow.png"></span>   
</div></a>

    </div>
<br/>--%>
    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 text-center"> 
      <h3 class="NormalCharacterStyle12 text-left">My Applications</h3>
        <uc1:ApplicationRecords runat="server" ID="ApplicationRecords" />

    <div class="col-lg-6 col-md-6 col-lg-offset-6 col-md-offset-6 col-sm-3 col-xs-12" >
            <asp:Button ID="btnFileAdmission" class=" btn File_Admission_btn NormalCharacterStyle" runat="server" Text="File Admission Application" OnClick="btnFileAdmission_Click" style="margin-left: 23%;" />
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

