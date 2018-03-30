<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Test_Result.aspx.cs" Inherits="Test_Result" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px">Dashboard > File Admission Application > Test Results</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-left">
        <h3 class="NormalCharacterStyle12">Test Results</h3>


        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="panel panel-default panel_shadow">
                    <a id="menu_toggle" href='<%# "#collapse"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                        <div class="panel-heading" style="height: 60px">
                            <h4 class="panel-title">
                                <div class="NormalCharacterStyle10 margin_top">
                                    <asp:Label ID="Label12" runat="server" Text='<%#Eval("TestName")%>'></asp:Label>
                                    <div class="pull-right">
                                        <img src="images/caution_icon.png" style="margin-right: 5px" />
                                        <img src="images/check_icon.png" style="margin-right: 10px" />
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
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc5">
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
                                            <asp:RequiredFieldValidator ID="rvSelectBoard" runat="server" ErrorMessage="Please select Your Board/Institute" ValidationGroup="vgTestResults" ControlToValidate="select_board" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc4">
                                        <div class="form">
                                            <asp:TextBox ID="roll_number" class="inputs" MaxLength="30" placeholder="Roll Number" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvRollNo" runat="server" ErrorMessage="Roll Number is required" ValidationGroup="vgTestResults" ControlToValidate="roll_number" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>


                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">
                                            <asp:DropDownList ID="year_of_passing" Class="combobox select_campus col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc5" runat="server">
                                                <Items>
                                                    <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="1" />
                                                    <asp:ListItem Text="2015" Enabled="true" Selected="false" Value="2015" />
                                                    <asp:ListItem Text="2014" Enabled="true" Selected="false" Value="2014" />
                                                    <asp:ListItem Text="2013" Enabled="true" Selected="false" Value="2013" />
                                                    <asp:ListItem Text="2012" Enabled="true" Selected="false" Value="2012" />
                                                </Items>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvYearPassing" runat="server" ErrorMessage="Please select Passing year" ValidationGroup="vgTestResults" ControlToValidate="year_of_passing" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form">

                                            <asp:TextBox ID="total_marks" MaxLength="5" class="inputs" onchange="OnMarksChange(this)" Placeholder="Total Marks" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvTotalMarks" runat="server" ErrorMessage="Total Marks required" ValidationGroup="vgTestResults" ControlToValidate="total_marks" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="reTotalMarks" ControlToValidate="total_marks" ValidationGroup="vgTestResults"
                                                runat="server" ValidationExpression="\d+" ForeColor="Red"
                                                ErrorMessage="Please enter only numbers">
                                            </asp:RegularExpressionValidator>

                                        </div>
                                    </div>


                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form">
                                            <asp:TextBox ID="obtained_marks" MaxLength="5" class="inputs" onchange="OnMarksChange(this)" Placeholder="Obtained Marks" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvObtainedMarks" runat="server" ErrorMessage="Obtained Marks required" ValidationGroup="vgTestResults" ControlToValidate="obtained_marks" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="reObtainedMarks" ControlToValidate="obtained_marks" ValidationGroup="vgTestResults"
                                                runat="server" ValidationExpression="\d+" ForeColor="Red"
                                                ErrorMessage="Please enter only numbers">
                                            </asp:RegularExpressionValidator>
                                            <br />
                                            <asp:CompareValidator runat="server" ValidationGroup="vgTestResults" ID="cvobtainedmarks" ControlToValidate="obtained_marks" ControlToCompare="total_marks" Operator="LessThanEqual" Type="Integer" ErrorMessage="Obtained marks cannot be greater than total marks!" ForeColor="red" /><br />

                                            <%--<input class="inputs" type="text" name="obtained_marks" placeholder="Obtained Marks" >--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">

                                            <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>
                                            <%--<asp:TextBox ID="percentage" class="inputs" Placeholder="Percentage" runat="server"  ReadOnly="true"></asp:TextBox>--%>
                                            <input class="inputs" maxlength="5" id="percentage" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvPercetage" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup="vgTestResults" ControlToValidate="percentage" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="rePercentage" ControlToValidate="percentage" ValidationGroup="vgTestResults"
                                                runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                                                ErrorMessage="numbers/decimals">
                                            </asp:RegularExpressionValidator>


                                            <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>
                                        </div>
                                    </div>


                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mybspc5">
                                        <div class="form">

                                            <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>
                                            <asp:TextBox ID="division" MaxLength="6" class="inputs" Placeholder="Division" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rvDivision" runat="server" ErrorMessage="Division required" ValidationGroup="vgTestResults" ControlToValidate="division" ForeColor="Red"></asp:RequiredFieldValidator>

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
        <button type="button" onserverclick="save_click" class=" btn button_bg" validationgroup="vgTestResults" runat="server"><span class="NormalCharacterStyle">NEXT</span></button>

    </div>

    <script type="text/javascript">

        function OnMarksChange(textbox) {
            //var total = $("[id*=total_marks]")[0];
            //var obtained = $("[id*=obtained_marks]")[0];
            //var percentage = $("[id*=percentage]")[0];
            var total = $(textbox).parent().parent().parent().find('input[type="text"]')[1];
            var obtained = $(textbox).parent().parent().parent().find('input[type="text"]')[2];
            var percentage = $(textbox).parent().parent().parent().find('input[type="text"]')[3];
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
            $("#testResult").removeClass("NormalCharacterStyle24")
            $("#testResult").addClass("NormalCharacterStyle22");
            $("#fileAdmission").addClass("NormalCharacterStyle18");
            document.getElementById("fileAdmission").click();
        }

        $('#menu_toggle').on('click', function () {
            var iSelector = $(this).find('i:first');
            if (iSelector.hasClass('glyphicon-chevron-down')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-up')
            } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                iSelector.removeClass('glyphicon-chevron-down')
                iSelector.addClass('glyphicon-chevron-down')
            }
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

