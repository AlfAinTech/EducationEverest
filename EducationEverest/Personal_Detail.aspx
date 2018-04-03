<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Personal_Detail.aspx.cs" Inherits="Personal_Detail" %>



<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px">Dashboard > File Admission Application > Personal Details</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script type="text/javascript">
        function validatePage() {
            if (typeof (Page_ClientValidate) == 'function') {
                Page_ClientValidate();
            }
            
            if (!Page_IsValid) {
                
                if (Page_ClientValidate('vgPersonalDetails2')) {
                    document.getElementById('imgCaution2').style.display = 'none';
                    document.getElementById('imgSuccess2').style.display = 'inline-block';
                }
                else {
                    document.getElementById('imgCaution2').style.display = 'inline-block';
                    document.getElementById('imgSuccess2').style.display = 'none';
                }
                if (Page_ClientValidate('vgPersonalDetails')) {
                    document.getElementById('imgCaution').style.display = 'none';
                    document.getElementById('imgSuccess').style.display = 'inline-block';
                }
                else {
                    document.getElementById('imgCaution').style.display = 'inline-block';
                    document.getElementById('imgSuccess').style.display = 'none';
                }
                return (Page_ClientValidate('vgPersonalDetails2') && Page_ClientValidate('vgPersonalDetails'));
            }
        }
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
            var tryNumber = 0;
            $('btn').click(function (event) {
                var self = $(this);

                if (self.closest('form').valid()) {
                    if (tryNumber > 0) {
                        tryNumber++;
                        alert('Your form has been already submited. wait please');
                        return false;
                    }
                    else {
                        tryNumber++;
                    }
                };
            });
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
            <a id="menu_toggle" class="menu_toggles" href="#collapse2" data-toggle="collapse"  data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">Personal Information
                            <div class="pull-right">
                            <img id="imgCaution" src="images/caution_icon.png"   style="margin-right:5px;display:none;" />
                            <img id="imgSuccess" src="images/check_icon.png"   style="margin-right:10px"/>
                            <div class="icon-arrow-right pull-right">
                            <div class="check-"></div>
                            <i class="glyphicon glyphicon-chevron-down normal-color"></i></div>
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
                                    <input id="dob" class="input_DOB" type="date" name="dob" placeholder="Date of Birth" min="1990-01-01" max="2005-01-01" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvDOB" runat="server" ErrorMessage="Date of Birth is required" Display="Dynamic" ValidationGroup="vgPersonalDetails" ControlToValidate="dob" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rv1" runat="server" ErrorMessage="Date of birth should be between 1990 and 2006" ControlToValidate="dob" ValidationGroup="vgPersonalDetails" Type="Date" ForeColor="Red" Display="Dynamic" MinimumValue="01/01/1990" MaximumValue="01/01/2006"></asp:RangeValidator>

                                </div>
                            </div>

    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" >
          <asp:DropDownList id="ddlnationality" runat="server" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option"   >
    <asp:ListItem Value="AF">Afghanistan</asp:ListItem>

    <asp:ListItem Value="AL">Albania</asp:ListItem>

    <asp:ListItem Value="DZ">Algeria</asp:ListItem>

    <asp:ListItem Value="AS">American Samoa</asp:ListItem>

    <asp:ListItem Value="AD">Andorra</asp:ListItem>

    <asp:ListItem Value="AO">Angola</asp:ListItem>

    <asp:ListItem Value="AI">Anguilla</asp:ListItem>

    <asp:ListItem Value="AQ">Antarctica</asp:ListItem>

    <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>

    <asp:ListItem Value="AR">Argentina</asp:ListItem>

    <asp:ListItem Value="AM">Armenia</asp:ListItem>

    <asp:ListItem Value="AW">Aruba</asp:ListItem>

    <asp:ListItem Value="AU">Australia</asp:ListItem>

    <asp:ListItem Value="AT">Austria</asp:ListItem>

    <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>

    <asp:ListItem Value="BS">Bahamas</asp:ListItem>

    <asp:ListItem Value="BH">Bahrain</asp:ListItem>

    <asp:ListItem Value="BD">Bangladesh</asp:ListItem>

    <asp:ListItem Value="BB">Barbados</asp:ListItem>

    <asp:ListItem Value="BY">Belarus</asp:ListItem>

    <asp:ListItem Value="BE">Belgium</asp:ListItem>

    <asp:ListItem Value="BZ">Belize</asp:ListItem>

    <asp:ListItem Value="BJ">Benin</asp:ListItem>

    <asp:ListItem Value="BM">Bermuda</asp:ListItem>

    <asp:ListItem Value="BT">Bhutan</asp:ListItem>

    <asp:ListItem Value="BO">Bolivia</asp:ListItem>

    <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>

    <asp:ListItem Value="BW">Botswana</asp:ListItem>

    <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>

    <asp:ListItem Value="BR">Brazil</asp:ListItem>

    <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>

    <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>

    <asp:ListItem Value="BG">Bulgaria</asp:ListItem>

    <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>

    <asp:ListItem Value="BI">Burundi</asp:ListItem>

    <asp:ListItem Value="KH">Cambodia</asp:ListItem>

    <asp:ListItem Value="CM">Cameroon</asp:ListItem>

    <asp:ListItem Value="CA">Canada</asp:ListItem>

    <asp:ListItem Value="CV">Cape Verde</asp:ListItem>

    <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>

    <asp:ListItem Value="CF">Central African Republic</asp:ListItem>

    <asp:ListItem Value="TD">Chad</asp:ListItem>

    <asp:ListItem Value="CL">Chile</asp:ListItem>

    <asp:ListItem Value="CN">China</asp:ListItem>

    <asp:ListItem Value="CX">Christmas Island</asp:ListItem>

    <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>

    <asp:ListItem Value="CO">Colombia</asp:ListItem>

    <asp:ListItem Value="KM">Comoros</asp:ListItem>

    <asp:ListItem Value="CG">Congo</asp:ListItem>

    <asp:ListItem Value="CK">Cook Islands</asp:ListItem>

    <asp:ListItem Value="CR">Costa Rica</asp:ListItem>

    <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>

    <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>

    <asp:ListItem Value="CU">Cuba</asp:ListItem>

    <asp:ListItem Value="CY">Cyprus</asp:ListItem>

    <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>

    <asp:ListItem Value="DK">Denmark</asp:ListItem>

    <asp:ListItem Value="DJ">Djibouti</asp:ListItem>

    <asp:ListItem Value="DM">Dominica</asp:ListItem>

    <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>

    <asp:ListItem Value="TP">East Timor</asp:ListItem>

    <asp:ListItem Value="EC">Ecuador</asp:ListItem>

    <asp:ListItem Value="EG">Egypt</asp:ListItem>

    <asp:ListItem Value="SV">El Salvador</asp:ListItem>

    <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>

    <asp:ListItem Value="ER">Eritrea</asp:ListItem>

    <asp:ListItem Value="EE">Estonia</asp:ListItem>

    <asp:ListItem Value="ET">Ethiopia</asp:ListItem>

    <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>

    <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>

    <asp:ListItem Value="FJ">Fiji</asp:ListItem>

    <asp:ListItem Value="FI">Finland</asp:ListItem>

    <asp:ListItem Value="FR">France</asp:ListItem>

    <asp:ListItem Value="GF">French Guiana</asp:ListItem>

    <asp:ListItem Value="PF">French Polynesia</asp:ListItem>

    <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>

    <asp:ListItem Value="GA">Gabon</asp:ListItem>

    <asp:ListItem Value="GM">Gambia</asp:ListItem>

    <asp:ListItem Value="GE">Georgia</asp:ListItem>

    <asp:ListItem Value="DE">Germany</asp:ListItem>

    <asp:ListItem Value="GH">Ghana</asp:ListItem>

    <asp:ListItem Value="GI">Gibraltar</asp:ListItem>

    <asp:ListItem Value="GR">Greece</asp:ListItem>

    <asp:ListItem Value="GL">Greenland</asp:ListItem>

    <asp:ListItem Value="GD">Grenada</asp:ListItem>

    <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>

    <asp:ListItem Value="GU">Guam</asp:ListItem>

    <asp:ListItem Value="GT">Guatemala</asp:ListItem>

    <asp:ListItem Value="GN">Guinea</asp:ListItem>

    <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>

    <asp:ListItem Value="GY">Guyana</asp:ListItem>

    <asp:ListItem Value="HT">Haiti</asp:ListItem>

    <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>

    <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>

    <asp:ListItem Value="HN">Honduras</asp:ListItem>

    <asp:ListItem Value="HK">Hong Kong</asp:ListItem>

    <asp:ListItem Value="HU">Hungary</asp:ListItem>

    <asp:ListItem Value="IS">Icel And</asp:ListItem>

    <asp:ListItem Value="IN">India</asp:ListItem>

    <asp:ListItem Value="ID">Indonesia</asp:ListItem>

    <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>

    <asp:ListItem Value="IQ">Iraq</asp:ListItem>

    <asp:ListItem Value="IE">Ireland</asp:ListItem>

    <asp:ListItem Value="IL">Israel</asp:ListItem>

    <asp:ListItem Value="IT">Italy</asp:ListItem>

    <asp:ListItem Value="JM">Jamaica</asp:ListItem>

    <asp:ListItem Value="JP">Japan</asp:ListItem>

    <asp:ListItem Value="JO">Jordan</asp:ListItem>

    <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>

    <asp:ListItem Value="KE">Kenya</asp:ListItem>

    <asp:ListItem Value="KI">Kiribati</asp:ListItem>

    <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>

    <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>

    <asp:ListItem Value="KW">Kuwait</asp:ListItem>

    <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>

    <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>

    <asp:ListItem Value="LV">Latvia</asp:ListItem>

    <asp:ListItem Value="LB">Lebanon</asp:ListItem>

    <asp:ListItem Value="LS">Lesotho</asp:ListItem>

    <asp:ListItem Value="LR">Liberia</asp:ListItem>

    <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>

    <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>

    <asp:ListItem Value="LT">Lithuania</asp:ListItem>

    <asp:ListItem Value="LU">Luxembourg</asp:ListItem>

    <asp:ListItem Value="MO">Macau</asp:ListItem>

    <asp:ListItem Value="MK">Macedonia</asp:ListItem>

    <asp:ListItem Value="MG">Madagascar</asp:ListItem>

    <asp:ListItem Value="MW">Malawi</asp:ListItem>

    <asp:ListItem Value="MY">Malaysia</asp:ListItem>

    <asp:ListItem Value="MV">Maldives</asp:ListItem>

    <asp:ListItem Value="ML">Mali</asp:ListItem>

    <asp:ListItem Value="MT">Malta</asp:ListItem>

    <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>

    <asp:ListItem Value="MQ">Martinique</asp:ListItem>

    <asp:ListItem Value="MR">Mauritania</asp:ListItem>

    <asp:ListItem Value="MU">Mauritius</asp:ListItem>

    <asp:ListItem Value="YT">Mayotte</asp:ListItem>

    <asp:ListItem Value="MX">Mexico</asp:ListItem>

    <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>

    <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>

    <asp:ListItem Value="MC">Monaco</asp:ListItem>

    <asp:ListItem Value="MN">Mongolia</asp:ListItem>

    <asp:ListItem Value="MS">Montserrat</asp:ListItem>

    <asp:ListItem Value="MA">Morocco</asp:ListItem>

    <asp:ListItem Value="MZ">Mozambique</asp:ListItem>

    <asp:ListItem Value="MM">Myanmar</asp:ListItem>

    <asp:ListItem Value="NA">Namibia</asp:ListItem>

    <asp:ListItem Value="NR">Nauru</asp:ListItem>

    <asp:ListItem Value="NP">Nepal</asp:ListItem>

    <asp:ListItem Value="NL">Netherlands</asp:ListItem>

    <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>

    <asp:ListItem Value="NC">New Caledonia</asp:ListItem>

    <asp:ListItem Value="NZ">New Zealand</asp:ListItem>

    <asp:ListItem Value="NI">Nicaragua</asp:ListItem>

    <asp:ListItem Value="NE">Niger</asp:ListItem>

    <asp:ListItem Value="NG">Nigeria</asp:ListItem>

    <asp:ListItem Value="NU">Niue</asp:ListItem>

    <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>

    <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>

    <asp:ListItem Value="NO">Norway</asp:ListItem>

    <asp:ListItem Value="OM">Oman</asp:ListItem>

    <asp:ListItem Value="PK" Selected="True">Pakistan</asp:ListItem>

    <asp:ListItem Value="PW">Palau</asp:ListItem>

    <asp:ListItem Value="PA">Panama</asp:ListItem>

    <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>

    <asp:ListItem Value="PY">Paraguay</asp:ListItem>

    <asp:ListItem Value="PE">Peru</asp:ListItem>

    <asp:ListItem Value="PH">Philippines</asp:ListItem>

    <asp:ListItem Value="PN">Pitcairn</asp:ListItem>

    <asp:ListItem Value="PL">Poland</asp:ListItem>

    <asp:ListItem Value="PT">Portugal</asp:ListItem>

    <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>

    <asp:ListItem Value="QA">Qatar</asp:ListItem>

    <asp:ListItem Value="RE">Reunion</asp:ListItem>

    <asp:ListItem Value="RO">Romania</asp:ListItem>

    <asp:ListItem Value="RU">Russian Federation</asp:ListItem>

    <asp:ListItem Value="RW">Rwanda</asp:ListItem>

    <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>

    <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>

    <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>

    <asp:ListItem Value="WS">Samoa</asp:ListItem>

    <asp:ListItem Value="SM">San Marino</asp:ListItem>

    <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>

    <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>

    <asp:ListItem Value="SN">Senegal</asp:ListItem>

    <asp:ListItem Value="SC">Seychelles</asp:ListItem>

    <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>

    <asp:ListItem Value="SG">Singapore</asp:ListItem>

    <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>

    <asp:ListItem Value="SI">Slovenia</asp:ListItem>

    <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>

    <asp:ListItem Value="SO">Somalia</asp:ListItem>

    <asp:ListItem Value="ZA">South Africa</asp:ListItem>

    <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>

    <asp:ListItem Value="ES">Spain</asp:ListItem>

    <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>

    <asp:ListItem Value="SH">St. Helena</asp:ListItem>

    <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>

    <asp:ListItem Value="SD">Sudan</asp:ListItem>

    <asp:ListItem Value="SR">Suriname</asp:ListItem>

    <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>

    <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>

    <asp:ListItem Value="SE">Sweden</asp:ListItem>

    <asp:ListItem Value="CH">Switzerland</asp:ListItem>

    <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>

    <asp:ListItem Value="TW">Taiwan</asp:ListItem>

    <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>

    <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>

    <asp:ListItem Value="TH">Thailand</asp:ListItem>

    <asp:ListItem Value="TG">Togo</asp:ListItem>

    <asp:ListItem Value="TK">Tokelau</asp:ListItem>

    <asp:ListItem Value="TO">Tonga</asp:ListItem>

    <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>

    <asp:ListItem Value="TN">Tunisia</asp:ListItem>

    <asp:ListItem Value="TR">Turkey</asp:ListItem>

    <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>

    <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>

    <asp:ListItem Value="TV">Tuvalu</asp:ListItem>

    <asp:ListItem Value="UG">Uganda</asp:ListItem>

    <asp:ListItem Value="UA">Ukraine</asp:ListItem>

    <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>

    <asp:ListItem Value="GB">United Kingdom</asp:ListItem>

    <asp:ListItem Value="US">United States</asp:ListItem>

    <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>

    <asp:ListItem Value="UY">Uruguay</asp:ListItem>

    <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>

    <asp:ListItem Value="VU">Vanuatu</asp:ListItem>

    <asp:ListItem Value="VE">Venezuela</asp:ListItem>

    <asp:ListItem Value="VN">Viet Nam</asp:ListItem>

    <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>

    <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>

    <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>

    <asp:ListItem Value="EH">Western Sahara</asp:ListItem>

    <asp:ListItem Value="YE">Yemen</asp:ListItem>

    <asp:ListItem Value="YU">Yugoslavia</asp:ListItem>

    <asp:ListItem Value="ZR">Zaire</asp:ListItem>

    <asp:ListItem Value="ZM">Zambia</asp:ListItem>

    <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>

</asp:DropDownList>

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
                            <img src="images/caution_icon.png" id="imgCaution2" style="margin-right:5px;display:none;" />
                            <img src="images/check_icon.png" id="imgSuccess2"   style="margin-right:10px"/>
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
                                    <asp:RequiredFieldValidator ID="rvCurrentAddress" runat="server" ErrorMessage="Current Address is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="current_address" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc3">
                                <div class="form">
                                    <input id="permanent_address" maxlength="300" class="input_father_name" type="text" name="Padress" placeholder="Permanent Address" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPermanentAddress" runat="server" ErrorMessage="Permanent Address is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="permanent_address" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="email" class="input_CNIC_no" type="text" name="Email" placeholder="Email" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvEmail" runat="server" ErrorMessage="Email is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reEmail" runat="server" ErrorMessage="Please Enter Valid Email ID" ControlToValidate="email" ValidationGroup="vgPersonalDetails2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="landline" maxlength="11" class="input_father_CINC_no" type="text" name="Phone_Landline" placeholder="Phone Landline" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvLandline" runat="server" ErrorMessage="Landline number is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="landline" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <%--<asp:RegularExpressionValidator ID="reLandline" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails" ControlToValidate="landline" ValidationExpression="^([0-9\(\)\/\+ \-]*)$" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                   <asp:RegularExpressionValidator ID="reLandline" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails2" ControlToValidate="landline" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="phone" maxlength="11" class="input_DOB" type="text" name="Yphone" placeholder="Phone (Your Phone)" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPhone" runat="server" ErrorMessage="Mobile number is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="phone" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="rePhone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails2" ControlToValidate="phone" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="father_phone" maxlength="11" class="input_nationality" type="text" name="Fphone" placeholder="Phone (Father)" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvFatherPhone" runat="server" ErrorMessage="Father's Mobile number is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="father_phone" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reFatherPhone" runat="server" ErrorMessage="Please Enter Valid Phone Number" ValidationGroup="vgPersonalDetails2" ControlToValidate="father_phone" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>


                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form">
                                    <input id="zip" maxlength="10" class="input_DOB" type="text" name="Zcode" placeholder="Zip Code/Postal Code" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvZip" runat="server" ErrorMessage="ZIP/Postal Code is required" ValidationGroup="vgPersonalDetails2" ControlToValidate="zip" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reZip"
                                        ControlToValidate="zip" ValidationGroup="vgPersonalDetails2"
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
        <button type="button" id="btn" onserverclick="next_click" class=" btn button_bg" runat="server"  onclick="validatePage();" ><span class="NormalCharacterStyle">NEXT</span></button>
    </div>


</asp:Content>

