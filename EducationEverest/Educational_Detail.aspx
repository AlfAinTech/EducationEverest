﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Educational_Detail.aspx.cs" Inherits="Educational_Detail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px">Dashboard > File Admission Application > Educational Details</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <script language="javascript" type="text/javascript">
            function OnMatricMarksChange() {
                var total = $("[id*=total_marks_matric]")[0];
                var obtained = $("[id*=obtained_marks_matric]")[0];
                var percentage = $("[id*=percentage_matric]")[0];
                var totalValue = 0;
                var obtainedValue = 0;
                var percentageValue = 0;
                if (total != null || total != undefined || total.value != "") {
                    totalValue = parseFloat(total.value);
                }
                if (obtained != null || obtained != undefined || obtained.value != "") {
                    obtainedValue = parseFloat(obtained.value);
                }
                console.log(obtainedValue, totalValue)
                percentageValue = (obtainedValue / totalValue) * 100;
                console.log(percentageValue);
                percentage.value = percentageValue.toFixed(0).toString();

            }
            function OnintermediateMarksChange() {
                var total = $("[id*=total_marks_intermediate]")[0];
                var obtained = $("[id*=obtained_marks_intermediate]")[0];
                var percentage = $("[id*=percentage_intermediate]")[0];
                var totalValue = 0;
                var obtainedValue = 0;
                var percentageValue = 0;
                if (total != null || total != undefined || total.value != "") {
                    totalValue = parseFloat(total.value);
                }
                if (obtained != null || obtained != undefined || obtained.value != "") {
                    obtainedValue = parseFloat(obtained.value);
                }
                console.log(obtainedValue, totalValue)
                percentageValue = (obtainedValue / totalValue) * 100;
                console.log(percentageValue);
                percentage.value = percentageValue.toFixed(0).toString();

            }
            function OpenCurrentPage() {
                $("#educationalDocument").removeClass("NormalCharacterStyle24")
                $("#educationalDocument").addClass("NormalCharacterStyle22");
                $("#fileAdmission").addClass("NormalCharacterStyle18");
                document.getElementById("fileAdmission").click();
            }
        </script>
    </header>
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-left">
        <h3 class="NormalCharacterStyle12">Educational Details</h3>

        <div class="panel panel-default panel_shadow">
            <a id="menu_toggle" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">
                            Matriculation/ O-Level<div class="icon-arrow-right pull-right">
                                <div class="check-"></div>
                                <i class="glyphicon glyphicon-chevron-down normal-color"></i>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="collapse2" class="panel-collapse panel-heading collapse">
                <div class="panel-body">
                    <br />

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <asp:DropDownList ID="DropDownList1" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option" runat="server">
                                        <Items>
                                            <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
                                            <asp:ListItem Text="FBISE" Enabled="true" Selected="false" Value="FBISE" />
                                            <asp:ListItem Text="BISE LAHORE" Enabled="true" Selected="false" Value="BISE LAHORE" />
                                            <asp:ListItem Text="IGCSE" Enabled="true" Selected="false" Value="IGCSE" />
                                            <asp:ListItem Text="A-/AS-Levels" Enabled="true" Selected="false" Value="A-/AS-Levels" />
                                        </Items>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPInstituteMatric" runat="server" ErrorMessage="Please select Matric Institute" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc4">
                                <div class="form">
                                    <input class="inputs" maxlength="30" id="rollno_matric" type="text" name="roll_number" placeholder="Roll Number" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvRollNo" runat="server" ErrorMessage="Roll Number is required" ValidationGroup="vgEducationalDetails" ControlToValidate="rollno_matric" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>


                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <asp:DropDownList ID="DropDownList2" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option" runat="server">
                                        <Items>
                                            <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2015" Value="2015" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2014" Value="2014" />
                                        </Items>

                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvSelectYear" runat="server" ErrorMessage="Please select Passing year" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList2" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc3">
                                <div class="form">

                                    <input class="inputs" maxlength="5" id="total_marks_matric" onchange="OnMatricMarksChange()" type="text" name="marks" placeholder="Total Marks" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvTotalMarksMatric" runat="server" ErrorMessage="Total Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="total_marks_matric" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reTotalMarksMatric" ControlToValidate="total_marks_matric" ValidationGroup="vgEducationalDetails"
                                        runat="server" ValidationExpression="\d+" ForeColor="Red"
                                        ErrorMessage="Please enter only numbers">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc1">
                                <div class="form">
                                    <input class="inputs" maxlength="5" id="obtained_marks_matric" onchange="OnMatricMarksChange()" type="text" name="obtained_marks" placeholder="Obtained Marks" runat="server" />

                                    <br />
                                    <asp:RequiredFieldValidator ID="rvObtainedMarksMatric" runat="server" ErrorMessage="Obtained Marks required" Display="Dynamic" ValidationGroup="vgEducationalDetails" ControlToValidate="obtained_marks_matric" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reObtainedMarksMatric" Display="Dynamic" ControlToValidate="obtained_marks_matric" ValidationGroup="vgEducationalDetails"
                                        runat="server" ValidationExpression="\d+" ForeColor="Red"
                                        ErrorMessage="Please enter only numbers">
                                    </asp:RegularExpressionValidator>
                                    <br />
                                    <asp:CompareValidator runat="server" ID="cvMatric" Display="Dynamic" ValidationGroup="vgEducationalDetails" ControlToValidate="obtained_marks_matric" ControlToCompare="total_marks_matric" Operator="LessThanEqual" Type="Integer" ErrorMessage="Obtained marks cannot be greater than total marks!" ForeColor="red" /><br />
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <input class="inputs" maxlength="5" id="percentage_matric" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPercetageMatric" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup="vgEducationalDetails" ControlToValidate="percentage_matric" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="rePercentageMatric" ControlToValidate="percentage_matric" ValidationGroup="vgEducationalDetails"
                                        runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                                        ErrorMessage="numbers/decimals">
                                    </asp:RegularExpressionValidator>

                                </div>
                            </div>
                            <%-- runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"--%>

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <input class="inputs" maxlength="6" id="division_matric" type="text" name="Division" placeholder="Division" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvDivisioMatric" runat="server" ErrorMessage="Division required" ValidationGroup="vgEducationalDetails" ControlToValidate="division_matric" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>




        <div class="panel panel-default panel_shadow">
            <a id="menu_toggle" href="#interpanel" data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle2 margin_top">
                            Intermediate/A-Level<div class="icon-arrow-right pull-right">
                                <div class="check-"></div>
                                <i class="glyphicon glyphicon-chevron-down normal-color"></i>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="interpanel" class="panel-collapse panel-heading collapse">
                <div class="panel-body">
                    <br />

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <asp:DropDownList ID="DropDownList3" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option" runat="server">
                                        <Items>
                                            <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="FBISE" Value="FBISE" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="BISE LAHORE" Value="BISE LAHORE" />
                                        </Items>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvSelectPInstituteInterm" runat="server" ErrorMessage="Please select Intermediate Institute" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList3" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc4">
                                <div class="form">
                                    <input class="inputs" maxlength="30" id="rollno_intermediate" type="text" name="roll_number" placeholder="Roll Number" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvRollnoIntermediate" runat="server" ErrorMessage="Roll Number is required" ValidationGroup="vgEducationalDetails" ControlToValidate="rollno_intermediate" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>


                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <asp:DropDownList ID="DropDownList4" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option" runat="server">
                                        <Items>
                                            <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2015" Value="2015" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2014" Value="2014" />
                                        </Items>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvSelectyearInter" runat="server" ErrorMessage="Please select Passing Year" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList4" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc3">
                                <div class="form">

                                    <input class="inputs" maxlength="5" id="total_marks_intermediate" onchange="OnintermediateMarksChange()" type="text" name="marks" placeholder="Total Marks" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvTotalMarksIntermediate" runat="server" ErrorMessage="Total Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="total_marks_intermediate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="reTotalMarksIntermediate" ControlToValidate="total_marks_intermediate" ValidationGroup="vgEducationalDetails"
                                        runat="server" ValidationExpression="\d+" ForeColor="Red"
                                        ErrorMessage="Please enter only numbers">
                                    </asp:RegularExpressionValidator>


                                </div>
                            </div>


                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc1">
                                <div class="form">

                                    <input class="inputs" maxlength="5" id="obtained_marks_intermediate" onchange="OnintermediateMarksChange()" type="text" name="obtained_marks" placeholder="Obtained Marks" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvObtainedMarksIntermediate" runat="server" ErrorMessage="Obtained Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="obtained_marks_intermediate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="obtained_marks_intermediate" ValidationGroup="vgEducationalDetails"
                                        runat="server" ValidationExpression="\d+" ForeColor="Red"
                                        ErrorMessage="Please enter only numbers">
                                    </asp:RegularExpressionValidator>
                                    <br />
                                    <asp:CompareValidator runat="server" ValidationGroup="vgEducationalDetails" ID="cvIntermediate" ControlToValidate="obtained_marks_intermediate" ControlToCompare="total_marks_intermediate" Operator="LessThanEqual" Type="Integer" ErrorMessage="Obtained marks cannot be greater than total marks!" ForeColor="red" /><br />


                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <input class="inputs" maxlength="5" id="percentage_intermediate" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rvPercentageIntermediate" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup="vgEducationalDetails" ControlToValidate="percentage_intermediate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="rePercentageIntermediate" ControlToValidate="obtained_marks_intermediate" ValidationGroup="vgEducationalDetails"
                                        runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                                        ErrorMessage="numbers/decimals ">
                                    </asp:RegularExpressionValidator>

                                </div>
                            </div>


                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                <div class="form">
                                    <input class="inputs" maxlength="6" id="division_intermediate" type="text" name="Division" placeholder="Division" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="reDivisionIntermediate" runat="server" ErrorMessage="Division required" ValidationGroup="vgEducationalDetails" ControlToValidate="division_intermediate" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <button type="button" onserverclick="button_click" class=" btn button_bg" validationgroup="vgEducationalDetails" runat="server"><span class="NormalCharacterStyle">NEXT</span></button>

        <br />
     </div>

</asp:Content>

