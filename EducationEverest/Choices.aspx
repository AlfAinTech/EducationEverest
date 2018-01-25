<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Choices.aspx.cs" Inherits="Choices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Make Choices</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>

      <div class="panel panel-default panel_shadow">
      <div class="panel-heading" style="height: 50px">
        <h4 class="panel-title">
          <div class="NormalCharacterStyle10">Add Choices<div class="icon-arrow-right pull-right"><div class="check-"></div><a id="menu_toggle" ><i class="glyphicon glyphicon-chevron-down normal-color" data-toggle="collapse" data-parent="#accordion" href="#collapse2"></i></a></div></div> 
        </h4>
              </div>
      <div id="collapse2" class="panel-collapse panel-heading collapse">
        <div class="panel-body" >
    <br/>

<div class="col-md-12">
<div class="col-md-10 text-left">
<div class="col-md-12">
         <div class="form">
     <select id="university_select" class="combobox col-md-12 select_option" runat="server">
</select>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">

         <div class="form">
     <select class="combobox select_campus">
  <option selected="selected">Campus</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div></div>


 <div class="col-md-6">
         <div class="form">
     <select class="combobox select_campus">
  <option selected="selected">Department</option>
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
     <select class="combobox select_campus">
  <option selected="selected">Degree Program</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div></div>


 <div class="col-md-6">
         <div class="form">
     <select class="combobox select_campus">
  <option selected="selected">Catagory</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div></div>
<br/><br/><br/><br/>

</div>
<button type="button" class=" btn button_bg_1_ pull-right" data-toggle="modal" data-target="#exampleModalCenter"><span class="NormalCharacterStyle">ADD</span></button>
</div>

        </div>
      </div>
    </div>

    <div class="modal fade" id="exampleModalCenter">
  <div class="modal-dialog">
      <div class="panel panel-heading pop_bg text-center">
      <div class="NormalCharacterStyle12">Add Preferences</div>
      <br/>
      <div class="pop_divider"></div>
      <br/>


<div class="col-md-12 text-left">
<div class="col-md-12">
         <div class="form">
          <input type="text" name="University" class="col-md-12 preference_select_option" placeholder="University of Engineering & Technology, Lahore">
   
    </div>
</div>
<br/><br/><br/><br/>
<div class="row col-md-12">
<div class="col-md-6">

         <div class="form">
     <select class="combobox preference_select_campus">
  <option selected="selected">Campus</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div></div>
 <div class="col-md-6">
         <div class="form">
     <select class="combobox preference_select_campus">
  <option selected="selected">Department</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div></div>
</div>

<br/><br/><br/><br/>
<div class="row col-md-12">
 <div class="col-md-6">
         <div class="form">
     <select class="combobox preference_select_campus">
  <option selected="selected">Degree Program</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>
    </div></div>


 <div class="col-md-6">
         <div class="form">
     <select class="combobox preference_select_campus">
  <option selected="selected">Catagory</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>

</div></div></div>
<br/><br/><br/>

</div>
<button type="button" class=" btn add_button_1_ pull-right" data-toggle="modal" data-target="#exampleModalCenter"><span class="NormalCharacterStyle">ADD</span></button>

<div class="NormalCharacterStyle111 text-left" style="margin-top: 300px;">Your Preferences</div>

<table>
    <tr>
        <th></th>
        <th>Degree Program</th>
         <th>Campus</th>
          <th>Catagory/Semester</th>
           <th></th>
    </tr>
    <tr class="text-left">
        <td>1-</td>
        <td>Civil Engineering</td>
              <td>Lahore</td>
        <td>Catagory A</td>
              <td><a href=""><span class="edit_icon_1_"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><span class="delete_icon"></span></a></td>

    </tr>
    <tr class="text-left">
        <td></td>
        <td></td>
              <td></td>
        <td></td>
              <td></td>

    </tr>
</table>
<br/><br/>
<div><a href="" class="NormalCharacterStyle10" style="margin-left: 420px;">DONE</a></div>

    </div>
  </div>
</div>

     <div class="NormalCharacterStyle12"><h4>Your Choices</h4></div>

    <div class="panel panel-default panel_shadow">
      <div class="panel-heading">
        <div class="row text-left">
          <div class="col-md-1">
             <img src="images/uet_logo.png"></div>
             <div class="col-md-11">
        <h4 class="panel-title" style="margin-top: 20px">
                  <div class="NormalCharacterStyle_new1"> University of Engineering and Technology, Lahore Pakistan</div><div style="margin-left: 850px;margin-top: -30px;"><a class="edit_icon" data-toggle="collapse" data-parent="#accordion" href="#collapse3"></a></div>
        </h4><br/><br/>
        <small  class="NormalCharacterStyle_new2">Civil Engineering &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Catagory A &nbsp; ...</small>
        </div>
        </div>
      </div>


      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>

    <div class="panel panel-default panel_shadow">
      <div class="panel-heading">

         <div class="row text-left">
          <div class="col-md-1">
             <img src="images/image.png"></div>
             <div class="col-md-11">
        <h4 class="panel-title" style="margin-top: 10px">
                 <div class="NormalCharacterStyle_new1">Lahore University of Management and Sciences, Lahore Pakistan</div><div style="margin-left: 850px;margin-top: -30px;"><a class="edit_icon" data-toggle="collapse" data-parent="#accordion" href="#collapse4"></a></div>
        </h4><br/><br/>
        <div class="NormalCharacterStyle_new2">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>
        </div>
        </div>
    </div>
        <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
        </div>
<br/>
         <button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">NEXT</span></button>
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

