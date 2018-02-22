<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Search_Results.aspx.cs"  EnableEventValidation="false" Inherits="Search_Results" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <title>Results</title>
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
    <style>
        .starrating {
            width: 25px;
            height:25px;
            cursor: pointer;
            background-repeat: no-repeat;
            display: block;
        }
        .filledstars{
                        background-image:url("images/filledstar.png");

                    }
        .emptystars{
            
            background-image:url("images/emptystar.png")
            
        }
        .waitingstars{
            background-image:url("images/waitingstar.png")
        }

        
    </style>
</head>
    <form id="form1" runat="server">
<div class="navbar-inverse" style="border-radius: 0px;height: 60px;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#"><img src="images/Logo_1_.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    
       <span> <asp:TextBox ID="TextBox1" runat="server" style="height:32px"></asp:TextBox></span>
        
          <%--<input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">--%>
        </div>
          <span><asp:imagebutton ID="btnSearch" ImageUrl="images/search_button.png" style="margin-top: 4px;" runat="server" OnClick="btnSearch_Click"></asp:imagebutton></span>
          <span><asp:imagebutton ID="btnFilter" ImageUrl="images/filter_button.png" style="margin-top: 4px;margin-left: -10px" runat="server" ></asp:imagebutton></span>

         <%--<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"  />--%>
          <%--<asp:Button ID="btnFilter" runat="server" OnClick="btnFilter_Click" Text="Filter"  />--%>
                
        <%--<span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>--%>
        <%--<span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>--%>
      </div>
     <%-- <ul class="nav navbar-nav navbar-right">
        <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>
        <li class="dropdown" style="height: 60px;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px;margin-right: 10px;border-bottom: 1px solid white;">Faizan</span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
          <ul class="dropdown-menu myprofile_dropdown">
            <li><a href="My_Profile.aspx" class="myprofile_dropdown_link NormalCharacterStyle25">Profile</a></li>
             <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>
            <li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>
          </ul>
        </li>
      </ul>--%>
    </div><!-- /.navbar-collapse -->
</div>


<%--Filter Starts here--%>
        


<%--Filter Ends here--%>



<body style="background : #F2F2F2;
  background : rgba(242, 242, 242, 1);">

<br/>
    
<div class="container-fluid text-center">    
  <div class="row" style="height: 100%;" >
    <div class="col-md-6 sidenav text-left">

      <div class="NormalCharacterStyle16" style="margin-top: -20px">22 Results found related to “UET”</div>
    <div class="line_3_" style="margin-top: 5px;"></div>
    <br/>
    <%--<div><button type="button" class="btn btn-warning">UET&nbsp;&nbsp;
          <span class="glyphicon glyphicon-remove"></span> 
        </button>&nbsp;<button type="button" class="btn btn-success">Engineering&nbsp;&nbsp;
          <span class="glyphicon glyphicon-remove"></span> 
        </button>&nbsp;<button type="button" class="btn btn-success">Private&nbsp;&nbsp;
          <span class="glyphicon glyphicon-remove"></span> 
        </button></div>--%>

        <%--panels start here--%>

        

        <%--panels end here--%>

        <br/>


        <%--<asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>--%>
        <asp:Repeater ID="rptSearch" runat="server">
           <ItemTemplate>
        
    
        <div class="panel panel-default panel_shadow results_cards">
          <div class="container-fluid row">
          <div class="col-md-2">
              <img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">
            </div>
            <div class="col-md-10 text-left">
              <div class="NormalCharacterStyle_new1"><tr>
            <td>
                <asp:Label ID="lblUniversity" runat="server" Text='<%# Eval("Name") %>' />
                <%--Rating Started here--%>
                  
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <ajaxtoolkit:rating ID="Rating1" runat="server"
                         StarCssClass="starrating"
                         EmptyStarCssClass="emptystars"
                         FilledStarCssClass="filledstars"
                         WaitingStarCssClass="waitingstars"
                         
                        
                        ></ajaxToolkit:Rating> &nbsp;&nbsp;<br />
                    
                    <asp:Label ID="lblRating" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>--%>
              <%--Rating Ends here--%>
            </td>
            
        </tr>
                  <span class="rating_img"></span><span><img src="images/fav_icon.png" class="pull-right" style="margin-top: 5px;"></span>

              </div>
             
                   <div class="NormalCharacterStyle211"><span><img src="images/location_icon2.png"></span> Grand Trunk Road, Lahore</div>

              <div class="pull-right"><span class="NormalCharacterStyle213">Apply Before:</span><span class="NormalCharacterStyle212"> 24th Dec 2017</span></div>
              <br/>
              <div class="NormalCharacterStyle214">Admissions Open</div>
              <div class="NormalCharacterStyle213">21 Degree Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6 Courses</div>
			</div>
            </div></div>
           </ItemTemplate>
        </asp:Repeater>


                   <%--<div class="panel panel-default panel_shadow results_cards">
          <div class="container-fluid row">
          <div class="col-md-2">
              <img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">
            </div>
            <div class="col-md-10 text-left">
              <div class="NormalCharacterStyle_new1">UET, Lahore Pakistan<span class="rating_img"></span><span><img src="images/fav_icon.png" class="pull-right" style="margin-top: 5px;"></span></div>
              <div class="NormalCharacterStyle211"><span><img src="images/location_icon2.png"></span> Grand Trunk Road, Lahore</div>

              <div class="pull-right"><span class="NormalCharacterStyle213">Apply Before:</span><span class="NormalCharacterStyle212"> 24th Dec 2017</span></div>
              <br/>
              <div class="NormalCharacterStyle214">Admissions Open</div>
              <div class="NormalCharacterStyle213">21 Degree Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6 Courses</div>
			</div>
            </div></div>



                   <div class="panel panel-default panel_shadow results_cards">
          <div class="container-fluid row">
          <div class="col-md-2">
              <img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">
            </div>
            <div class="col-md-10 text-left">
              <div class="NormalCharacterStyle_new1">UET, Lahore Pakistan<span class="rating_img"></span><span><img src="images/fav_icon.png" class="pull-right" style="margin-top: 5px;"></span></div>
              <div class="NormalCharacterStyle211"><span><img src="images/location_icon2.png"></span> Grand Trunk Road, Lahore</div>

              <div class="pull-right"><span class="NormalCharacterStyle213">Apply Before:</span><span class="NormalCharacterStyle212"> 24th Dec 2017</span></div>
              <br/>
              <div class="NormalCharacterStyle214">Admissions Open</div>
              <div class="NormalCharacterStyle213">21 Degree Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6 Courses</div>
			</div>
            </div></div>



                   <div class="panel panel-default panel_shadow results_cards">
          <div class="container-fluid row">
          <div class="col-md-2">
              <img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">
            </div>
            <div class="col-md-10 text-left">
              <div class="NormalCharacterStyle_new1">UET, Lahore Pakistan<span class="rating_img"></span><span><img src="images/fav_icon.png" class="pull-right" style="margin-top: 5px;"></span></div>
              <div class="NormalCharacterStyle211"><span><img src="images/location_icon2.png"></span> Grand Trunk Road, Lahore</div>

              <div class="pull-right"><span class="NormalCharacterStyle213">Apply Before:</span><span class="NormalCharacterStyle212"> 24th Dec 2017</span></div>
              <br/>
              <div class="NormalCharacterStyle214">Admissions Open</div>
              <div class="NormalCharacterStyle213">21 Degree Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6 Courses</div>
			</div>
            </div></div>



                   <div class="panel panel-default panel_shadow results_cards">
          <div class="container-fluid row">
          <div class="col-md-2">
              <img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: 0px;margin-top: 10px;">
            </div>
            <div class="col-md-10 text-left">
              <div class="NormalCharacterStyle_new1">UET, Lahore Pakistan<span class="rating_img"></span><span><img src="images/fav_icon.png" class="pull-right" style="margin-top: 5px;"></span></div>
              <div class="NormalCharacterStyle211"><span><img src="images/location_icon2.png"></span> Grand Trunk Road, Lahore</div>

              <div class="pull-right"><span class="NormalCharacterStyle213">Apply Before:</span><span class="NormalCharacterStyle212"> 24th Dec 2017</span></div>
              <br/>
              <div class="NormalCharacterStyle214">Admissions Open</div>
              <div class="NormalCharacterStyle213">21 Degree Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6 Courses</div>
			</div>
            </div></div>--%>




        </div>
         <div class="col-md-6 filter_results_details_callout right  text-left uni_details_page_bg_2_" style="margin-top: -20px;height: 100%">
         <div class="">
          <div class="col-md-2">
              <img src="images/uet_logo.png" style="width: :90px;height: 90px;margin-left: -5px;margin-top: 10px;">
            </div>
            <div class="col-md-10 text-left" style="margin-top: 10px">
              <div class="NormalCharacterStyle215">University of Engineering and Technology, Lahore Pakistan</div>
              <div class="NormalCharacterStyle211"><span><img src="images/location_icon2.png"></span> Grand Trunk Road, Lahore</div>
              <div><span><img src="images/rating.png"></span><span class="NormalCharacterStyle216 pull-right"> Admission Open</span></div>
              <br/>
              <div><span> <button type="button" class="btn filter_results_apply_button_bg_2_">Apply</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=""><span class="NormalCharacterStyle217">View Prospectus</span></a></div>

            </div>
          </div><br/>

          <div class="line_3_" style="margin-top: 135px;"></div>
          <br/>
          <div class="col-md-12" >
            <div class="col-md-7">
            <div class="NormalCharacterStyle218">About
                <asp:Label ID="lblUniversity2" runat="server" Text="Label"></asp:Label></div>
               
            <div class="panel_text">
               
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.
            </div>
            </div>
            <div class="col-md-2">
            <span class="video_icon_2_"></span>
</div>
          </div>  


          <div class="col-md-12" style="margin-top: 30px;">
            <div class="NormalCharacterStyle218">Criteria</div>
           
            <div class="panel_text">
                <asp:Label ID="lblCriteria" runat="server" Text="Label"></asp:Label>
              <img src="images/image9.png">
            </div>
          </div>  


          <div class="col-md-12" style="margin-top: 30px;">
            <div class="NormalCharacterStyle218">Admission Documents</div>
           
            <div class="panel_text">
               
                <asp:Label ID="lblAdmissionDocuments" runat="server" Text="Label"></asp:Label>
            </div>
          </div>  



          <div class="col-md-12" style="margin-top: 30px;">
            <div class="NormalCharacterStyle218">Fee Structure</div>
           
            <div class="panel_text">
                <asp:Label ID="lblFeeStructure" runat="server" Text="Label"></asp:Label>

               
            </div>
          </div>  
<div class="pull-right" style="margin-top: 50px;"><span> <button type="button" class="btn filter_results_apply_button_bg_2_">Apply</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=""><span class="NormalCharacterStyle217">View Prospectus</span></a><br/><br/><br/><br/>  </div> 

  </div>
    </div>
  </div> 
        </form>
        </body>
</html>
  
