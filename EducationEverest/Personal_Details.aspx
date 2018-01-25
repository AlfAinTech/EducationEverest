<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Personal_Details.aspx.cs" Inherits="Personal_Details" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
     <input id="student_name" class="input_name" type="text" name="name"  placeholder="Name (according to matric certificate)" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_name" class="input_father_name" type="text" name="father_name" placeholder="Father Name (according to matric certificate)" runat="server" />
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="cnic" class="input_CNIC_no" type="text" name="CNIC" placeholder="Your CNIC No" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_cnic" class="input_father_CINC_no" type="text" name="father_CNIC" placeholder="Father CNIC No" runat="server" />
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="dob" class="input_DOB" type="text" name="dob"  placeholder="Date of Birth" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="nationality" class="input_nationality" type="text" name="nationality"  placeholder="Nationality" runat="server" />
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
</asp:Content>

