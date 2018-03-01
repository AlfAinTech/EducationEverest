﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Personal_Detail.aspx.cs" Inherits="Personal_Detail" %>
<%@ MasterType virtualpath="~/Client.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/myScript.js"></script>
    <script type="text/javascript">
        function browse(e) {
            
            document.getElementById('<%= FileUpload1.ClientID %>').click();
            e.preventDefault();
        }

        function UploadFile() {
            alert("hello there");
            
        }
        $('#student_cnic').keydown(function () {

            //allow  backspace, tab, ctrl+A, escape, carriage return
            if (event.keyCode == 8 || event.keyCode == 9
                              || event.keyCode == 27 || event.keyCode == 13
                              || (event.keyCode == 65 && event.ctrlKey === true))
                return;
            if ((event.keyCode < 48 || event.keyCode > 57))
                event.preventDefault();

            var length = $(this).val().length;

            if (length == 5 || length == 13)
                $(this).val($(this).val() + '-');
            alert("Hello! I am an alert box!");
        });
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
     <input id="student_name" class="input_name" type="text" name="name"  placeholder="Name (according to matric certificate)" runat="server"  />
     <br />  <asp:RequiredFieldValidator ID="rvName" runat="server" ErrorMessage="Name is required" ValidationGroup="vgPersonalDetails" ControlToValidate="student_name" ForeColor="Red" ></asp:RequiredFieldValidator>
           <br />  <asp:RegularExpressionValidator ID="reStudentName" runat="server" ControlToValidate="student_name" ValidationGroup="vgPersonalDetails"
    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in Name field"  ForeColor="Red"/>

    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_name" class="input_father_name" type="text" name="father_name" placeholder="Father Name (according to matric certificate)" runat="server" />
     <br />  <asp:RequiredFieldValidator ID="rvFatherName" runat="server" ErrorMessage="Father name is required" ValidationGroup="vgPersonalDetails" ControlToValidate="father_name" ForeColor="Red" ></asp:RequiredFieldValidator>
<br />  <asp:RegularExpressionValidator ID="reFatherName" runat="server" ControlToValidate="father_name" ValidationGroup="vgPersonalDetails"
    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in Father Name field"  ForeColor="Red"/>

    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="student_cnic"  maxlength="13" class="input_CNIC_no" type="text" name="CNIC" placeholder="Enter Your CNIC withou Dash" runat="server"   />
      <br />  <asp:RequiredFieldValidator ID="rvStudentCNIC" runat="server" ErrorMessage="CNIC is required" ValidationGroup="vgPersonalDetails" ControlToValidate="student_cnic" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="reStudentCNICDigits" ValidationGroup="vgPersonalDetails"
    ControlToValidate="student_cnic" runat="server" ForeColor="red"
    ErrorMessage="Only Numbers allowed"
    ValidationExpression="\d+">
</asp:RegularExpressionValidator>
<%--             <asp:RangeValidator ID="rngvStudentCNIC" Type="Integer" ValidationGroup="vgPersonalDetails" MinimumValue="13" MaximumValue="13" ControlToValidate="student_cnic" runat="server" ErrorMessage=""></asp:RangeValidator>--%>
    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_cnic"  maxlength="13" class="input_father_CINC_no" type="text" name="father_CNIC" placeholder="Father CNIC No" runat="server"  />
     <br />  <asp:RequiredFieldValidator ID="rvFatherCNIC" runat="server" ErrorMessage="Father CNIC is required" ValidationGroup="vgPersonalDetails" ControlToValidate="father_cnic" ForeColor="Red" ></asp:RequiredFieldValidator>
        <br /><asp:RegularExpressionValidator ID="reFatherCNIC" ValidationGroup="vgPersonalDetails"
    ControlToValidate="father_cnic" runat="server" ForeColor="red"
    ErrorMessage="Only Numbers allowed"
    ValidationExpression="\d+">
</asp:RegularExpressionValidator>

    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="dob" class="input_DOB" type="date" name="dob" placeholder="Date of Birth" min="1980-01-01" max="2005-01-01" runat="server" />
     <br />  <asp:RequiredFieldValidator ID="rvDOB" runat="server" ErrorMessage="Date of Birth is required" ValidationGroup="vgPersonalDetails" ControlToValidate="dob" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="nationality" maxlength="20" class="input_nationality" type="text" name="nationality"  placeholder="Nationality" runat="server" />
     <br />  <asp:RequiredFieldValidator ID="rvNationality" runat="server" ErrorMessage="Nationality is required" ValidationGroup="vgPersonalDetails" ControlToValidate="nationality" ForeColor="Red" ></asp:RequiredFieldValidator>
<br />  <asp:RegularExpressionValidator ID="reNationality" runat="server" ControlToValidate="nationality" ValidationGroup="vgPersonalDetails"
    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in Nationality field"  ForeColor="Red"/>

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
     <input id="current_address"  maxlength="300" class="input_name" type="text" name="Caddress"  placeholder="Current Address" runat="server" />
<br />  <asp:RequiredFieldValidator ID="rvCurrentAddress" runat="server" ErrorMessage="Current Address is required" ValidationGroup="vgPersonalDetails" ControlToValidate="current_address" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="permanent_address" maxlength="300" class="input_father_name" type="text" name="Padress" placeholder="Permanent Address" runat="server" />
        <br />  <asp:RequiredFieldValidator ID="rvPermanentAddress" runat="server" ErrorMessage="Permanent Address is required" ValidationGroup="vgPersonalDetails" ControlToValidate="permanent_address" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="email" class="input_CNIC_no" type="text" name="Email" placeholder="Email" runat="server" />
  <br />  <asp:RequiredFieldValidator ID="rvEmail" runat="server" ErrorMessage="Email is required" ValidationGroup="vgPersonalDetails" ControlToValidate="email" ForeColor="Red" ></asp:RequiredFieldValidator>
     <br />   <asp:RegularExpressionValidator ID="reEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="email" ValidationGroup="vgPersonalDetails" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="landline" maxlength="15" class="input_father_CINC_no" type="text" name="Phone_Landline" placeholder="Phone Landline" runat="server" />
     <br />  <asp:RequiredFieldValidator ID="rvLandline" runat="server" ErrorMessage="Landline number is required" ValidationGroup="vgPersonalDetails" ControlToValidate="landline" ForeColor="Red" ></asp:RequiredFieldValidator>
   <br />     <asp:RegularExpressionValidator ID="reLandline" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="landline" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>

    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="phone" maxlength="15" class="input_DOB" type="text" name="Yphone"  placeholder="Phone (Your Phone)" runat="server" />
<br />  <asp:RequiredFieldValidator ID="rvPhone" runat="server" ErrorMessage="Mobile number is required" ValidationGroup="vgPersonalDetails" ControlToValidate="phone" ForeColor="Red" ></asp:RequiredFieldValidator>
   <br />     <asp:RegularExpressionValidator ID="rePhone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="phone" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>

    </div>
</div>

<div class="col-md-5">
    <div class="form">
     <input id="father_phone" maxlength="15" class="input_nationality" type="text" name="Fphone"  placeholder="Phone (Father)" runat="server" />
        <br />  <asp:RequiredFieldValidator ID="rvFatherPhone" runat="server" ErrorMessage="Father's Mobile number is required" ValidationGroup="vgPersonalDetails" ControlToValidate="father_phone" ForeColor="Red" ></asp:RequiredFieldValidator>
   <br />     <asp:RegularExpressionValidator ID="reFatherPhone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="father_phone" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>


    </div>
</div>
<br/><br/><br/><br/>
 <div class="col-md-5">
         <div class="form">
     <input id="zip" maxlength="10" class="input_DOB" type="text" name="Zcode"  placeholder="Zip Code/Postal Code" runat="server" />
<br />  <asp:RequiredFieldValidator ID="rvZip" runat="server" ErrorMessage="ZIP/Postal Code is required" ValidationGroup="vgPersonalDetails" ControlToValidate="zip" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator id="reZip"
                   ControlToValidate="zip" ValidationGroup="vgPersonalDetails"
                   ValidationExpression="\d+"
                   Display="Static" ForeColor="Red"
                   EnableClientScript="true"
                   ErrorMessage="Please enter valid Zip/Postal Code"
                   runat="server"/>
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
         <button type="button" onserverclick="next_click" class=" btn button_bg" runat="server" validationgroup="vgPersonalDetails" ><span class="NormalCharacterStyle">NEXT</span></button>
  </div>

</div>

</asp:Content>

