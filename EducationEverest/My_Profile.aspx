<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="My_Profile.aspx.cs" Inherits="My_Profile" %>

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
    <body>
    <form id="form" runat="server">
<div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="images/Logo_1_.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <li><a href="https://educationeverest.org/" target="_blank" style="font-size: 20px;top: 6px;">Home </a></li>
        <li><a href="Dashboard.aspx"><img src="images/header_dashboard_button_1_.png" style="margin: -15px;height: 65px"></a></li>
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
        <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>
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

    <asp:Repeater ID="ChoicesList" runat="server" OnItemDataBound="ChoicesList_ItemDataBound">
        <ItemTemplate>
    <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
            <asp:Image ID="logo" runat="server"  />

          </div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus").ToString()=="pending"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("CurrentStatus") %></b></small></div>
        </h4>
        <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
        <h4 class="blue_text margin_left">Application ID: <%# Eval("appID") %></h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text"><%# Eval("ApplicationDate") %></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text"><%# Eval("university.deadLine") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text"><%# Eval("CurrentStatus") %></span>
      </div>
        </div>
        </div><br/>
        <div class="divider"></div><br/>
        <a data-toggle="collapse" data-parent="#accordion" href='<%# "#details"+Container.ItemIndex %>' class="pull-right NormalCharacterStyle18 margin_top" style="margin-right: 30px;"><b>VIEW</b></a>
      </div>
      <div id='<%# "details"+Container.ItemIndex %>' class="panel-collapse collapse panel_shadow">
        <div class="panel-body">
            <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#pinfo"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Personal Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "pinfo"+Container.ItemIndex %>'  class="panel-collapse collapse" >
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
              <div>
                 <asp:Label ID="Name" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="FatherName" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="StudentCNIC" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="FatherCNIC" runat="server"></asp:Label></div>
              <div ><asp:Label ID="DOB" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="Nationality" runat="server"></asp:Label></div>
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
              <div ><asp:Label ID="CurrentAddress" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="ParmanentAddress" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="phoneStudent" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="phoneFather" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="landLine" runat="server" Text="Label"></asp:Label></div>
             
              <div ><asp:Label ID="PostalCode" runat="server" Text="Label"></asp:Label></div>
            </div>

          </div>
        </div>
      </div>
    </div>
             <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#mychoice"+Container.ItemIndex %>'  data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Preferences<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "mychoice"+Container.ItemIndex %>' class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top:-30px">
          <h3 class="NormalCharacterStyle12"><%# Eval("university.Name") %></h3>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
              <asp:Repeater ID="PreferencesList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 ">
                            <div class="Profile_sidemenu_Name4"><%# Container.ItemIndex+"." %> <%# Eval("Department.Department_Name") %></div>
                  
              
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-3 ">
                              <div class="Profile_sidemenu_Name4"> <%# Eval("Campus.Campus_Name") %></div>

                            </div>
            <div class="col-md-3 ">
              <div class="Profile_sidemenu_Name4">Catagory  <%# Eval("ProgrammCategory.Category.Category_Name") %></div>
              
            </div>
              </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
      </div>
    </div>
             <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#myeduinfo"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Educational Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "myeduinfo"+Container.ItemIndex %>' class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px">Matriculation/O-Level Details</div>
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
              <div><asp:Label ID="MetricBoard" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricRollNo" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricYear" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricTotalMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricObtainedMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricPercentage" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricGrades" runat="server" ></asp:Label></div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
             
              
            </div>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">Intermediate/ A-Level Details</div>
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
            <div><asp:Label ID="InterBoard" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterRollNo" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterYear" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterTotalMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterObtainedMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterPercentage" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterGrades" runat="server" ></asp:Label></div>
            </div>

          </div>

        </div>
      </div>
    </div>
             <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#mytests"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Test Results<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "mytests"+Container.ItemIndex %>'class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
            <asp:Repeater ID="TestResultList" runat="server"><ItemTemplate>
          <div class="col-md-12 text-left" style="margin-top: 10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px"><%# Eval("Test_Name")  %> Details</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Aggregate:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div ><%# Eval("Rollno")  %></div>
              <div ><%# Eval("Passing_Year")  %></div>
              <div ><%# Eval("Total_Marks")  %></div>
              <div ><%# Eval("Obtained_Marks")  %></div>
              <div ><%# Eval("Percentage")  %> %</div>
              <div ><%# Eval("Aggregate")  %> %</div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
             
              
            </div>
          </div>
          <br/><br/><br/>
           </ItemTemplate></asp:Repeater>

        </div>
      </div>
    </div>
            <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#mydocs"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Documents<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "mydocs"+Container.ItemIndex %>' class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
        
          
          <div class="col-md-12 text-left" style="margin-top: -10px">

            <div class="NormalCharacterStyle101 margin_left2">&#9656;B Form/CNIC of Student&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
              <asp:Repeater ID="studentCNICList" runat="server"><ItemTemplate>
              <div class="col-md-12">
              <div class="col-md-1">
                    <div class="upload_image_icon margin_top margin_left2"></div>
                </div>
                <div class="col-md-3">
                    <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                    <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                    </div>
                  </div>
                    <br/>
                  </ItemTemplate></asp:Repeater>

            <br/><br/><br/><br/><br/><br/><br/><br/>
            <div class="profile_divider2" ></div><br/>
              
            <div class="NormalCharacterStyle101 margin_left2" >&#9656;B Form/CNIC of Father/Guardian&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
            <asp:Repeater ID="FatherCNICList" runat="server"><ItemTemplate>
              <div class="col-md-12">
              <div class="col-md-1">
                    <div class="upload_image_icon margin_top margin_left2"></div>
                </div>
                <div class="col-md-3">
                    <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                    <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                    </div>
                  </div>
                    <br/>
                  </ItemTemplate></asp:Repeater>


            <br/><br/><br/><br/><br/><br/><br/><br/>
                 <div class="profile_divider2" ></div><br/>
              <div class="NormalCharacterStyle101 margin_left2" >&#9656;Father/Guardian Income Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
             <asp:Repeater ID="FatherIncomeCertiList" runat="server"><ItemTemplate>
                  <div class="col-md-12">
                  <div class="col-md-1">
                        <div class="upload_image_icon margin_top margin_left2"></div>
                    </div>
                    <div class="col-md-3">
                        <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                        <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                        </div>
                      </div>
                        <br/>
                      </ItemTemplate></asp:Repeater>


            <br/><br/><br/><br/><br/><br/><br/><br/>
             <div class="profile_divider2" ></div><br/>
            <div class="NormalCharacterStyle101 margin_left2" >&#9656;Matriculation/ O-Leve Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
             <asp:Repeater ID="MatricCertiList" runat="server"><ItemTemplate>
                  <div class="col-md-12">
                  <div class="col-md-1">
                        <div class="upload_image_icon margin_top margin_left2"></div>
                    </div>
                    <div class="col-md-3">
                        <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                        <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                        </div>
                      </div>
                        <br/>
                      </ItemTemplate></asp:Repeater>

              <br/><br/><br/><br/><br/>
              <div class="profile_divider2" ></div><br/>

              <div class="NormalCharacterStyle101 margin_left2" >&#9656;Intermediate/ A-Level Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
               <asp:Repeater ID="InterCertiList" runat="server"><ItemTemplate>
                  <div class="col-md-12">
                  <div class="col-md-1">
                        <div class="upload_image_icon margin_top margin_left2"></div>
                    </div>
                    <div class="col-md-3">
                        <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                        <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                        </div>
                      </div>
                        <br/>
                      </ItemTemplate></asp:Repeater>

              <br/><br/><br/><br/><br/>
              <div class="profile_divider2" ></div><br/>

              <asp:Repeater ID="TestResultDocList" OnItemDataBound="TestResultDocList_ItemDataBound" runat="server"><ItemTemplate>
                  <div class="NormalCharacterStyle101 margin_left2" >&#9656;<%# Eval("TestName")  %> Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
               <div class="col-md-12">
          <div class="col-md-1">
                <div class="upload_image_icon margin_top margin_left2"></div>
            </div>
            <div class="col-md-3">
                <div class="upload_documents_names margin_top3 margin_left3"><asp:Label ID="documentName" runat="server" ></asp:Label></div>
                <div  class="upload_documents_filesize_text margin_left3"><asp:Label ID="documentSizeInKB" runat="server" ></asp:Label> KB</div>
                </div>
              </div>
                  <br/><br/><br/><br/><br/>
             <div class="profile_divider2" ></div><br/>
         </ItemTemplate></asp:Repeater>
            </div></div></div>
            
    </div>
                </div></div></div>
</ItemTemplate></asp:Repeater>
    <br/><br/>
          
          <asp:Button ID="btnFileAdmission" runat="server" Text="File Admission Application" class="btn button_bg NormalCharacterStyle " OnClick="btnFileAdmission_Click" />
<%-- <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">File Admission Application</span></button>--%>

</div>

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
          
<asp:Repeater ID="PaymentsList" runat="server" OnItemDataBound="PaymentsList_ItemDataBound" ><ItemTemplate>
    <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
             <asp:Image ID="logo" runat="server"  />

          </div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus").ToString()=="pending"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("CurrentStatus") %></b></small></div>
        </h4>
        <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
        <h4 class="blue_text margin_left">Application ID: <%# Eval("appID") %></h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text"><%# Eval("ApplicationDate") %></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text"><%# Eval("university.deadLine") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text"><%# Eval("CurrentStatus") %></span><small class="NormalCharacterStyle102 pull-right"><b>PKR <%# Eval("Fees") %></b></small>
      </div>
        </div>
        </div><br/>
        <div class="divider" style="width:900px"></div><br/>
        <a href="" class="pull-right NormalCharac terStyle18" style="margin-right: 30px;"><b>VIEW</b></a>
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



