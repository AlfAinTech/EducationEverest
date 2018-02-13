<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Upload_Documents.aspx.cs" Inherits="Upload_Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Upload Documents</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
      <br/>
      <dl class="NormalCharacterStyle11">
        <dd>-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</dd>
        <dd>-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</dd>
        <dd>-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</dd>
      </dl>
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
    <div class="upload_documents_names">&#9656;B Form/CNIC of Student&nbsp;<span class="upload_documents_info">(Scaned Copy front and back, High Resolution)</span></div>
    <div class="col-md-12">
      <div class="col-md-1">
          <td rowspan="4">
          <label class="file-upload" onchange="previewFile()" >
                    <asp:FileUpload ID="FileUpload1" runat="server" > 
                    </asp:FileUpload>
                         <img src="" height="150" />
                         </label>
              </td>
    <%--<div class="upload_image_icon margin_top margin_left2"></div>--%>
</div>
<div class="col-md-3">

     
    <%--<div class="upload_documents_names margin_top3 margin_left3">Faizan_Elahi_CNIC_Front</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    --%>
</div>
    <%--<div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>--%>
  </div>
<br/><br/><br/><br/>
    <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-5">
    <div class="upload_documents_progress_text margin_top3 margin_left3">Faizan_Elahi_CNIC_Back&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    <div class="progress margin_left3">
  <div class="progress-bar progress-bar-info " role="progressbar" style="width:70%;height: 5px;">
  </div>
</div>
    </div>
  </div>
    <br/><br/><br/><br/>
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
            <asp:Label ID="lblSuccessfull" runat="server" Text="Successfully upload" Visible="false"></asp:Label>
             <asp:Button ID="useCNICUpload" runat="server" OnClick="useCNICUpload_Click" Text="Save" />
             <br/>

   <div class="panel_divider2"></div>

<br/>
    <div class="upload_documents_names">&#9656;Father CNIC&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
   <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-3">
    <div class="upload_documents_names margin_top3 margin_left3">Father_Elahi_CNIC_Front</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    </div>
    <div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>
  </div>
<br/><br/><br/><br/>
    <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-5">
    <div class="upload_documents_progress_text margin_top3 margin_left3">Father_Elahi_CNIC_Back&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    <div class="progress margin_left3">
  <div class="progress-bar progress-bar-info " role="progressbar" style="width:70%;height: 5px;">
  </div>
</div>
    </div>
  </div>
    <br/><br/><br/><br/>
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
    <br/>
    <div class="panel_divider2"></div>
        <br/>

    <div class="upload_documents_names">&#9656;Father Income Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
  <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-3">
    <div class="upload_documents_names margin_top3 margin_left3">Father_Income Certificate</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    </div>
    <div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>
  </div>
  <br/>
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
    <br/>
    <div class="panel_divider2"></div>
        </div>
      </div>
    </div>


<div class="panel panel-default panel_shadow">
           <a id="menu_toggle" href="#Educational" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle2 margin_top">Educational Documents<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id="Educational" class="panel-collapse panel-heading collapse">
                  <div class="panel_divider"></div>
        <div class="panel-body" >
    <div class="upload_documents_names">&#9656;Matriculation Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
  <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-3">
    <div class="upload_documents_names margin_top3 margin_left3">Matriculation_Certificate</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    </div>
    <div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>
  </div>
<br/><br/><br/><br/>
    
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
  <br/>

   <div class="panel_divider2"></div>

<br/>
    <div class="upload_documents_names">&#9656;Intermediate Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
    <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-3">
    <div class="upload_documents_names margin_top3 margin_left3">Intermediate_Certificate</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    </div>
    <div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>
  </div>
<br/><br/><br/><br/>
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
    <br/>
    <div class="panel_divider2"></div>
        </div>
      </div>
    </div>

 

 <div class="panel panel-default panel_shadow">
           <a id="menu_toggle" href="#Test" data-toggle="collapse" data-parent="#accordion">
      <div class="panel-heading" style="height: 60px">
        <h4 class="panel-title">
         <div class="NormalCharacterStyle2 margin_top">Test Results Documents<div class="icon-arrow-right pull-right"><div class="check-"></div><i class="glyphicon glyphicon-chevron-down normal-color"></i></div></div> 
        </h4>

              </div></a>
      <div id="Test" class="panel-collapse panel-heading collapse">
                  <div class="panel_divider"></div>
        <div class="panel-body" >
    <div class="upload_documents_names">&#9656;ECAT Result Card&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
    <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-3">
    <div class="upload_documents_names margin_top3 margin_left3">ECAT_Result_Card</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    </div>
    <div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>
  </div>
<br/><br/><br/><br/>
    
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
  <br/>

   <div class="panel_divider2"></div>

<br/>
    <div class="upload_documents_names">&#9656;LCAT Result Card&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
     <div class="col-md-12">
      <div class="col-md-1">
    <div class="upload_image_icon margin_top margin_left2"></div>
</div>
<div class="col-md-3">
    <div class="upload_documents_names margin_top3 margin_left3">LCAT_Result_Card</div>
    <div class="upload_documents_complete_text margin_left3">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text">197 KB</span></div>
    </div>
    <div class="col-md-1"><a href=""><div class=" cancel_icon margin_top3"></div></a></div>
  </div>
<br/><br/><br/><br/>
    <div style="margin-left: 650px"><a href=""><span class="NormalCharacterStyle101" > View Samples</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""  ><span class="NormalCharacterStyle22">Upload Image</span></a></div>
    <br/>
    <div class="panel_divider2"></div>
        </div>
      </div>
    </div>

 
    

   

   <br/><br/>
        <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Next" class=" btn button_bg NormalCharacterStyle"/>
         <%--<button type="button" class=" btn button_bg"><span class="NormalCharacterStyle">NEXT</span></button>--%>
         <br/><br/><br/><br/>
  </div>
<%--</div>--%>
    <script>

        function previewFile() {
            var preview = document.querySelector('img');
            var file = document.querySelector('input[type=file]').files[0];
            var reader = new FileReader();

            reader.addEventListener("load", function () {
                preview.src = reader.result;
            }, false);

            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>
</asp:Content>

