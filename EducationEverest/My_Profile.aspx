<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="My_Profile.aspx.cs" Inherits="My_Profile" %>

<%@ Register Src="~/UserControls/ApplicationRecords.ascx" TagPrefix="uc1" TagName="ApplicationRecords" %>
<%@ Register Src="~/UserControls/TopNavBar.ascx" TagPrefix="uc1" TagName="TopNavBar" %>
<%@ Register Src="~/UserControls/PaymentTiles.ascx" TagPrefix="uc1" TagName="PaymentTiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="Content/img/EducationEverestIcon.jpg" rel="shortcut icon" type="image/jpg" />
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
    
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script type="text/javascript">
      $(function () {
          var links = $('a.link').click(function () {
              links.removeClass('active');
              $(this).addClass('active');
          });
      });
      function browse(e) {

            document.getElementById('<%= FileUpload1.ClientID %>').click();
            e.preventDefault();
        }
      $(document).ready(function () {
          var x = location.href;
          if (x.includes("pays=true")) {
              document.getElementById("link_payment").click();
          }

          (function (d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.12&appId=516503188742935&autoLogAppEvents=1';
              fjs.parentNode.insertBefore(js, fjs);
          }(document, 'script', 'facebook-jssdk'));
      });
  </script>
    
</head>
    <body>
        <div id="fb-root"></div>

    <form id="form" runat="server">
        <uc1:TopNavBar runat="server" ID="TopNavBar" />

    <div class="container-fluid col-sm-12 header2 NormalCharacterStyle25">
  
    <div style="margin-top: 12px"><a class="breadcrumbLinks" href="Dashboard.aspx">Dashboard ></a> <a class="breadcrumbLinks" href="My_Profile.aspx">Profile</a></div>

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
          <asp:Image runat="server" ID="ibtn_FileUpload"  ImageUrl="~/images/profile_pic.png" CssClass="profile_image" Style="cursor: pointer" onclick="browse()" />
      <%--<div class="profile_image" onclick="browse()">    </div>--%>
            <asp:FileUpload ID="FileUpload1" accept="image/*" Style="display: none;" ClientIDMode="Static" runat="server" onchange="this.form.submit()" />
            <asp:Button ID="btn_UplaodImage" ValidationGroup="validateFile" Style="display: none;" OnClick="btn_UplaodImage_Click" runat="server" />
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

 <%--<div class="panel panel-default">
      <div class="panel-heading text-center" >
        <div class="Profile_sidemenu_Name3 text-left">Payment Details<span class="pull-right" style="margin-right: 10px;"></span></div>
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
          </div>--%>

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
              <div class="row">
                  <div class="col-md-4"></div>
                  <div class="col-md-1">
                      <a rel="noopener noreferrer" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://educationeverest.com/"><img src="images/facebook_icon2.png" style="width: 30px;height: 30px"" alt="I would like you to visit http://educationeverest.com/ " /></a>
                  </div>
                  <div class="col-md-1">
                      <a rel="noopener noreferrer" target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&url=http%3A//educationeverest.com&title=EducationEverest&summary=&source="><img src="images/linkedin.png" style="width: 30px;height: 30px"" alt="I would like you to visit http://educationeverest.com/ " /></a>
                  </div>
                  <div class="col-md-1">
                      <a rel="noopener noreferrer" target="_blank" href="https://plus.google.com/share?url=http://educationeverest.com/"><img src="images/google_icon2.png" style="width: 30px;height: 30px"" alt="I would like you to visit http://educationeverest.com/ " /></a>
                  </div>
                  <div class="col-md-1">
                      <a rel="noopener noreferrer" target="_blank" href="https://twitter.com/share?url=http://educationeverest.com/"><img src="images/Twitter.png" style="width: 30px;height: 30px"" alt="Tweet: I would like you to visit http://educationeverest.com/ " /></a>
                  </div>
                  <div class="col-md-4"></div>
              </div>
            
           
              
              

            
                  
              <!-- Place this tag in your head or just before your close body tag. -->
            
              
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
<span><a id="link_payment"  class="col-lg-6 col-md-6 col-sm-6 col-xs-6 link myprofile_tabs myprofile_tabs_padding2" data-toggle="tab" data-target="#paytab">My Payments</a></span>
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
          <uc1:PaymentTiles runat="server" ID="PaymentTiles" />

          

</div>
        
</div>

<br/>
        
  </div>
      </div>
    </div>
  </form>  
</body>
</html>