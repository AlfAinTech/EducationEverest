<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My_Profile.aspx.cs" Inherits="My_Profile" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <title>My Profile</title>
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
        <li><a href="Dashboard.aspx" class="dashboard_image" style="color: white; font-size : 18px; line-height : 22px;"><div style="margin-top: 5px">Dashboard</div></a></li>
        <li style="color: transparent;">home</li>&nbsp;&nbsp;&nbsp;
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">
        </div>
        <span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>
        <li class="dropdown" style="height: 60px;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px;margin-right: 10px;border-bottom: 1px solid white;">
              <asp:Label ID="lblLoggedUser" runat="server" Text=""  style="font-size:20px;color:#0094ff;border-bottom:1px solid;border-color:white"></asp:Label>
          </span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.aspx" class="myprofile_dropdown_link NormalCharacterStyle25">Profile</a></li>
             <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
</div>
<body>


   <%-- code to share on facebook starts here--%>
   <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.12&appId=516503188742935&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
   <%-- code to share on facebook ends here--%>


<div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 12px">Dashboard > Profile</div>

</div>
<br/>
  
<div class="container-fluid text-center">    
  <div class="row content" style="min-height: 100vh;height: 1000px">
         <form id="form" runat="server">
    <div class="col-sm-2 sidenav text-left profile_sidemenu">

      <div class="panel panel-default text-center ">
  <div class=" profile_card_bg_2" >
    <div class="pull-right" style="margin-right: 25px;margin-top: 10px;"><a href="" class="edit_icon"></a></div>
  </div>
      <div class="panel-heading profile_card_bg">
          <br />
          
        <h5 class="Profile_sidemenu_Name1" style="margin-top: 40px"><span class="Profile_sidemenu_Name2" ><asp:Label ID="firstName" runat="server" Text="Label"></asp:Label>  </span><asp:Label ID="lastName" runat="server" Text="Label"></asp:Label></h5>
        <div class="profile_email_text" style="margin-top: -5px"> <asp:Label ID="email" runat="server" Text="Label"></asp:Label></div>
        <div class="profile_user_text" style="margin-top: 0px">  <asp:Label ID="id" runat="server" Text="ID: 432521"></asp:Label></div>
        <div class="profile_email_text" style="margin-top: 5px"><asp:Label ID="city" runat="server" Text="Label"></asp:Label></div>
      </div>
      <div class="profile_image">    </div>
          </div>


      <div class="panel panel-default">
      <div class="panel-heading" style="height: 200px">
        <div class="Profile_sidemenu_Name3 text-left">Contact Details<span class="pull-right" style="margin-right: 10px;"><a href="" class="edit_icon_1_"></a></span></div>
        <br/>
        <div class="profile_panel_text"><span class="letter_icon"></span><span style="margin-left: 30px;"><asp:Label ID="email2" runat="server" Text="Label"></asp:Label></span></div> <br />
        <div class="profile_panel_divider margin_top2 margin_bottom"></div>
                <br /><div class="profile_panel_text margin_top2 margin_bottom"><span class="phone_icon"></span><span style="margin-left: 30px;"><asp:Label ID="contact" runat="server" Text="Label"></asp:Label></span></div>
       <br /> <div class="profile_panel_divider margin_top2 margin_bottom"></div>
          <br/>      <div class="profile_panel_text margin_top2 margin_bottom"><span class="location_icon"></span><span style="margin-left: 30px;"><asp:Label ID="city2" runat="server" Text="Label"></asp:Label></span></div><br/><br/><br/>

      </div>
          </div>

 <div class="panel panel-default">
      <div class="panel-heading text-center" style="height: 170px">
        <div class="Profile_sidemenu_Name3 text-left">Payment Details<span class="pull-right" style="margin-right: 10px;"><a href="" class="edit_icon_1_"></a></span></div>
        
        <div class="profile_panel_text">Total Spendings</div>
                <div class="profile_panel_text2 ">PKR 6999</div>
        <div class="profile_panel_divider"></div>
                <div class="profile_panel_text text-left">Recent Card</div><br/>
                <div class="profile_panel_text">352 ** ***** ***** *** 01</div>
                <div class="profile_panel_text">exp 12/17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***</div>

      </div>
          </div>

  <a href="">
          <div class="panel panel-default panel_shadow">
    <div class="panel-heading profile_card_small" style="height: 60px">
     <div class="Profile_sidemenu_Name4 margin_top">Settings<span class="icon-arrow-right pull-right"><span class="glyphicon glyphicon-chevron-right text-colour"></span></span></div>
 </div>
          </div></a>

           <a href="" data-toggle="modal" data-target="#contactmodel">
          <div class="panel panel-default panel_shadow">
    <div class="panel-heading profile_card_small" style="height: 60px">
     <div class="Profile_sidemenu_Name4 margin_top">Contact Us<span class="icon-arrow-right pull-right"><span class="glyphicon glyphicon-chevron-right text-colour"></span></span></div>
 </div>
          </div></a>


        <div class="modal fade " id="contactmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content contact_us_model">
      <div class="modal-header text-center">
        <span class="Profile_modal_heading">Contact us</span>
       <span> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></span>
      </div>
      
      <div class="modal-body">
        <div class="col-md-1"></div>
        <div class="col-md-10"><br/>
           
            <asp:TextBox ID="txtMessageEmail" runat="server" placeholder="Email" class="form-control" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="txtMessageRequiredValidator" ValidationGroup="vgMessageEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtMessageEmail" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="txtMessageValidator2" ValidationGroup="vgMessageEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="txtMessageEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

          <%--<input  type="text" class="form-control" name="card holder" placeholder="Email">--%>
          <%--<textarea class="form-control" rows="7"  placeholder="Your Message" style="margin-top: 5px;resize: none;"></textarea><br/>--%>
                <asp:TextBox ID="txtMessage"  runat="server" placeholder="Message"  class="form-control" style="margin-top: 5px;margin-bottom:20px; resize: none; height:150px; padding-bottom:120px "></asp:TextBox>
                <asp:RequiredFieldValidator ID="txtMessageRegularValidator" ValidationGroup="vgMessageEmail" runat="server" ErrorMessage="Enter Message" ControlToValidate="txtMessage" ForeColor="Red"></asp:RequiredFieldValidator>

             <asp:Button ID="btnMessage" OnClick="btnMessage_Click"  ValidationGroup="vgMessageEmail"   class="btn profile_contact_panel_button pull-right" runat="server" Text="ADD"   />
              

                 <%--<button type="button" class="btn profile_contact_panel_button pull-right">ADD</button>--%>
                
               
        </div>
                <div class="col-md-1"></div>
      </div>
    </div>
  </div>
  </div>

           <a href="" data-toggle="modal" data-target="#friendmodal">
          <div class="panel panel-default panel_shadow">
    <div class="panel-heading profile_card_small" style="height: 60px">
     <div class="Profile_sidemenu_Name4 margin_top">Invite Friends<span class="icon-arrow-right pull-right"><span class="glyphicon glyphicon-chevron-right text-colour"></span></span></div>
 </div>
          </div></a>




<div class="modal fade " id="friendmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content contact_us_model">
      <div class="modal-header text-center">
        <span class="Profile_modal_heading">Invite Friends</span>
       <span> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></span>
      </div>
      <div class="modal-body">
        <div class="col-md-1"></div>
        <div class="col-md-10"><br/>
             
            <asp:TextBox ID="txtEmailSend" class="form-control"  placeholder="Email" style="margin-bottom:20px"  runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vgSendEmail" runat="server" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailSend"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="rvEmailSend" ValidationGroup="vgSendEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="txtEmailSend" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
<%--            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="vgSendEmail" runat="server" ErrorMessage="Please enter Valid Email" ControlToValidate="txtEmailSend"></asp:RegularExpressionValidator>--%>
            <asp:Button ID="btnInvite" OnClick="SendEmail_Click" ValidationGroup="vgSendEmail" class="btn profile_contact_panel_button pull-right"   runat="server" Text="INVITE" />
          <%--<input  type="text" class="form-control" name="card holder" placeholder="Email"><br/>
          
          <button type="button" class="btn profile_contact_panel_button pull-right">INVITE</button>--%>
                 
          <div class="Profile_sidemenu_Name4 text-center" style="margin-top: 100px;">Share on your Media Wall</div><br/>
          <div class="text-center">

            <div class="fb-share-button" data-href="http://www.bbc.com/urdu/science-42912340" data-layout="button" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.bbc.com%2Furdu%2Fscience-42912340&amp;src=sdkpreparse"></a></div>
           <a href="https://www.linkedin.com/shareArticle?mini=true&url=http%3A//www.bbc.com/urdu/science-42912340&title=Education%20Everest&summary=I%20would%20like%20you%20to%20visit%20Education%20Everest&source="><img src="images/linkedin.png" style="width: 30px;height: 30px"></a>

            <a href="https://ctt.ec/82Mle"><img src="images/Twitter.png" style="width: 30px;height: 30px"" alt="Tweet: I would like you to visit https://ctt.ec/82Mle+ " /></a>
                  <a href="https://plus.google.com/share?url=http%3A//www.bbc.com/urdu/science-42912340"><img src="images/google.png" style="width: 30px;height: 30px"></a>       
              <%--<a href=""><img src="images/google.png" style="width: 30px;height: 30px"></a> &nbsp;--%>
                          <%--<a href="https://ctt.ec/82Mle"><img src="http://clicktotweet.com/img/tweet-graphic-4.png" alt="Tweet: I would like you to visit https://ctt.ec/82Mle+ " /></a>--%>

        </div>
        </div>
                <div class="col-md-1"></div>
      </div>
    </div>
  </div>
  </div>
            


    </div>
            
<br/>
    <div class="col-sm-9 text-center" style="margin-top:30px; "> 
<div class=" col-md-12">
<span class="col-md-6"><a  class="link myprofile_tabs myprofile_tabs_padding1 active" data-toggle="tab" data-target="#apptab">My Applications</a></span>
<span class="col-md-6"><a  class="link myprofile_tabs myprofile_tabs_padding2" data-toggle="tab" data-target="#paytab">My Payments</a></span>
</div>

<br/><br/><br/><br/>

    <div class="tab-content">
      <div class="tab-pane fade in active" id="apptab">

    <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
             <img src="images/uet_logo.png"></div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"> University of Engineering and Technology, Lahore Pakistan<small class="progress_text pull-right"><b> In Progress</b></small></div>
        </h4><br/>
        <small  class="NormalCharacterStyle_new2 margin_left margin_top">Civil Engineering &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Catagory A &nbsp; ...</small>
        <h4 class="blue_text margin_left">Application ID: 4643 13 244</h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text">16<sup>th</sup> Dec 2017</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text">16<sup>th</sup> Dec 2017</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text">In Progress</span>
      </div>
        </div>
        </div>
        <div class="divider margin_top"></div><br/>
        <a data-toggle="collapse" data-parent="#accordion" href="#details" class="pull-right NormalCharacterStyle18 margin_top" style="margin-right: 30px;"><b><span>VIEW</span></b></a>
      </div>

      <div id="details" class="panel-collapse collapse panel_shadow">
        <div class="panel-body">

                    <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href="#pinfo" data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Personal Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id="pinfo" class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px">Personal Details</div>
              <div class="Profile_sidemenu_Name4">Full Name:</div>
              <div class="Profile_sidemenu_Name4">Father Name:</div>
              <div class="Profile_sidemenu_Name4">CNIC (Faizan Elahi):</div>
              <div class="Profile_sidemenu_Name4">CNIC (Father):</div>
              <div class="Profile_sidemenu_Name4">Date of Birth:</div>
              <div class="Profile_sidemenu_Name4">Nationality:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div>Faizan Elahi</div>
              <div >Fazal Elahi</div>
              <div >35201 - 3567898 - 1</div>
              <div >35201 - 3567898 - 1</div>
              <div >1<sup>st</sup> january 1995 </div>
              <div >Pakistani </div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
              <img src="images/profile_pic2.png" class="pull-right" width="120" height="130px">
              
            </div>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">Contact Details</div>
              <div class="Profile_sidemenu_Name4">Current Address:</div>
              <div class="Profile_sidemenu_Name4">Parmanent Address:</div>
              <div class="Profile_sidemenu_Name4">Phone (Faizan Elahi):</div>
              <div class="Profile_sidemenu_Name4">Phone (Father):</div>
              <div class="Profile_sidemenu_Name4">Phone (Landline):</div>
              <div class="Profile_sidemenu_Name4">Zip Code/Postal Code:</div>
            </div>
            <div class="col-md-8">
              <div style="color: transparent;">Personal Details</div>
              <div >221 B Baker Street, Lahore Cantt, Pakistan</div>
              <div >221 B Baker Street, Lahore Cantt, Pakistan</div>
              <div >+92 321 1234567</div>
              <div >+92 321 1234567</div>
              <div >+92 321 1234567</div>
              <div >54000</div>
            </div>

          </div>
            <br/><br/>
            <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">Other Details</div>
              <div class="Profile_sidemenu_Name4">Valid Passport:</div>
              <div class="Profile_sidemenu_Name4">Valid VISA:</div>
            </div>
            <div class="col-md-8">
              <div  style="color: transparent;">Personal Details</div>
              <div >Yes</div>
              <div >Yes</div>
            </div>

          </div>

        </div>
      </div>
    </div>


                    <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href="#mychoice" data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Preferences<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id="mychoice" class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top:-30px">
          <h3 class="NormalCharacterStyle12">University of Engineering and Technology, Lahore Pakistan</h3>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-3 ">
              <div class="Profile_sidemenu_Name4">1. Civil Engineering</div>
              <div class="Profile_sidemenu_Name4">2. Civil Engineering</div>
              <div class="Profile_sidemenu_Name4">3. Chemical Engineering</div>
              <div class="Profile_sidemenu_Name4">4. Computer Engineering</div>
              <div class="Profile_sidemenu_Name4">5. transport Engineering</div>
              <div class="Profile_sidemenu_Name4">6. Petroleum Engineering</div>
              <div class="Profile_sidemenu_Name4">7. Civil Engineering</div>
              <div class="Profile_sidemenu_Name4">8. Civil Engineering</div>
              <div class="Profile_sidemenu_Name4">9. Civil Engineering</div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-3 ">
              <div class="Profile_sidemenu_Name4">Lahore</div>
              <div class="Profile_sidemenu_Name4">KSK</div>
              <div class="Profile_sidemenu_Name4">Lahore</div>
              <div class="Profile_sidemenu_Name4">KSK</div>
              <div class="Profile_sidemenu_Name4">Lahore</div>
              <div class="Profile_sidemenu_Name4">KSK</div>
              <div class="Profile_sidemenu_Name4">KSK</div>
              <div class="Profile_sidemenu_Name4">Lahore</div>
              <div class="Profile_sidemenu_Name4">KSK</div>

            </div>
            <div class="col-md-3 ">
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory B</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              <div class="Profile_sidemenu_Name4">Catagory A</div>
              
            </div>
            </div>

        </div>
      </div>
    </div>

                    <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href="#myeduinfo" data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Educational Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id="myeduinfo" class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px">Matriculation Details</div>
              <div class="Profile_sidemenu_Name4">Name of Board:</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Division:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div>BISE Lahore</div>
              <div >123456789</div>
              <div >2013</div>
              <div >400</div>
              <div >246</div>
              <div >65%</div>
              <div >A</div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
             
              
            </div>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">Intermediate (FSc) Details</div>
               <div class="Profile_sidemenu_Name4">Name of Board:</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Division:</div>
            </div>
            <div class="col-md-8">
              <div style="color: transparent;">Personal Details</div>
             <div>BISE Lahore</div>
              <div >123456789</div>
              <div >2013</div>
              <div >400</div>
              <div >246</div>
              <div >65%</div>
              <div >A</div>
            </div>

          </div>

        </div>
      </div>
    </div>


 <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href="#mytests" data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Test Results<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id="mytests" class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px">ECAT Details</div>
              <div class="Profile_sidemenu_Name4">Name of Board:</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Aggregate:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div>UET Lahore</div>
              <div >123456789</div>
              <div >2013</div>
              <div >400</div>
              <div >246</div>
              <div >65%</div>
              <div >65%</div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
             
              
            </div>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">NUST Details</div>
              <div class="Profile_sidemenu_Name4">Name of Board:</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Aggregate:</div>
            </div>
            <div class="col-md-8">
              <div style="color: transparent;">Personal Details</div>
               <div>NUST Lahore</div>
              <div >123456789</div>
              <div >2013</div>
              <div >400</div>
              <div >246</div>
              <div >65%</div>
              <div >65%</div>
            </div>

          </div>
           

        </div>
      </div>
    </div>



<div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href="#mydocs" data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Documents<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id="mydocs" class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">

            <div class="NormalCharacterStyle101 margin_left2">&#9656;B Form/CNIC of Student&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Faizan_Elahi_CNIC_Front</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>
        <br/>
         <div class="col-md-12">
              <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Faizan_Elahi_CNIC_Back</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>
            <br/><br/><br/><br/><br/><br/><br/><br/>
     <div class="profile_divider2" ></div><br/>



      <div class="NormalCharacterStyle101 margin_left2" >&#9656;B Form/CNIC of Father/Guardian&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_CNIC_Front</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>
        <br/>
         <div class="col-md-12">
              <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_CNIC_Back</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>


<br/><br/><br/><br/><br/><br/><br/><br/>
     <div class="profile_divider2" ></div><br/>



      <div class="NormalCharacterStyle101 margin_left2" >&#9656;Father/Guardian Income Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_Income_Certificate_Front</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>
        <br/>
         <div class="col-md-12">
              <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_Income_Certificate_Back</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>



<br/><br/><br/><br/><br/><br/><br/><br/>
     <div class="profile_divider2" ></div><br/>



      <div class="NormalCharacterStyle101 margin_left2" >&#9656;Matriculation Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_Income_Matriculation_Certificate</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>

          <br/><br/><br/><br/><br/>
     <div class="profile_divider2" ></div><br/>



      <div class="NormalCharacterStyle101 margin_left2" >&#9656;Intermediate Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_Income_Intermediate_Certificate</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>


            <br/><br/><br/><br/><br/>

     <div class="profile_divider2" ></div><br/>



      <div class="NormalCharacterStyle101 margin_left2" >&#9656;ECAT Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_Income_ECAT_Certificate</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>


          <br/><br/><br/><br/><br/>
     <div class="profile_divider2" ></div><br/>



      <div class="NormalCharacterStyle101 margin_left2" >&#9656;NUST Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
           <div class="col-md-12">
      <div class="col-md-1">
            <div class="upload_image_icon margin_top margin_left2"></div>
        </div>
        <div class="col-md-3">
            <div class="upload_documents_names margin_top3 margin_left3">Fazal_Elahi_Income_NUST_Certificate</div>
            <div  class="upload_documents_filesize_text margin_left3">197 KB</div>
            </div>
          </div>



          </div>
          
        </div>
      </div>
    </div>




        </div>
      </div>
    </div>
    <br/><br/>
          
          <asp:Button ID="btnFileAdmission" runat="server" Text="File Admission Application" class="btn button_bg NormalCharacterStyle " OnClick="btnFileAdmission_Click" />
<%-- <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">File Admission Application</span></button>--%>

</div>

 </form>
      <div class="tab-pane fade in text-left""  id="paytab">

      <h3 class="NormalCharacterStyle12" style="margin-top: -20px">My Banks & Credit Cards</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>



      <div class="payment_card_bg">

        <div class="payment_divider"></div>
        <button type="button" class=" btn profile_contact_panel_button " style="margin-top: 355px;margin-left: 810px;">Add Bank</button>
      </div>
<br/><br/><br/>

<h3 class="NormalCharacterStyle12" style="margin-top: -20px">My Banks & Credit Cards</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>

<br/>

<div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
             <img src="images/uet_logo.png" ></div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"> University of Engineering and Technology, Lahore Pakistan<small class="rejected_text pull-right"><span class="caution_icon"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> Pending</b></small></div>
        </h4>
        <div  class="NormalCharacterStyle_new2 margin_left margin_top">Civil Engineering &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Catagory A &nbsp; ...</div>
        <h4 class="blue_text margin_left">Application ID: 4643 13 244</h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text">16<sup>th</sup> Dec 2017</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text">16<sup>th</sup> Dec 2017</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text">Pending</span><small class="NormalCharacterStyle102 pull-right"><b>PKR 5430</b></small>
      </div>
        </div>
        </div><br/>
        <div class="divider"></div>
        <div class="pull-right margin_top"><span><button type="button"  class=" btn make_payment_button_bg">Make Payment</button></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="NormalCharacterStyle18" style="margin-right: 30px;"><b>VIEW INVOICE</b></a></div>
      </div>

      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>
       
       <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
             <img src="images/image.png" ></div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"> Lahore University of Management and Sciences, Lahore Pakistan<small class="progress_text pull-right"><span class="check_icon"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Submitted</b></small></div>
        </h4>
        <div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>
        <h4 class="blue_text margin_left">Application ID: 4643 13 244</h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text">16<sup>th</sup> Dec 2017</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text">16<sup>th</sup> Dec 2017</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text">Submitted</span><small class="NormalCharacterStyle102 pull-right"><b>PKR 5430</b></small>
      </div>
        </div>
        </div><br/>
        <div class="divider"></div><br/>
        <a href="" class="pull-right NormalCharacterStyle18" style="margin-right: 30px;"><b>VIEW INVOICE</b></a>
      </div>

      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>



   
    <br/><br/>
         <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">File Admission Application</span></button>
         <br/><br/><br/><br/>


</div>

</div>

<br/>

  </div>
      </div>
</div>
</body>
</html>



