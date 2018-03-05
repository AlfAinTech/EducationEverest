<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Personal_Detail.aspx.cs" Inherits="Personal_Detail" %>
<%@ MasterType virtualpath="~/Client.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function browse(e) {
            
            document.getElementById('<%= FileUpload1.ClientID %>').click();
            e.preventDefault();
        }

        function UploadFile() {
            alert("hello there");
            
        }
    </script>
    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Personal Details</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>

      <div class="panel panel-default panel_shadow">
      <a id="menu_toggle" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle10 margin_top">Personal Information<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id="collapse2" class="panel-collapse panel-heading collapse">
      	<div class="panel_divider"></div>
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
     <input id="student_cnic" class="input_CNIC_no" type="text" name="CNIC" placeholder="Your CNIC No" runat="server"   />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_cnic" class="input_father_CINC_no" type="text" name="father_CNIC" placeholder="Father CNIC No" runat="server"  />
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="dob" class="input_DOB" type="date" name="dob" placeholder="Date of Birth" min="1980-01-01" max="2005-01-01" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="nationality" class="input_nationality" type="text" name="nationality"  placeholder="Nationality" runat="server" />
    </div>
</div>


</div>
 <div class="col-md-2 pull-right">
     <%--<asp:ImageButton runat="server" ImageUrl="~/images/fileUpload.png" ID="ibtn_FileUpload" OnClientClick="browse()"  />--%>


     
    <asp:Image runat="server" ImageUrl="~/images/fileUpload.png" ID="ibtn_FileUpload" style="cursor:pointer" onclick="browse()"/>
 
 <%--<a href="" onclick="browse()" class="upload_photo"> <div class="well text-center" style="width: 150px;height: 180px">
<div class="upload_icon text-center"></div><br/><br/><br/><br/>
<div class="upload_icon_text"> Upload</div>
<div class="upload_icon_text">Passport Size Photograph</div>
  </div></a>--%>
     <asp:FileUpload ID="FileUpload1" style="display:none;" ClientIDMode="Static"   runat="server" onchange="this.form.submit()" />
     <asp:Button ID="btn_UplaodImage" style="display:none;" OnClick="btn_UplaodImage_Click" runat="server"  />

    </div>

</div>

        </div>
      </div>
    </div>


          <div class="panel panel-default panel_shadow">
      <a id="menu_toggle" href="#contactinfo" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle2 margin_top">Contact Information<div class="icon-arrow-right pull-right"><span class="check_icon" style="visibility:hidden"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id="contactinfo" class="panel-collapse panel-heading collapse">
      	<div class="panel_divider"></div>
        <div class="panel-body" >
    <br/>

<div class="col-md-12">
<div class="col-md-10 text-left">
  <div class="col-md-5">
         <div class="form">
     <input id="current_address" class="input_name" type="text" name="Caddress"  placeholder="Current Address" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="permanent_address" class="input_father_name" type="text" name="Padress" placeholder="Permanent Address" runat="server" />
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="email" class="input_CNIC_no" type="text" name="Email" placeholder="Email" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="landline" class="input_father_CINC_no" type="text" name="Phone_Landline" placeholder="Phone Landline" runat="server" />
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="phone" class="input_DOB" type="text" name="Yphone"  placeholder="Phone (Your Phone)" runat="server" />
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_phone" class="input_nationality" type="text" name="Fphone"  placeholder="Phone (Father)" runat="server" />
    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="zip" class="input_DOB" type="text" name="Zcode"  placeholder="Zip Code/Postal Code" runat="server" />
    </div>
</div>
<br/><br/>
</div>
 <div class="col-md-2 pull-right">
     
 

    </div>

</div>

        </div>
      </div>
    </div>

   
<br/>
         <button type="button" onserverclick="next_click" class=" btn button_bg" runat="server" ><span class="NormalCharacterStyle">NEXT</span></button>
  </div>

</div>

</asp:Content>

