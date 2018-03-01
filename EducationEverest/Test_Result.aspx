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
         <asp:TextBox ID="roll_number" class="inputs" placeholder="Roll Number" runat="server"></asp:TextBox>
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
        <asp:TextBox ID="total_marks" class="inputs" Placeholder="Total Marks" runat="server"></asp:TextBox>

     <%--<input class="inputs" type="text" name="marks" placeholder="Total Marks" >--%>

    </div>
</div>


<div class="col-md-6">
    <div class="form">
        <asp:TextBox ID="obtained_marks" class="inputs" Placeholder="Obtained Marks" runat="server"></asp:TextBox>
     <%--<input class="inputs" type="text" name="obtained_marks" placeholder="Obtained Marks" >--%>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">

     <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>
         <asp:TextBox ID="percentage" class="inputs" Placeholder="Percentage" runat="server"></asp:TextBox>

     <%--<input class="inputs" type="text" name="percentage" placeholder="Percentage" >--%>

    </div>
</div>


<div class="col-md-6">
    <div class="form">

     <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>
        <asp:TextBox ID="division" class="inputs" Placeholder="Division" runat="server"></asp:TextBox>

     <%--<input class="inputs" type="text" name="Division" placeholder="Division" >--%>

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
         <button type="button" onserverclick="save_click" class=" btn button_bg" runat="server"><span class="NormalCharacterStyle">NEXT</span></button>
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

