﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Personal_Detail.aspx.cs" Inherits="Personal_Detail" %>



<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px">Dashboard > File Admission Application > Personal Details</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
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

        function UploadFile() {
            alert("hello there");

        }
        function OpenCurrentPage() {
            $("#prsonalDetail").removeClass("NormalCharacterStyle24")
            $("#prsonalDetail").addClass("NormalCharacterStyle22");
            $("#fileAdmission").addClass("NormalCharacterStyle18");
            document.getElementById("fileAdmission").click();
            document.getElementById("menu_toggle").click();
        }

        $(window).load(function () {

            OpenCurrentPage();
        });

        $(document).ready(function () {
            $('.menu_toggles').on('click', function () {
                
                var iSelector = $(this).find('i:first');
                if (iSelector.hasClass('glyphicon-chevron-down')) {
                    iSelector.removeClass('glyphicon-chevron-down')
                    iSelector.addClass('glyphicon-chevron-up')
                } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                    iSelector.removeClass('glyphicon-chevron-up')
                    iSelector.addClass('glyphicon-chevron-down')
                }
            });
          //  OpenCurrentPage();
        });

        
        $('#nop').keydown(function () {

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
            //alert("Hello! I am an alert box!");
        });
    </script>
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-left">
        <h3 class="NormalCharacterStyle12">Personal Details</h3>
        <%--<p class="NormalCharacterStyle11">BlhalBadof </p>--%>

        <div class="panel panel-default panel_shadow">
            <a id="menu_toggle" class="menu_toggles active" href="#collapse2" data-toggle="collapse"  data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">Personal Information
                            <div class="pull-right">
                            <img src="images/caution_icon.png"  style="margin-right:5px" />
                            <img src="images/check_icon.png"   style="margin-right:10px"/>
                            <div class="icon-arrow-right pull-right">
                            <div class="check-"></div>
                            <i class="glyphicon glyphicon-chevron-up normal-color"></i></div>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="collapse2" class="panel-collapse panel-heading collapse">
                <div class="panel-body" style="padding:0px !important">
                    <br />
                        <div class="col-lg-10 col-md-10 col-sm-9 col-xs-9 text-left">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="student_name" class="input_name" type="text" name="name" placeholder="Name (according to matric certificate)" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvName" runat="server" ErrorMessage="Name is required" ValidationGroup="vgPersonalDetails" ControlToValidate="student_name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reStudentName" runat="server" ControlToValidate="student_name" ValidationGroup="vgPersonalDetails"
                                        ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in Name field" ForeColor="Red" />

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="father_name" class="input_father_name" type="text" name="father_name" placeholder="Father Name (according to matric certificate)" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvFatherName" runat="server" ErrorMessage="Father name is required" ValidationGroup="vgPersonalDetails" ControlToValidate="father_name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reFatherName" runat="server" ControlToValidate="father_name" ValidationGroup="vgPersonalDetails"
                                        ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in Father Name field" ForeColor="Red" />

                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="student_cnic" maxlength="13" class="input_CNIC_no" type="text" name="CNIC" placeholder="Enter Your CNIC without Dashes" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvStudentCNIC" runat="server" ErrorMessage="CNIC is required" ValidationGroup="vgPersonalDetails" ControlToValidate="student_cnic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reStudentCNICDigits" ValidationGroup="vgPersonalDetails"
                                        ControlToValidate="student_cnic" runat="server" ForeColor="red"
                                        ErrorMessage="Only Numbers allowed"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                    <%--             <asp:RangeValidator ID="rngvStudentCNIC" Type="Integer" ValidationGroup="vgPersonalDetails" MinimumValue="13" MaximumValue="13" ControlToValidate="student_cnic" runat="server" ErrorMessage=""></asp:RangeValidator>--%>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="father_cnic" maxlength="13" class="input_father_CINC_no" type="text" name="father_CNIC" placeholder="Father CNIC No" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvFatherCNIC" runat="server" ErrorMessage="Father CNIC is required" ValidationGroup="vgPersonalDetails" ControlToValidate="father_cnic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reFatherCNIC" ValidationGroup="vgPersonalDetails"
                                        ControlToValidate="father_cnic" runat="server" ForeColor="red"
                                        ErrorMessage="Only Numbers allowed"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>

                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="dob" class="input_DOB" type="date" name="dob" placeholder="Date of Birth" min="1980-01-01" max="2005-01-01" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvDOB" runat="server" ErrorMessage="Date of Birth is required" Display="Dynamic" ValidationGroup="vgPersonalDetails" ControlToValidate="dob" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rv1" runat="server" ErrorMessage="Date of birth should be between 1900 and 2006" ControlToValidate="dob" ValidationGroup="vgPersonalDetails" Type="Date" ForeColor="Red" Display="Dynamic" MinimumValue="01/01/1990" MaximumValue="01/01/2006"></asp:RangeValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="nationality" maxlength="20" class="input_nationality" type="text" name="nationality" placeholder="Nationality" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvNationality" runat="server" ErrorMessage="Nationality is required" ValidationGroup="vgPersonalDetails" ControlToValidate="nationality" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reNationality" runat="server" ControlToValidate="nationality" ValidationGroup="vgPersonalDetails"
                                        ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only Alphabets are allowed in Nationality field" ForeColor="Red" />

                                </div>
                            </div>


                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3 text-center">
                            <%--<asp:ImageButton runat="server" ImageUrl="~/images/fileUpload.png" ID="ibtn_FileUpload" OnClientClick="browse()"  />--%>



                            <asp:Image runat="server" ImageUrl="~/images/fileUpload.png" ID="ibtn_FileUpload" Style="cursor: pointer" onclick="browse()" />
                            <asp:FileUpload ID="FileUpload1" accept="image/*" Style="display: none;" ClientIDMode="Static" runat="server" onchange="this.form.submit()" />
                            <asp:RegularExpressionValidator ValidationGroup="validateFile" ID="RegularExpressionValidator1" ControlToValidate="FileUpload1" ForeColor="Red" ValidationExpression="^.*\.(jpg|png|JPG|gif|GIF|jpeg|JPEG|PNG)$" runat="server" ErrorMessage="Select a Valid File"></asp:RegularExpressionValidator>
                            <asp:Button ID="btn_UplaodImage" ValidationGroup="validateFile" Style="display: none;" OnClick="btn_UplaodImage_Click" runat="server" />

                        </div>

                </div>
            </div>
        </div>


        <div class="panel panel-default panel_shadow">
            <a id="menu_toggle2" class="menu_toggles" href="#contactinfo"  data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">Contact Information
                            <div class="pull-right">
                            <img src="images/caution_icon.png"  style="margin-right:5px" />
                            <img src="images/check_icon.png"   style="margin-right:10px"/>
                            <div class="icon-arrow-right pull-right">
                            <div class="check-"></div>
                            <i class="glyphicon glyphicon-chevron-down normal-color"></i></div>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="contactinfo" class="panel-collapse panel-heading collapse">
                <div class="panel-body" style="padding:0px !important">
                    <br />

                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc3">
                                <div class="form">
                                    <input id="current_address" maxlength="300" class="input_name" type="text" name="Caddress" placeholder="Current Address" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvCurrentAddress" runat="server" ErrorMessage="Current Address is required" ValidationGroup="vgPersonalDetails" ControlToValidate="current_address" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc3">
                                <div class="form">
                                    <input id="permanent_address" maxlength="300" class="input_father_name" type="text" name="Padress" placeholder="Permanent Address" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPermanentAddress" runat="server" ErrorMessage="Permanent Address is required" ValidationGroup="vgPersonalDetails" ControlToValidate="permanent_address" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="email" class="input_CNIC_no" type="text" name="Email" placeholder="Email" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvEmail" runat="server" ErrorMessage="Email is required" ValidationGroup="vgPersonalDetails" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="email" ValidationGroup="vgPersonalDetails" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="landline" maxlength="11" class="input_father_CINC_no" type="text" name="Phone_Landline" placeholder="Phone Landline" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvLandline" runat="server" ErrorMessage="Landline number is required" ValidationGroup="vgPersonalDetails" ControlToValidate="landline" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <%--<asp:RegularExpressionValidator ID="reLandline" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="landline" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                   <asp:RegularExpressionValidator ID="reLandline" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="landline" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="phone" maxlength="11" class="input_DOB" type="text" name="Yphone" placeholder="Phone (Your Phone)" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPhone" runat="server" ErrorMessage="Mobile number is required" ValidationGroup="vgPersonalDetails" ControlToValidate="phone" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="rePhone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="phone" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="father_phone" maxlength="11" class="input_nationality" type="text" name="Fphone" placeholder="Phone (Father)" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvFatherPhone" runat="server" ErrorMessage="Father's Mobile number is required" ValidationGroup="vgPersonalDetails" ControlToValidate="father_phone" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reFatherPhone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="father_phone" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>


                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="zip" maxlength="10" class="input_DOB" type="text" name="Zcode" placeholder="Zip Code/Postal Code" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvZip" runat="server" ErrorMessage="ZIP/Postal Code is required" ValidationGroup="vgPersonalDetails" ControlToValidate="zip" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reZip"
                                        ControlToValidate="zip" ValidationGroup="vgPersonalDetails"
                                        ValidationExpression="\d+"
                                        Display="Static" ForeColor="Red"
                                        EnableClientScript="true"
                                        ErrorMessage="Please enter valid Zip/Postal Code"
                                        runat="server" />
                                </div>
                            </div>
                            <br />
                            <br />
                        </div>

                </div>
            </div>
        </div>


        <br />
        <button type="button" onserverclick="next_click" class=" btn button_bg" runat="server" validationgroup="vgPersonalDetails"><span class="NormalCharacterStyle">NEXT</span></button>
    </div>


</asp:Content>

