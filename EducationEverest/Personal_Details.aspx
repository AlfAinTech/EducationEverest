<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Personal_Details.aspx.cs" Inherits="Personal_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    1
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
<html lang="en">
<head>
     <title>Personal Details</title>
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
<div class="navbar-inverse" style="border-radius: 0px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="images/Logo_1_.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#" style="font-size: 20px;top: 6px;">Home </a></li>
        <li><a href="#"><img src="images/header_dashboard_button_1_.png" style="margin: -15px;height: 65px"></a></li>
        <li style="color: transparent;">home</li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">
        </div>
        <span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><img src="images/header_notification_icon_1_.png"></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="images/header_username_1_.png">&nbsp;<img src="images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.html" class="myprofile_dropdown_link NormalCharacterStyle24">Profile</a></li>
             <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle24">Settings</a></li>
            <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle24">Log Out</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
</div>
<body>



<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 15px">Dashboard > File Admission Application > Personal Details</div>

</div>
<br/>
  
<div class="container-fluid text-center">    
  <div class="row content" style="min-height: 100vh;height: 1000px">
    <div class="col-sm-2 sidenav text-left side-menu">

      <div class="dropdown" style="margin-bottom: 10px;">
    <a data-toggle="collapse" data-target="#clps1" class="main_list NormalCharacterStyle25" href="My_Applications.html">My Applications<div class="icon-arrow-right pull-right"><a class="glyphicon glyphicon-chevron-right drop_down_icon_1_" data-toggle="collapse" data-target="#clps1"></a></div></a>
 
</div>

      <div class="dropdown"  style="margin-bottom: 10px;">
    <a data-toggle="collapse" data-target="#clps2" class="main_list NormalCharacterStyle18">File Admission App<div class="icon-arrow-right pull-right"><a class="glyphicon glyphicon-chevron-down dropdown_icon " data-toggle="collapse" data-target="#clps2"></a></div></a>
    <div class="collapse" id="clps2">
      <br/>
        <li class="menu_list selected_bg"><a href="Personal_Details.html" class="NormalCharacterStyle22">Personal Details</a></li>
        <li class="menu_list"><a href="Make_Choices.html" class="NormalCharacterStyle24">Make Choices</a></li>
        <li class="menu_list"><a href="Educational_Details.html" class="NormalCharacterStyle24">Educational Details</a></li>
        <li class="menu_list"><a href="Test_Results.html" class="NormalCharacterStyle24">Test Results</a></li>
        <li class="menu_list"><a href="Upload_Documents.html" class="NormalCharacterStyle24">Documents</a></li>
        <li class="menu_list"><a href="Payments.html" class="NormalCharacterStyle24">Payments</a></li>
    </div>   
</div>

      <div class="dropdown"  style="margin-bottom: 10px;">
    <a data-toggle="collapse" data-target="#clps3" class="main_list NormalCharacterStyle25">My Payments<div class="icon-arrow-right pull-right"><a class="glyphicon glyphicon-chevron-right drop_down_icon_1_" data-toggle="collapse" data-target="#clps3"></a></div></a>
 
</div>


    </div>

    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Personal Details</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>

      <div class="panel panel-default panel_shadow">
      <div class="panel-heading" style="height: 50px">
        <h4 class="panel-title">
          <div class="NormalCharacterStyle10">Personal Information<div class="icon-arrow-right pull-right"><div class="check-"></div><a id="menu_toggle" ><i class="glyphicon glyphicon-chevron-down normal-color" data-toggle="collapse" data-parent="#accordion" href="#collapse2"></i></a></div></div> 
        </h4>
              </div>
      <div id="collapse2" class="panel-collapse panel-heading collapse">
        <div class="panel-body" >
    <br/>

<div class="col-md-12">
<div class="col-md-10 text-left">
  <div class="col-md-5">
         <div class="form">
     <input class="input_name" type="text" name="name"  placeholder="Name (according to matric certificate)">
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input class="input_father_name" type="text" name="father_name" placeholder="Father Name (according to matric certificate)">
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input class="input_CNIC_no" type="text" name="CNIC" placeholder="Your CNIC No">
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input class="input_father_CINC_no" type="text" name="father_CNIC" placeholder="Father CNIC No" >
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input class="input_DOB" type="text" name="dob"  placeholder="Date of Birth">
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input class="input_nationality" type="text" name="nationality"  placeholder="Nationality">
    </div>
</div>


</div>
 <div class="col-md-2 pull-right">
     
 <a href="" class="upload_photo"> <div class="well text-center" style="width: 150px;height: 180px">
<div class="upload_icon text-center"></div><br/><br/><br/><br/>
<div class="upload_icon_text"> Upload</div>
<div class="upload_icon_text">Passport Size Photograph</div>
  </div></a>

    </div>

</div>

        </div>
      </div>
    </div>

    <div class="panel panel-default panel_shadow">
      <div class="panel-heading text-left">       
        <h4 class="panel-title NormalCharacterStyle2 contact_info_card_bg" >
                 Contact Information<div class="icon-arrow-right pull-right"><span class="check_icon"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="menu_toggle2" ><i class="glyphicon glyphicon-chevron-down normal-color" data-toggle="collapse" data-parent="#accordion" href="#collapse3"></i></a></div>
        </h4>

      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>
</div>

 <div class="panel panel-default panel_shadow">
      <div class="panel-heading text-left">       
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 Other Information<div class="icon-arrow-right pull-right"><span class="caution_icon"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="menu_toggle3" ><i class="glyphicon glyphicon-chevron-down normal-color" data-toggle="collapse" data-parent="#accordion" href="#collapse4"></i></a></div>
        </h4>

      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>
</div>
<br/>
         <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">NEXT</span></button>
  </div>
</div>
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
</body>
</html>

</asp:Content>

