<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Test_Result.aspx.cs" Inherits="Test_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Test Results</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>


        <asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
      <div class="panel panel-default panel_shadow">
     <a id="menu_toggle" href='<%# "#collapse"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle10 margin_top"><asp:Label ID="Label12" runat="server" Text='<%#Eval("TestName")%>'></asp:Label><div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id='<%# "collapse"+Container.ItemIndex %>' class="panel-collapse panel-heading collapse">
          <div class="panel_divider"></div>
        <div class="panel-body" >
    <br/>

<div class="col-md-12">
<div class="col-md-10 text-left">
<div class="col-md-12">
         <div class="form">
             <asp:DropDownList ID="select_board" Class="combobox col-md-12 select_option" runat="server">

                 <Items>
                   <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="1" />
                     <asp:ListItem Text="FBISE" Enabled="true" Selected="false" Value="FBISE" />
                     <asp:ListItem Text="BISE Lahore" Enabled="true" Selected="false" Value="BISE Lahore" />
                 </Items>
             </asp:DropDownList>
<br />  <asp:RequiredFieldValidator ID="rvSelectBoard" runat="server" ErrorMessage="Please select Your Board/Institute" ValidationGroup="vgTestResults" ControlToValidate="select_board" ForeColor="Red" ></asp:RequiredFieldValidator>

     <%--<select class="combobox col-md-12 select_option">
  <option selected="selected">Select Board (example:BISE Lahore)</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <%--<input class="inputs" type="text" name="roll_number" placeholder="Roll Number" >--%>
         <asp:TextBox ID="roll_number" class="inputs" MaxLength="30" placeholder="Roll Number" runat="server"></asp:TextBox>
         <br />  <asp:RequiredFieldValidator ID="rvRollNo" runat="server" ErrorMessage="Roll Number is required" ValidationGroup="vgTestResults" ControlToValidate="roll_number" ForeColor="Red" ></asp:RequiredFieldValidator>

     <%--<input class="inputs" type="text" name="roll_number" placeholder="Roll Number" >--%>

    </div>
</div>


 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="year_of_passing" Class="combobox select_campus" runat="server">
                 <Items>
                   <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="1" />
                     <asp:ListItem Text="2015" Enabled="true" Selected="false" Value="2015" />
                     <asp:ListItem Text="2014" Enabled="true" Selected="false" Value="2014" />
                     <asp:ListItem Text="2013" Enabled="true" Selected="false" Value="2013" />
                     <asp:ListItem Text="2012" Enabled="true" Selected="false" Value="2012" />
                 </Items>
             </asp:DropDownList>
 <br />  <asp:RequiredFieldValidator ID="rvYearPassing" runat="server" ErrorMessage="Please select Passing year" ValidationGroup="vgTestResults" ControlToValidate="year_of_passing" ForeColor="Red" ></asp:RequiredFieldValidator>

     <%--<select class="combobox select_campus">
  <option selected="selected">Year of Passing</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>

</div></div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">

     <%--<input class="inputs" type="text" name="marks" placeholder="Total Marks" >--%>
        <asp:TextBox ID="total_marks" MaxLength="5"  class="inputs" onchange="OnMarksChange(this)" Placeholder="Total Marks"  runat="server"></asp:TextBox>
        <br />  <asp:RequiredFieldValidator ID="rvTotalMarks" runat="server" ErrorMessage="Total Marks required" ValidationGroup="vgTestResults" ControlToValidate="total_marks" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="reTotalMarks" ControlToValidate="total_marks" ValidationGroup="vgTestResults"
                    runat="server" ValidationExpression="\d+" ForeColor="Red"
                        ErrorMessage="Please enter only numbers">
                    </asp:RegularExpressionValidator>

     <%--<input class="inputs" type="text" name="marks" placeholder="Total Marks" >--%>

    </div>
</div>


<div class="col-md-6">
    <div class="form">
        <asp:TextBox ID="obtained_marks" MaxLength="5" class="inputs" onchange="OnMarksChange(this)"  Placeholder="Obtained Marks"  runat="server"></asp:TextBox>
            <br />  <asp:RequiredFieldValidator ID="rvObtainedMarks" runat="server" ErrorMessage="Obtained Marks required" ValidationGroup="vgTestResults" ControlToValidate="obtained_marks" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="reObtainedMarks" ControlToValidate="obtained_marks" ValidationGroup="vgTestResults"
                    runat="server" ValidationExpression="\d+" ForeColor="Red"
                        ErrorMessage="Please enter only numbers">
                    </asp:RegularExpressionValidator>

     <%--<input class="inputs" type="text" name="obtained_marks" placeholder="Obtained Marks" >--%>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">

     <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>
         <%--<asp:TextBox ID="percentage" class="inputs" Placeholder="Percentage" runat="server"  ReadOnly="true"></asp:TextBox>--%>
        <input class="inputs" maxlength="5" id="percentage" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
<br />  <asp:RequiredFieldValidator ID="rvPercetage" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup="vgTestResults" ControlToValidate="percentage" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="rePercentage" ControlToValidate="percentage" ValidationGroup="vgTestResults"
                 
     runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                        ErrorMessage="numbers/decimals">
                    </asp:RegularExpressionValidator>


     <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>

    </div>
</div>


<div class="col-md-6">
    <div class="form">

     <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>
        <asp:TextBox ID="division" MaxLength="6" class="inputs" Placeholder="Division" runat="server"></asp:TextBox>
       <br />  <asp:RequiredFieldValidator ID="rvDivision" runat="server" ErrorMessage="Division required" ValidationGroup="vgTestResults" ControlToValidate="division" ForeColor="Red" ></asp:RequiredFieldValidator>

     <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>

    </div>
</div>
<br/><br/>

</div>
<%-- <div class="col-md-2 pull-right">
     
 <div class="small_divider" ></div>
 <div class="text-center" style="margin-top: 50px;margin-left: 50px;">
<div class=" NormalCharacterStyle4">77%</div>
<div class="NormalCharacterStyle3">Your Aggregate</div>
</div>
    </div>--%>
</div>



        </div>
      </div>
    </div>

       </ItemTemplate>
            </asp:Repeater>

    

   

   <br/><br/>
         <button type="button" onserverclick="save_click" class=" btn button_bg" ValidationGroup="vgTestResults" runat="server"><span class="NormalCharacterStyle">NEXT</span></button>
         <br/><br/><br/><br/>
  </div>
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

