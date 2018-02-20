<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<!DOCTYPE html>
<html lang="en">
<head>
     <title>Dashboard</title>
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
    $(function() {
   var links = $('a.link').click(function() {
       links.removeClass('active');
       $(this).addClass('active');
   });
});

  </script>
</head>
<div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav">
        <li><a href="#" class="NormalCharacterStyle2019" style="top: 6px;">Home </a></li>
        <li><a href="#" class="dashboard_image" style="color: white; font-size : 18px; line-height : 22px;"><div style="margin-top: 5px">Dashboard</div></a></li>
        <li style="color: transparent;">home</li>&nbsp;&nbsp;&nbsp;
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">
        </div>
        <span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href="" data-toggle="modal" data-target="#exampleModalCenter"><img src="images/filter_button2.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>
      </form> --%>
              <%--<div class="modal fade" id="exampleModalCenter" >
                        <div class="filter_callout bottom text-left" style="margin-left: 300px;margin-top: 65px;">
          <div class="col-md-12" style="margin-top: 20px">

            <div class="NormalCharacterStyle12">Filter Universities</div>
            <br/>
            <div class="filter_divider"></div>

            <br/>--%>

            <%--<div class="row col-md-12">
    <div class="col-md-3">

         <div class="form">
     <select class="combobox form-control filter_select_option">
  <option selected="selected">Location</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div></div>
 <div class="col-md-3">
         <div class="form">
     <select class="combobox form-control filter_select_option">
  <option selected="selected">Degree/Courses</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div></div>
 <div class="col-md-3">
         <div class="form">
     <select class="combobox form-control filter_select_option">
  <option selected="selected">University Type</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div></div>
<div class="col-md-3"></div>
</div>


<div class="row col-md-12" style="margin-top: 10px;">
    <div class="col-md-3">

         <div class="form">
     <select class="combobox form-control filter_select_option">
  <option selected="selected">Admission Status</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div></div>
 <div class="col-md-3"></div>
 <div class="col-md-3"></div>
<div class="col-md-3"></div>
</div>
<br/><br/>
            <div class="filter_divider" style="margin-top: 50px;"></div>

            <div class="col-md-12" style="margin-top: 30px;">
              <div class="col-md-3">
                <div class="NormalCharacterStyle18">Fee Range</div>
              </div>
              <div class="col-md-3">
                <div class="NormalCharacterStyle18">HEC Ranking</div>
              </div>

            </div>

            <div class="col-md-12" style="margin-top: 10px;">
              <div class="col-md-3">
                <div><img src="images/range.png">
  <p>25,000 - 80,000 <span id="demo"></span></p>
</div>
              </div>
              <div class="col-md-3">
                 <div class="form">
     <select class="combobox form-control filter_select_option">
  <option selected="selected">Ranking Status</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div>
              </div>
            </div>

<br/>

</div>

        </div>
              </div>--%>
    
    <%--<ul class="nav navbar-nav navbar-right">
        <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>
        <li class="dropdown" style="height: 60px;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px;margin-right: 10px;border-bottom: 1px solid white;">Faizan</span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.html" class="myprofile_dropdown_link NormalCharacterStyle25">Profile</a></li>
             <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
</div>--%>




<%--<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 12px">Dashboard > My Applications</div>

</div>
<br/>--%>
 <%--<div class="container-fluid text-center">    
  <div class="row content" style="min-height: 100vh;height: 1000px">
    <div class="col-sm-2 sidenav text-left side-menu">

      <a class="main_list " href="My_Applications.html">  <div style="margin-bottom: 15px;">
    <span class="NormalCharacterStyle18">My Applications</span><span class="icon-arrow-right pull-right"><img src="images/arrow.png"></span>   
</div></a>--%>


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
    <div class="col-sm-9 text-center"> 
      <h3 class="NormalCharacterStyle12 text-left">My Applications</h3>
      
      <img src="images/Dashboard.png" style="margin-top: 120px;">

<br/><br/>
      <div class="NormalCharacterStyle111">You have no admission application yet.</div>
      <br/>
        <asp:Button ID="btnFileAdmission" class=" btn File_Admission_btn NormalCharacterStyle" runat="server" Text="File Admission Application" OnClick="btnFileAdmission_Click"  />
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
</script>



</asp:Content>

