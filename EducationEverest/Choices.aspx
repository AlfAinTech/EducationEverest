﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Choices.aspx.cs" Inherits="Choices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Make Choices</h3><asp:HiddenField ID="HiddenField1" runat="server" />
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>

      <div class="panel panel-default panel_shadow">
       <a id="menu_toggle" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle10 margin_top">Add Choices<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
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
     
             <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="1" />
   </Items>


             </asp:DropDownList>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">

         <div class="form">

             <asp:DropDownList ID="DropDownList2" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>


             </asp:DropDownList>

     <%--<select class="combobox select_campus">
  <option selected="selected">Campus</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>
    </div></div>


 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="DropDownList3" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>


             </asp:DropDownList>

</div></div>
<br/><br/><br/><br/>
 <div class="col-md-6">

         <div class="form">
     
             <asp:DropDownList ID="DropDownList5" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>


             </asp:DropDownList>
        
    </div></div>


 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="DropDownList4" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>
             </asp:DropDownList>

     

</div></div>
<br/><br/><br/><br/>

</div> <%--outer ADD button--%>

<button type="button" id="button1" class=" btn button_bg_1_ pull-right" data-toggle="modal" data-target="#exampleModalCenter"><span class="NormalCharacterStyle">ADD</span></button>
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
             <asp:Label ID="Label1" name="University" class="combobox col-md-12 select_option"  runat="server" Text=""></asp:Label>
          <%--<input type="text" name="University" class="col-md-12 preference_select_option" placeholder="University of Engineering & Technology, Lahore">--%>
   
    </div>
</div>
<br/><br/><br/><br/>
<div class="row col-md-12">  <%--here starts modal dropdown lists--%>
<div class="col-md-6">

         <div class="form">
             <asp:DropDownList ID="DropDownList6" class="combobox preference_select_campus" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>
             </asp:DropDownList>


     <%--<select class="combobox preference_select_campus" runat="server">
  <option selected="selected">Campus</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>
    </div></div>
 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="DropDownList7" class="combobox preference_select_campus" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>
             </asp:DropDownList>

     <%--<select class="combobox preference_select_campus">
  <option selected="selected">Department</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>

</div></div>
</div>

<br/><br/><br/><br/>
<div class="row col-md-12">
 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="DropDownList8" class="combobox preference_select_campus" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>
             </asp:DropDownList>

     <%--<select class="combobox preference_select_campus">
  <option selected="selected">Degree Program</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>
    </div></div>


 <div class="col-md-6">
         <div class="form">

             <asp:DropDownList ID="DropDownList9" class="combobox preference_select_campus" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="0" />
   </Items>
             </asp:DropDownList>

     <%--<select class="combobox preference_select_campus">
  <option selected="selected">Catagory</option>
  <option value="PA">Pennsylvania</option>
  <option value="CT">Connecticut</option>
  <option value="NY">New York</option>
  <option value="MD">Maryland</option>
  <option value="VA">Virginia</option>
</select>--%>

</div></div></div>
<br/><br/><br/>

</div>
          <%--Model ADD Button--%>
<button type="button" id="button_modal" class=" btn add_button_1_ pull-right" ><span class="NormalCharacterStyle">ADD</span></button>

<div class="NormalCharacterStyle111 text-left" style="margin-top: 300px;">Your Preferences</div>
          <%--<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server"><ContentTemplate>--%>

     <table class="table-fixed text-left css-serial"  >
                <tbody id="GridPreferences">
    <tr class="col-md-12">
         <td class="col-md-1"><span style="">#</span></td>
             <td class="col-md-3"><b>Degree Program</b></td>
             <td class="col-md-2"><b>Campus</b></td>
             <td class="col-md-4"><b>Catagory/Semester</b></td>
             <td class="col-md-2"><span style="color: transparent;"></span></td>
              
     
    </tr>
          </tbody>            
                   
          <script id="preferences_template" type="text/x-jquery-tmpl">
              
             
               
    <tr class="col-md-12">
        <td class="col-md-1"></td>
        <td class="col-md-3">${departmentName}</td>
              <td class="col-md-2">${campusName}</td>
        <td class="col-md-4">${catagory}</td>
              <td class="col-md-2">
                  <%--<a id='buttonEdit${id}'   onclick="return EditPreferences('${id}')"><span class="edit_icon_1_"></span></a>--%>
                  <%--<a id='addEdit${id}' style="display:none"   onclick="return addPreferences('${id}')"><span class="edit_icon_1_"></span></a>--%>
                 
                  <a id='delete${id}'   onclick="return deletePreferences('${id}')"><img src="images/delete_icon.png"></a></td>

    </tr>
                
          </script>
               

             <%-- <tbody  id="GridPreferences">
    </tbody>--%>
             </table>           
              <%--</ContentTemplate></asp:UpdatePanel>--%>
          <%--<asp:GridView ID="GridView1" AutoGenerateColumns="true" runat="server">
              <%--<Columns>

                                  <asp:TemplateField>
                        <ItemTemplate>
                             <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


              <asp:TemplateField HeaderText ="Degree Program">
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%#Eval("Programm.Program_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

                  <asp:TemplateField HeaderText ="Campus">
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text='<%#Eval("Campus.Campus_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


                  <asp:TemplateField HeaderText ="Category/Semester">
                <ItemTemplate>
                    <asp:Label ID="Label16" runat="server" Text='<%#Eval("ProgrammCategory.Category.Category_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

                  </Columns>
          </asp:GridView>--%>

<%--<table>
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
</table>--%>
<br/><br/>
<div><a href="" class="NormalCharacterStyle10" data-toggle="modal" data-target="#exampleModalCenter" style="margin-left: 420px;">DONE</a></div>

    </div>
  </div>
</div>

     <div class="NormalCharacterStyle12"><h4>Your Choices</h4></div>

    
      


        <asp:Repeater ID="ChoicesList" runat="server" OnItemDataBound="ChoicesList_ItemDataBound"><ItemTemplate>
    <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
              <asp:Image ID="logo" runat="server"  />
             </div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus").ToString()=="0"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("Appstatus") %></b></small></div>
        </h4>
        <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
        <h4 class="blue_text margin_left">Application ID: <%# Eval("AspNetUser.id") %></h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text"><%# Eval("ApplicationDate") %></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text"><%# Eval("university.deadLine") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text"><%# Eval("Appstatus") %></span>
      </div>
        </div>
        </div><br/>
        <div class="divider"></div><br/>
        <a href="" class="pull-right NormalCharacterStyle18" style="margin-right: 30px;"><b>VIEW</b></a>
      </div>

      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Some Text</div>
      </div>
    </div>
</ItemTemplate></asp:Repeater>
<br/>

        
         <asp:LinkButton type="button" runat="server" OnClick="next_click"  class=" btn button_bg" runat="server"><span class="NormalCharacterStyle">NEXT</span></asp:LinkButton>

         

         <br/><br/><br/><br/>
        <asp:HiddenField ID="hf_UniID" Value="0" runat="server" />
  </div>
</div>

    <script type="text/javascript">
        

        function populateGridview(universityId){
            alert("this is university Id : " + universityId);
            document.getElementById('<%= hf_UniID.ClientID %>').value = universityId.toString();
            alert(document.getElementById("hf_UniID").value);
            <%= show() %>

        }


        $(document).ready(function () {


            var count = 0;
            
            
                $('a').click(function () {
                    //store the id of the collapsible element
                    localStorage.setItem('collapseItem', $(this).attr('href'));
                });

                var collapseItem = localStorage.getItem('collapseItem');
                if (collapseItem) {
                    $(collapseItem).collapse('show')
                }

            // $('#exampleModalCenter').modal('show');

            var ddlCustomers1 = $("[id*=DropDownList1]");
            //ddlCustomers1.on('change', function (e) {
            //    GetData(e.target.value);
            
            //}
        //console.log(ddlCustomers1.val());
        GetData(ddlCustomers1.val());
            //)
            function GetData(id) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetData",
                    data: '{"id":"'+id+'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnSuccess(r) {
                var ddlCustomers2 = $("[id*=DropDownList2]"); 
                ddlCustomers2.empty().append('<option selected="selected" value="0">Select Campus</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddlCustomers2.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }

            var uni = $("[id*=DropDownList1]");

         
            $("[id*=DropDownList2]").on('change', function (e) {
                GetCampusbasedDepartmentData(e.target.value);
            }
            )
            $("[id*=DropDownList6]").on('change', function (e) {
                GetModalDepartmentData(e.target.value);
            }
           )
           // GetCampusData(campusval.val());
            function GetCampusbasedDepartmentData(campusValue) {
                //window.alert(campusValue)
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetDepartmentData",
                    data: '{"id":"' + campusValue + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnCampusbasedDepartmentDataSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnCampusbasedDepartmentDataSuccess(r) {
                var ddl3 = $("[id*=DropDownList3]");
                ddl3.empty().append('<option selected="selected" value="0">Select Department</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddl3.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }

          
            var uni = $("[id*=DropDownList1]");
            var dpt = $("[id*=DropDownList3]");
            var program = $("[id*=DropDownList5]");

            program.on('change', function (e) {
                Get1CategoryData(e.target.value,uni.val(),dpt.val());
            }
            )
            function Get1CategoryData(id,uniId,dptId) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetCategoryData",
                    data: '{"id":"' + id + '","uniId":"' + uniId + '","dptId":"'+ dptId +'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnCategorySuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnCategorySuccess(r) {
                var ddl4 = $("[id*=DropDownList4]");
                ddl4.empty().append('<option selected="selected" value="0">Select Category</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddl4.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }

            var uni = $("[id*=DropDownList1]");
            var department = $("[id*=DropDownList3]");
            department.on('change', function (e) {
                GetDepartmentData(e.target.value,uni.val());
            }
            )
            function GetDepartmentData(id,uniId) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetProgrammData",
                    data: '{"id":"'+ id+'","uniId":"'+uniId+'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnProgramSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnProgramSuccess(r) {
                var ddl5 = $("[id*=DropDownList5]");
                ddl5.empty().append('<option selected="selected" value="0">Select Programm</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddl5.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }

            var uni = $("[id*=DropDownList1]");
            var campus = $("[id*=DropDownList2]");
            var department = $("[id*=DropDownList3]");
            var category = $("[id*=DropDownList4]");
            var program = $("[id*=DropDownList5]");
            var hidden = $("[id*=HiddenField1]");
            //outer button click success
            var button1 = $("[id*=button1]");
            button1.click(function () {
                save_main_page_data(uni.val(), campus.val(), department.val(), category.val(), program.val());
            });

            function save_main_page_data(uni,cmp,dpt,ctg,pgm) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/SaveMainPageData",
                    data: '{"uni":"' + uni + '","cmp":"' + cmp + '","dpt":"' + dpt + '","ctg":"' + ctg + '","pgm":"' + pgm + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    failure: function (response) {
                        alert(response.d);
                        console.log("this is an error og");
                    },
                    success: function (result) {
                        console.log("this is the data" + result.toString());
                        BindData(result)
                        //populateGridview(result);

                }
                });
            }
            


            var ddlCustomersuni = $("[id*=DropDownList1]");
            //ddlCustomersuni.on('change', function (e) {
            //    GetModalCampusData(e.target.value);
            //}
            //)
            GetModalCampusData(ddlCustomersuni.val());
            function GetModalCampusData(id) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetData",
                    data: '{"id":"' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessModalData,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnSuccessModalData(r) {
                var ddlCustomers6 = $("[id*=DropDownList6]");
                ddlCustomers6.empty().append('<option selected="selected" value="0">Select Campus</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddlCustomers6.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }

            
           // GetModalDepartmentData(ddlCustomersuni1.val());
            function GetModalDepartmentData(id) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetDepartmentData",
                    data: '{"id":"' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnModalDepartmentSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnModalDepartmentSuccess(r) {
                var ddldepart7 = $("[id*=DropDownList7]");
                ddldepart7.empty().append('<option selected="selected" value="0">Select Department</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddldepart7.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }


            var uni8 = $("[id*=DropDownList1]");
            var department8 = $("[id*=DropDownList7]");
            department8.on('change', function (e) {
                GetModalDepartment1Data(e.target.value, uni8.val());
            }
            )
            function GetModalDepartment1Data(id, uniId) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetProgrammData",
                    data: '{"id":"' + id + '","uniId":"' + uniId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnModalProgram1Success,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnModalProgram1Success(r) {
                var ddl8 = $("[id*=DropDownList8]");
                ddl8.empty().append('<option selected="selected" value="0">Select Programm</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddl8.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }
            
            

            var uni9 = $("[id*=DropDownList1]");
            var dpt9 = $("[id*=DropDownList7]");
            var program9 = $("[id*=DropDownList8]");

            program9.on('change', function (e) {
                GetCategoryData(e.target.value, uni9.val(), dpt9.val());
            }
            )
            function GetCategoryData(id, uniId, dptId) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/GetCategoryData",
                    data: '{"id":"' + id + '","uniId":"' + uniId + '","dptId":"' + dptId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnCategory1Success,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            function OnCategory1Success(r) {
                var ddl9 = $("[id*=DropDownList9]");
                ddl9.empty().append('<option selected="selected" value="0">Select Category</option>');
                for (var i = 0; i < r.d.length; i++) {
                    var data = r.d[i];
                    var dataList = data.split(",");
                    ddl9.append("<option value='" + dataList[0] + "'>" + dataList[1] + "</option>");
                }
            }





            var uni10 = $("[id*=DropDownList1]");
            var campus10 = $("[id*=DropDownList6]");
            var department10 = $("[id*=DropDownList7]");
            var category10 = $("[id*=DropDownList9]");
            var program10 = $("[id*=DropDownList8]");
            //Model Button Add Click
            var button_modal = $("[id*=button_modal]");
            button_modal.click(function () {
               // alert("here")
                save_main_page_data1(uni10.val(), campus10.val(), department10.val(), category10.val(), program10.val());
            });

            function save_main_page_data1(uni, cmp, dpt, ctg, pgm) {
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/SaveMainPageData",
                    data: '{"uni":"' + uni + '","cmp":"' + cmp + '","dpt":"' + dpt + '","ctg":"' + ctg + '","pgm":"' + pgm + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    failure: function (response) {
                        alert(response.d);
                    },
                    success: function(response)
                    {
                       
                        BindData(response)

                    }
                });
            }
            deletePreferences = function (id) {
                console.log(id);
                $.ajax({
                    type: "POST",
                    url: "Choices.aspx/deletePreference",
                    data: '{"id":"' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    failure: function (response) {
                        alert(response.d);
                        return false;;
                    },
                    success: function (response) {
                        //alert("here");
                        BindData(response);
                        return false;
                    },
                    error:function(error)
                    {
                        alert(error);
                    }
                });

            }
            
            



        })
        BindData = function (response)
        {
            //alert(response.d);
            var data = response.d;
            data1 =  JSON.parse(data);
            console.log(data1);
            $("#GridPreferences").find("tr:gt(0)").remove();
            $("#preferences_template").tmpl(data1).appendTo("#GridPreferences");
            // $("GridPreferences")
        }
       
        EditPreferences = function (id) {
            alert(id);
            $("catagory" + id).disabled = false;
            $("departmentName" + id).disabled = false;
            $("campusName" + id).disabled = false;
            $("buttonEdit" + id).style.display = "none";
            $("addEdit$" + id).style.display = "block";
            return false;
            
        }
        addPreferences= function(id)
        {
           var catagory =  $("catagory" + id).value;
           var departmentName = $("departmentName" + id).value;
           var campusName = $("campusName" + id).value;
            
        }
        function OpenCurrentPage() {
            $("#makeChoices").parent().addClass("selected_bg");
            $("#makeChoices").removeClass("NormalCharacterStyle24")
            $("#makeChoices").addClass("NormalCharacterStyle22");
            document.getElementById("fileAdmission").click();
            $("#fileAdmission").removeClass("NormalCharacterStyle25")
            $("#fileAdmission").addClass("NormalCharacterStyle18");
        }
    </script>

</asp:Content>

