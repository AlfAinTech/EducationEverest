<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="My_Profile.aspx.cs" Inherits="My_Profile" %>

<%@ Register Src="~/UserControls/ApplicationRecords.ascx" TagPrefix="uc1" TagName="ApplicationRecords" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <link href="~/Content/img/EducationEverestIcon.jpg" rel="shortcut icon" type="image/jpg" />
     <title>My Profile</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/File_admission_application.css">
    <link href="https://fonts.googleapis.com/css?family=Karma|Maven+Pro|Oswald" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script type="text/javascript">
      $(function () {
          var links = $('a.link').click(function () {
              links.removeClass('active');
              $(this).addClass('active');
          });
      });
  </script>
</head>
    <body>
    <form id="form" runat="server">
<div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="Dashboard.aspx"><img src="images/Logo_1_.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <li><a href="https://educationeverest.org/" target="_blank" style="font-size: 20px;top: 6px;">Home </a></li>
        <li><a href="Dashboard.aspx" style="font-size: 20px;top: 6px;">Dashboard </a></li>
        <li style="color: transparent;">home</li>
      </ul>
      <div class="navbar-form navbar-left">
        <div class="form-group" style="margin-top:-40px">
          <asp:TextBox ID="TextBox1" runat="server" style="height:32px"></asp:TextBox>
        
          <%--<input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">--%>
        </div>
          <span><asp:imagebutton ID="btnSearch" ImageUrl="images/search_button.png" style="margin-top: 4px;" runat="server" OnClick="btnSearch_Click"></asp:imagebutton></span>
          <span><asp:imagebutton ID="btnFilter" ImageUrl="images/filter_button.png" style="margin-top: 4px;margin-left: -10px" runat="server" OnClick="btnFilter_Click" ></asp:imagebutton></span>

        <%--<span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>--%>

      </div>


      <ul class="nav navbar-nav navbar-right">
        <%--<li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>--%>
        <li class="dropdown" style="height: 60px;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px;margin-right: 10px;border-bottom: 1px solid white;">
              <asp:Label ID="lblLoggedUser" runat="server" Text=""  style="font-size:20px;color:#0094ff;border-bottom:1px solid;border-color:white"></asp:Label>
          </span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.aspx" class="myprofile_dropdown_link NormalCharacterStyle24">Profile</a></li>
             <li role="separator" class="profile_divider"></li>
            <%--<li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>--%>
            <%--<li><a href="Login.aspx"  class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>--%>
              <li><asp:LinkButton ID="logout" CausesValidation="false" OnClick="logout_Click" runat="server">
                                        <i class="myprofile_dropdown_link NormalCharacterStyle24"></i>Logout
                                    </asp:LinkButton></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
</div>



   <%-- code to share on facebook starts here--%>
   <div id="fb-root"></div>
<script>(function (d, s, id) {
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
         
    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 sidenav text-left profile_sidemenu">

      <div class="panel panel-default text-center ">
  <div class=" profile_card_bg_2" >
    <div class="pull-right" style="margin-right: 25px;margin-top: 10px;"><%--<a href="#" class="edit_icon"></a>--%></div>
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
      <div class="panel-heading">
        <div class="Profile_sidemenu_Name3 text-left">Contact Details<span class="pull-right" style="margin-right: 10px;"><%--<a href="" class="edit_icon_1_"></a>--%></span></div>
        <br/>
        <div class="profile_panel_text"><span class="letter_icon"></span><span style="margin-left: 30px;"><asp:Label ID="email2" runat="server" Text="Label"></asp:Label></span></div> <br />
        <div class="profile_panel_text"><span class="phone_icon"></span><span style="margin-left: 30px;"><asp:Label ID="contact" runat="server" Text="Label"></asp:Label></span></div>
       <br /> 
        <div class="profile_panel_text"><span class="location_icon"></span><span style="margin-left: 30px;"><asp:Label ID="city2" runat="server" Text="Label"></asp:Label></span></div>

      </div>
          </div>

 <div class="panel panel-default">
      <div class="panel-heading text-center" >
        <div class="Profile_sidemenu_Name3 text-left">Payment Details<span class="pull-right" style="margin-right: 10px;"><%--<a href="" class="edit_icon_1_"></a>--%></span></div>
                <div class="profile_panel_text">
                <div>Total Spendings</div>
                <div class="profile_panel_text2 ">PKR <strong>6999</strong></div>
                </div>
                <div class="profile_panel_text">
                <div class="text-left">Recent Card</div><br/>
                <div>352 ** ***** ***** *** 01</div>
                <div>exp 12/17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***</div>
                </div>
      </div>
          </div>

  <%--<a href="">
          <div class="panel panel-default panel_shadow">
    <div class="panel-heading profile_card_small" style="height: 60px">
     <div class="Profile_sidemenu_Name4 margin_top">Settings<span class="icon-arrow-right pull-right"><span class="glyphicon glyphicon-chevron-right text-colour"></span></span></div>
 </div>
          </div></a>--%>

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
             
            <asp:TextBox ID="txtEmailSend" class="form-control"  placeholder="Email"  runat="server" ></asp:TextBox>
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
    <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12 text-center" style="margin-top:30px; "> 
<div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
<span> <a  class="active col-lg-6 col-md-6 col-sm-6 col-xs-6 link myprofile_tabs myprofile_tabs_padding1" data-toggle="tab" data-target="#apptab">My Applications</a></span>
<span><a  class="col-lg-6 col-md-6 col-sm-6 col-xs-6 link myprofile_tabs myprofile_tabs_padding2" data-toggle="tab" data-target="#paytab">My Payments</a></span>
</div>
<br/><br/><br/><br/>
    <div class="tab-content">
      <div class="tab-pane fade in active" id="apptab">
           <h3 class="NormalCharacterStyle12 text-left">My Applications</h3>
          <uc1:ApplicationRecords runat="server" ID="ApplicationRecords" />
    <br/><br/>
          
          <asp:Button ID="btnFileAdmission" runat="server" Text="File Admission Application" class="btn button_bg NormalCharacterStyle " OnClick="btnFileAdmission_Click" />
<%-- <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">File Admission Application</span></button>--%>
</div>
      <div class="tab-pane fade in text-left""  id="paytab">

      <h3 class="NormalCharacterStyle12">My Banks & Credit Cards</h3>

<br/>
          
<asp:Repeater ID="PaymentsList" runat="server" OnItemDataBound="PaymentsList_ItemDataBound" ><ItemTemplate>
    <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left" style="border-bottom:1px solid #a3a3a3; padding:2% 2%">
          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
             <asp:Image ID="logo" runat="server"  />

          </div>
             <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
        <h4 class="panel-title">
                  <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus_").ToString()=="pending" || Eval("CurrentStatus_").ToString()=="rejected"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("CurrentStatus") %></b></small></div>
        </h4>
        <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
        <h4 class="blue_text margin_left">Application ID: <%# Eval("appID") %></h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text"><%# Eval("ApplicationDate") %></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text"><%# Eval("university.deadLine") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text"><%# Eval("CurrentStatus") %></span><small class="NormalCharacterStyle102 pull-right"><b>PKR <%# Eval("Fees") %></b></small>
      </div>
        </div>
        </div><br/>
        
        <%--<a href="" class="pull-right NormalCharac terStyle18" style="margin-right: 30px;"><b>VIEW</b></a>--%>
      </div>

      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>
</ItemTemplate></asp:Repeater>
          


   
    <br/><br/>
         <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">File Admission Application</span></button>
         <br/><br/><br/><br/>
          

</div>
        
</div>

<br/>
        
  </div>
      </div>
    </div>
  </form>  
</body>
</html>