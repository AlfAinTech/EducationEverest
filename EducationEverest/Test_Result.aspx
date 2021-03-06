﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Test_Result.aspx.cs" Inherits="Test_Result" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px"><a class="breadcrumbLinks" href="Dashboard.aspx">Dashboard </a> > <a class="breadcrumbLinks" href="Personal_Detail.aspx">File Admission Application </a> > <a class="breadcrumbLinks" href="Test_Result.aspx">Test Results </a></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-left">
        <h3 class="NormalCharacterStyle12">Test Results</h3>


        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="panel panel-default panel_shadow">
                    <a id="menu_toggle" class="menu_toggles" href='<%# "#collapse"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                        <div class="panel-heading" style="height: 60px">
                            <h4 class="panel-title">
                                <div class="NormalCharacterStyle10 margin_top">
                                    <asp:Label ID="Label12" runat="server" Text='<%#Eval("TestName")%>'></asp:Label>
                                    <div class="pull-right">
                                        <img id='<%# "imgCaution"+Container.ItemIndex %>'  src="images/caution_icon.png"   style="margin-right:5px;display:none;" />
                                        <img id='<%# "imgSuccess"+Container.ItemIndex %>' src="images/check_icon.png"   style="margin-right:10px;display:none;"/>
                                        <div class="icon-arrow-right pull-right">
                                            <div class="check-"></div>
                                            <i class="glyphicon glyphicon-chevron-down normal-color"></i>
                                        </div>
                                    </div>
                                </div>
                            </h4>

                        </div>
                    </a>
                    <div id='<%# "collapse"+Container.ItemIndex %>' class="panel-collapse panel-heading collapse">
                        <div class="panel-body">
                            <br />

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">
                                            <asp:DropDownList ID="select_board" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option" runat="server">

                                                <Items>
                                                    <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="1" />
                                                    <asp:ListItem Text="FBISE" Enabled="true" Selected="false" Value="FBISE" />
                                                    <asp:ListItem Text="BISE Lahore" Enabled="true" Selected="false" Value="BISE Lahore" />
                                                    <asp:ListItem Text="IGCSE" Enabled="true" Selected="false" Value="IGCSE" />
                                                    <asp:ListItem Text="A-/AS-Levels" Enabled="true" Selected="false" Value="A-/AS-Levels" />
                                                </Items>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvSelectBoard" runat="server" ErrorMessage="Please select Your Board/Institute" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="select_board" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>--%>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc4">
                                        <div class="form">
                                            <asp:TextBox ID="roll_number" class="inputs" MaxLength="30" placeholder="Roll Number" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvRollNo" runat="server" ErrorMessage="Roll Number is required" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="roll_number" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>


                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">
                                            <asp:DropDownList ID="year_of_passing" Class="combobox col-lg-12 col-md-12 col-sm-12 col-xs-12 select_option" runat="server">
                                                <Items>
                                                    <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
                                                </Items>
                                                <Items>
                                            <asp:ListItem Text="2020" Value="2020" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2019" Value="2019" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2018" Value="2018" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2017" Value="2017" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2016" Value="2016" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2015" Value="2015" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2014" Value="2014" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2013" Value="2013" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2012" Value="2012" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2011" Value="2011" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2010" Value="2010" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2009" Value="2009" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2008" Value="2008" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2007" Value="2007" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2006" Value="2006" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2005" Value="2005" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2004" Value="2004" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2003" Value="2003" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2002" Value="2002" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2001" Value="2001" />
                                        </Items>
                                        <Items>
                                            <asp:ListItem Text="2000" Value="2000" />
                                        </Items>


                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvYearPassing" runat="server" ErrorMessage="Please select Passing year" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="year_of_passing" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form">

                                            <asp:TextBox ID="total_marks" MaxLength="5" class="inputs" onchange="OnMarksChange(this)" Placeholder="Total Marks" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvTotalMarks" runat="server" ErrorMessage="Total Marks required" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="total_marks" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="reTotalMarks" ControlToValidate="total_marks" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>'
                                                runat="server" ValidationExpression="\d+" ForeColor="Red"
                                                ErrorMessage="Please enter only numbers">
                                            </asp:RegularExpressionValidator>

                                        </div>
                                    </div>


                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form">
                                            <asp:TextBox ID="obtained_marks" MaxLength="5" class="inputs" onchange="OnMarksChange(this)" Placeholder="Obtained Marks" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvObtainedMarks" runat="server" ErrorMessage="Obtained Marks required" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="obtained_marks" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="reObtainedMarks" ControlToValidate="obtained_marks" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>'
                                                runat="server" ValidationExpression="\d+" ForeColor="Red"
                                                ErrorMessage="Please enter only numbers">
                                            </asp:RegularExpressionValidator>
                                            <br />
                                            <asp:CompareValidator runat="server" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ID="cvobtainedmarks" ControlToValidate="obtained_marks" ControlToCompare="total_marks" Operator="LessThanEqual" Type="Integer" ErrorMessage="Obtained marks cannot be greater than total marks!" ForeColor="red" /><br />

                                            <%--<input class="inputs" type="text" name="obtained_marks" placeholder="Obtained Marks" >--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">

                                            <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>
                                            <%--<asp:TextBox ID="percentage" class="inputs" Placeholder="Percentage" runat="server"  ReadOnly="true"></asp:TextBox>--%>
                                            <input class="inputs" maxlength="5" id="percentage" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvPercetage" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="percentage" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="rePercentage" ControlToValidate="percentage" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>'
                                                runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                                                ErrorMessage="numbers/decimals">
                                            </asp:RegularExpressionValidator>


                                            <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>
                                        </div>
                                    </div>


                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">

                                            <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>
                                            <asp:TextBox ID="division" MaxLength="6" class="inputs" Placeholder="Division" ReadOnly="true" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvDivision" runat="server" ErrorMessage="Division required" ValidationGroup='<%# "vgTestResults"+Container.ItemIndex %>' ControlToValidate="division" ForeColor="Red"></asp:RequiredFieldValidator>

                                            <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>
                                        </div>
                                    </div>
                                </div>

                            </div>



                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>

        <br />
        <button type="button" onserverclick="save_click" class=" btn button_bg" onclick="validatePage();" runat="server"><span class="NormalCharacterStyle">NEXT</span></button>

    </div>

    <script type="text/javascript">
        function showCaution() {
            document.getElementById('imgCaution0').style.display = 'inline-block';
            document.getElementById('imgSuccess0').style.display = 'none';
        }
        function showSuccess() {
            document.getElementById('imgCaution0').style.display = 'none';
            document.getElementById('imgSuccess0').style.display = 'inline-block';
        }
        function validatePage() {
            if (typeof (Page_ClientValidate) == 'function') {
                Page_ClientValidate();
            }

            if (!Page_IsValid) {
                if (Page_ClientValidate('vgTestResults0')) {
                    showSuccess();
                }
            else {
                    showCaution();
            }
        
                return (Page_ClientValidate('vgTestResults0'));
            }
        }

        function calcDivision(percentage) {
            if (percentage >= 0 && percentage <= 32) {
                return "Fail";
            }
            if (percentage >= 33 && percentage <= 35) {
                return "Third";
            }
            if (percentage >= 36 && percentage <= 59) {
                return "Second";
            }
            if (percentage >= 60 && percentage <= 100) {
                return "First";
            }
            return "none";
        }
        function OnMarksChange(textbox) {
            //var total = $("[id*=total_marks]")[0];
            //var obtained = $("[id*=obtained_marks]")[0];
            //var percentage = $("[id*=percentage]")[0];
            var total = $(textbox).parent().parent().parent().find('input[type="text"]')[1];
            var obtained = $(textbox).parent().parent().parent().find('input[type="text"]')[2];
            var percentage = $(textbox).parent().parent().parent().find('input[type="text"]')[3];
            var division = $(textbox).parent().parent().parent().find('input[type="text"]')[4];
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
            division.value = calcDivision(percentage.value);
        }
        function OpenCurrentPage() {
            $("#testResult").removeClass("NormalCharacterStyle24")
            $("#testResult").addClass("NormalCharacterStyle22");
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

        
        $('#menu_toggle2').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
        $('#menu_toggle3').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
        });
    </script>


</asp:Content>

