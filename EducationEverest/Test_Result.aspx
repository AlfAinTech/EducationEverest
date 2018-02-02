<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Test_Result.aspx.cs" Inherits="Test_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Test Results</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>


        <asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
      <div class="panel panel-default panel_shadow">
     <a id="menu_toggle" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle10 margin_top">Engineering College Admission Test (ECAT)<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id="collapse2" class="panel-collapse panel-heading collapse">
          <div class="panel_divider"></div>
        <div class="panel-body" >
    <br/>

<div class="col-md-12">
<div class="col-md-10 text-left">
<div class="col-md-12">
         <div class="form">
     <select class="combobox col-md-12 select_option">
  <option selected="selected">Select Board (example:BISE Lahore)</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <input class="inputs" type="text" name="roll_number" placeholder="Roll Number" >
    </div>
</div>


 <div class="col-md-6">
         <div class="form">
     <select class="combobox select_campus">
  <option selected="selected">Year of Passing</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div></div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <input class="inputs" type="text" name="marks" placeholder="Total Marks" >
    </div>
</div>


<div class="col-md-6">
    <div class="form">
     <input class="inputs" type="text" name="obtained_marks" placeholder="Obtained Marks" >
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <input class="inputs" type="text" name="percentage" placeholder="Percentage" >
    </div>
</div>


<div class="col-md-6">
    <div class="form">
     <input class="inputs" type="text" name="Division" placeholder="Division" >
    </div>
</div>
<br/><br/>

</div>
 <div class="col-md-2 pull-right">
     
 <div class="small_divider" ></div>
 <div class="text-center" style="margin-top: 50px;margin-left: 50px;">
<div class=" NormalCharacterStyle4">77%</div>
<div class="NormalCharacterStyle3">Your Aggregate</div>
</div>
    </div>
</div>



        </div>
      </div>
    </div>

       </ItemTemplate>
            </asp:Repeater>

    

   

   <br/><br/>
         <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">NEXT</span></button>
         <br/><br/><br/><br/>
  </div>
</div>
<script type="text/javascript">
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

