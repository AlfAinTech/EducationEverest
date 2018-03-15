<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Educational_Detail.aspx.cs" Inherits="Educational_Detail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" Runat="Server">
    <div style="margin-top: 15px">Dashboard > File Admission Application > Educational Details</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header>
        <script language="javascript" type="text/javascript">
        function OnMatricMarksChange()
        {
            var total = $("[id*=total_marks_matric]")[0];
            var obtained = $("[id*=obtained_marks_matric]")[0];
            var percentage = $("[id*=percentage_matric]")[0];
            var totalValue = 0;
            var obtainedValue = 0;
            var percentageValue = 0;
            if(total != null || total != undefined || total.value != "")
            {
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
    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Educational Details</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur.</p>

      <div class="panel panel-default panel_shadow">
      <a id="menu_toggle" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle10 margin_top">Matriculation/ O-Level<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
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
             <asp:DropDownList ID="DropDownList1" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
   </Items>
                  <Items>
       <asp:ListItem Text="FBISE"  Value="FBISE" />
   </Items>
                  <Items>
       <asp:ListItem Text="BISE LAHORE" Value="BISE LAHORE" />
   </Items>
             </asp:DropDownList>
                 <br />  <asp:RequiredFieldValidator ID="rvPInstituteMatric" runat="server" ErrorMessage="Please select Matric Institute" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList1" ForeColor="Red" ></asp:RequiredFieldValidator>

     <%--<select class="combobox col-md-12 select_option">
  <option selected="selected">Select Board</option>
  <option value="PA">BISE Lahore</option>
  <option value="CT">FBISE</option>
</select>--%>
    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <input class="inputs" maxlength="30" id="rollno_matric" type="text" name="roll_number" placeholder="Roll Number" runat="server" />
 <br />  <asp:RequiredFieldValidator ID="rvRollNo" runat="server" ErrorMessage="Roll Number is required" ValidationGroup="vgEducationalDetails" ControlToValidate="rollno_matric" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>


 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="DropDownList2" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
   </Items>
                  <Items>
       <asp:ListItem Text="2015"  Value="2015" />
   </Items>
                  <Items>
       <asp:ListItem Text="2014" Value="2014" />
   </Items>

             </asp:DropDownList>
             <br />  <asp:RequiredFieldValidator ID="rvSelectYear" runat="server" ErrorMessage="Please select Passing year" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList2" ForeColor="Red" ></asp:RequiredFieldValidator>

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

     <input class="inputs" maxlength="5" id="total_marks_matric" onchange="OnMatricMarksChange()" type="text" name="marks" placeholder="Total Marks" runat="server" />
<br />  <asp:RequiredFieldValidator ID="rvTotalMarksMatric" runat="server" ErrorMessage="Total Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="total_marks_matric" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="reTotalMarksMatric" ControlToValidate="total_marks_matric" ValidationGroup="vgEducationalDetails"
                    runat="server" ValidationExpression="\d+" ForeColor="Red"
                        ErrorMessage="Please enter only numbers">
                    </asp:RegularExpressionValidator>
<%--<br /><asp:RegularExpressionValidator id="reTotalMarksMatric"
                   ControlToValidate="total_marks_matric" ValidationGroup="vgEducationalDetails"
                   ValidationExpression="\d+"
                   Display="Static" ForeColor="Red"
                   EnableClientScript="true"
                   ErrorMessage="Only numeric fields"
                   runat="server"/>--%>


     

    </div>
</div>


<div class="col-md-6">
    <div class="form">
             <input class="inputs" maxlength="5" id="obtained_marks_matric" onchange="OnMatricMarksChange()" type="text" name="obtained_marks" placeholder="Obtained Marks" runat="server" />

    <br />  <asp:RequiredFieldValidator ID="rvObtainedMarksMatric" runat="server" ErrorMessage="Obtained Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="obtained_marks_matric" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="reObtainedMarksMatric" ControlToValidate="obtained_marks_matric" ValidationGroup="vgEducationalDetails"
                    runat="server" ValidationExpression="\d+" ForeColor="Red"
                        ErrorMessage="Please enter only numbers">
                    </asp:RegularExpressionValidator>
      <br />  <asp:CompareValidator runat="server" id="cvMatric" ValidationGroup="vgEducationalDetails" controltovalidate="obtained_marks_matric" controltocompare="total_marks_matric" operator="LessThanEqual" type="Integer" errormessage="Obtained marks cannot be greater than total marks!" ForeColor="red" /><br />

        <%--<asp:RegularExpressionValidator id="reObtainedMarksMatric"
                   ControlToValidate="obtained_marks_matric" ValidationGroup="vgEducationalDetails"
                   ValidationExpression="\d+"
                   Display="Static" ForeColor="Red"
                   EnableClientScript="true"
                   ErrorMessage="Only numeric fields"
                   runat="server"/>--%>




    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <input class="inputs" maxlength="5" id="percentage_matric" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
            <br />  <asp:RequiredFieldValidator ID="rvPercetageMatric" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup="vgEducationalDetails" ControlToValidate="percentage_matric" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="rePercentageMatric" ControlToValidate="percentage_matric" ValidationGroup="vgEducationalDetails"
                 
     runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                        ErrorMessage="numbers/decimals">
                    </asp:RegularExpressionValidator>

    </div>
</div>
  <%-- runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"--%>

<div class="col-md-6">
    <div class="form">
     <input class="inputs" maxlength="6" id="division_matric" type="text" name="Division" placeholder="Division" runat="server" />
     <br />  <asp:RequiredFieldValidator ID="rvDivisioMatric" runat="server" ErrorMessage="Division required" ValidationGroup="vgEducationalDetails" ControlToValidate="division_matric" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>
<br/><br/><br/>

</div>
</div>

        </div>
      </div>
    </div>

 


       <div class="panel panel-default panel_shadow">
      <a id="menu_toggle" href="#interpanel" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle2 margin_top">Intermediate/A-Level<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id="interpanel" class="panel-collapse panel-heading collapse">
        <div class="panel_divider"></div>
        <div class="panel-body" >
    <br/>

<div class="col-md-12">
<div class="col-md-10 text-left">
<div class="col-md-12">
         <div class="form">
             <asp:DropDownList ID="DropDownList3" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
   </Items>
                  <Items>
       <asp:ListItem Text="FBISE"  Value="FBISE" />
   </Items>
                  <Items>
       <asp:ListItem Text="BISE LAHORE" Value="BISE LAHORE" />
   </Items>
             </asp:DropDownList>
    <br />  <asp:RequiredFieldValidator ID="rvSelectPInstituteInterm" runat="server" ErrorMessage="Please select Intermediate Institute" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList3" ForeColor="Red" ></asp:RequiredFieldValidator>

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
     <input class="inputs" maxlength="30" id="rollno_intermediate" type="text" name="roll_number" placeholder="Roll Number" runat="server" />
         <br />  <asp:RequiredFieldValidator ID="rvRollnoIntermediate" runat="server" ErrorMessage="Roll Number is required" ValidationGroup="vgEducationalDetails" ControlToValidate="rollno_intermediate" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>


 <div class="col-md-6">
         <div class="form">
             <asp:DropDownList ID="DropDownList4" Class="combobox col-md-12 select_option" runat="server">
                 <Items>
       <asp:ListItem Text="Select" Enabled="true" Selected="true" Value="" />
   </Items>
                  <Items>
       <asp:ListItem Text="2015"  Value="2015" />
   </Items>
                  <Items>
       <asp:ListItem Text="2014" Value="2014" />
   </Items>
             </asp:DropDownList>
 <br />  <asp:RequiredFieldValidator ID="rvSelectyearInter" runat="server" ErrorMessage="Please select Passing Year" ValidationGroup="vgEducationalDetails" ControlToValidate="DropDownList4" ForeColor="Red" ></asp:RequiredFieldValidator>

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

     <input class="inputs" maxlength="5" id="total_marks_intermediate" onchange="OnintermediateMarksChange()" type="text" name="marks" placeholder="Total Marks" runat="server" />
        <br />  <asp:RequiredFieldValidator ID="rvTotalMarksIntermediate" runat="server" ErrorMessage="Total Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="total_marks_intermediate" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="reTotalMarksIntermediate" ControlToValidate="total_marks_intermediate" ValidationGroup="vgEducationalDetails"
                    runat="server" ValidationExpression="\d+" ForeColor="Red"
                        ErrorMessage="Please enter only numbers">
                    </asp:RegularExpressionValidator>


    </div>
</div>


<div class="col-md-6">
    <div class="form">

     <input class="inputs" maxlength="5" id="obtained_marks_intermediate" onchange="OnintermediateMarksChange()" type="text" name="obtained_marks" placeholder="Obtained Marks" runat="server" />
        <br />  <asp:RequiredFieldValidator ID="rvObtainedMarksIntermediate" runat="server" ErrorMessage="Obtained Marks required" ValidationGroup="vgEducationalDetails" ControlToValidate="obtained_marks_intermediate" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="obtained_marks_intermediate" ValidationGroup="vgEducationalDetails"
                    runat="server" ValidationExpression="\d+" ForeColor="Red"
                        ErrorMessage="Please enter only numbers">
                    </asp:RegularExpressionValidator>
      <br />  <asp:CompareValidator runat="server"  ValidationGroup="vgEducationalDetails" id="cvIntermediate" controltovalidate="obtained_marks_intermediate" controltocompare="total_marks_intermediate" operator="LessThanEqual" type="Integer" errormessage="Obtained marks cannot be greater than total marks!" ForeColor="red" /><br />


    </div>
</div>
<br/><br/><br/><br/>
<div class="col-md-6">
    <div class="form">
     <input class="inputs" maxlength="5" id="percentage_intermediate" type="text" name="percentage" placeholder="Percentage" runat="server" readonly="true" />
                    <br />  <asp:RequiredFieldValidator ID="rvPercentageIntermediate" runat="server" ErrorMessage="Percentage will be calculated automatically" ValidationGroup="vgEducationalDetails" ControlToValidate="percentage_intermediate" ForeColor="Red" ></asp:RequiredFieldValidator>
<br /><asp:RegularExpressionValidator ID="rePercentageIntermediate" ControlToValidate="obtained_marks_intermediate" ValidationGroup="vgEducationalDetails"
                    runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red"
                        ErrorMessage="numbers/decimals ">
                    </asp:RegularExpressionValidator>

    </div>
</div>


<div class="col-md-6">
    <div class="form">
     <input class="inputs" maxlength="6" id="division_intermediate" type="text" name="Division" placeholder="Division" runat="server" />
             <br />  <asp:RequiredFieldValidator ID="reDivisionIntermediate" runat="server" ErrorMessage="Division required" ValidationGroup="vgEducationalDetails" ControlToValidate="division_intermediate" ForeColor="Red" ></asp:RequiredFieldValidator>

    </div>
</div>
<br/><br/><br/>

</div>
</div>

        </div>
      </div>
    </div>

    

   <br/>

   
         <button type="button" onserverclick="button_click" class=" btn button_bg" validationgroup="vgEducationalDetails" runat="server"><span class="NormalCharacterStyle">NEXT</span></button>

         <br/><br/><br/><br/><br/><br/>
  </div>
</div>

</asp:Content>

