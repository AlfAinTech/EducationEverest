<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Client.master" CodeFile="Upload_Documents.aspx.cs" Inherits="Upload_Documents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StatusBas" runat="Server">
    <div style="margin-top: 15px">Dashboard > File Admission Application > Documents</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <script language="javascript" type="text/javascript">
            function OpenCurrentPage() {
                $("#Upload_Documents").removeClass("NormalCharacterStyle24")
                $("#Upload_Documents").addClass("NormalCharacterStyle22");
                $("#menu_togglePersonalDoc").click();
                $("#fileAdmission").addClass("NormalCharacterStyle18");
                document.getElementById("fileAdmission").click();
            }
            function OpenEducationPanel() {
                $("#Upload_Documents").addClass("NormalCharacterStyle24")
                $("#Upload_Documents").removeClass("NormalCharacterStyle22");
                $("#menu_toggleEducationalDoc").click();
                $("#fileAdmission").addClass("NormalCharacterStyle18");
                document.getElementById("fileAdmission").click();
            }
            function OpenTestPanel() {
                $("#Upload_Documents").addClass("NormalCharacterStyle24")
                $("#Upload_Documents").removeClass("NormalCharacterStyle22");
                $("#menu_toggleTest").click();
                $("#fileAdmission").addClass("NormalCharacterStyle18");
                document.getElementById("fileAdmission").click();

            }
            var validFilesTypes = ["pdf", "doc", "docx"];

            function ValidateFile(UploadControl) {
                var file = document.getElementById(UploadControl);
                var path = file.value;
                var isValidFile = false;
                var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
                for (var i = 0; i < validFilesTypes.length; i++) {
                    if (ext == validFilesTypes[i]) {
                        isValidFile = true;
                        break;
                    }
                }
                return isValidFile;
            }
            function ValidateSize(UploadControl) {
                var file = document.getElementById(UploadControl);
                var path = file.value;
                var isValidFile = true;
                input = document.getElementById(UploadControl);
                file = input.files[0];
                size = file.size / 1000000
                if (size > 4) {
                    isValidFile = false;
                    window.alert("File size exceeds allowed limit");
                }
                return isValidFile;

            }




            function UplaodStudentCNic() {
                var ProgressPanel = "showProgressStudentCNIC";
                var Progressbardiv = "progressStudentCNIC";
                var UploadControl = '<%=FileUploadStudentCNIC.ClientID %>';
                 var FileNameLabel = "studentCNICName";
                 var FileSizeLabel = "studentCNICSize";
                 var FileSizeValidation = ValidateSize(UploadControl);
                 if (FileSizeValidation) {
                     var CorectFileType = ValidateFile(UploadControl);
                     console.log(CorectFileType);
                     if (CorectFileType) {
                         var flag = ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel);
                         if (flag) {

                             var btnID = '<%=uploadStudentCNIc.ClientID %>';
                                 document.getElementById('<%=uploadStudentCNIc.ClientID %>').click();
                                 document.getElementById(Progressbardiv).style.display = "block";
                             }
                         }
                         else {

                             window.alert("Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", "));
                         }
                     }
                 }

                 function UplaodFatherCNic() {
                     var ProgressPanel = "showProgressFatherCNIC";
                     var Progressbardiv = "progressFatherCNIC";
                     var UploadControl = '<%=FileUploadFatherCNIC.ClientID %>';
                 var FileNameLabel = "fatherCNICName";
                 var FileSizeLabel = "fatherCNICSize";
                 var FileSizeValidation = ValidateSize(UploadControl);
                 if (FileSizeValidation) {
                     var CorectFileType = ValidateFile(UploadControl);
                     if (CorectFileType) {
                         var flag = ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel);
                         if (flag) {

                             var btnID = '<%=uploadFatherCNIC.ClientID %>';
                             document.getElementById('<%=uploadFatherCNIC.ClientID %>').click();
                             document.getElementById(Progressbardiv).style.display = "block";
                         }
                     }
                     else {

                         window.alert("Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", "));
                     }
                 }
             }

             function UplaodFatherIncomeCerti() {
                 var ProgressPanel = "showProgressFatherIncomeCerti";
                 var Progressbardiv = "progressFatherIncomeCerti";
                 var UploadControl = '<%=FileUploadFatherIncomeCerti.ClientID %>';
                 var FileNameLabel = "FatherIncomeCertiName";
                 var FileSizeLabel = "FatherIncomeCertiSize";
                 var FileSizeValidation = ValidateSize(UploadControl);
                 if (FileSizeValidation) {
                     var CorectFileType = ValidateFile(UploadControl);
                     if (CorectFileType) {
                         var flag = ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel);
                         if (flag) {

                             var btnID = '<%=uploadFatherIncomeCerti.ClientID %>';
                             document.getElementById('<%=uploadFatherIncomeCerti.ClientID %>').click();
                             document.getElementById(Progressbardiv).style.display = "block";
                         }
                     }
                     else {

                         window.alert("Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", "));
                     }
                 }
             }

             function UpoadMatricCerti() {
                 var ProgressPanel = "showProgressMatricCerti";
                 var Progressbardiv = "progressMatricCerti";
                 var UploadControl = '<%=FileUploadMatricCerti.ClientID %>';
                 var FileNameLabel = "MatricCertiName";
                 var FileSizeLabel = "MatricCertiSize";
                 var FileSizeValidation = ValidateSize(UploadControl);
                 if (FileSizeValidation) {
                     var CorectFileType = ValidateFile(UploadControl);
                     if (CorectFileType) {
                         var flag = ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel);
                         if (flag) {

                             var btnID = '<%=upoadMatricCerti.ClientID %>';
                             document.getElementById('<%=upoadMatricCerti.ClientID %>').click();
                             document.getElementById(Progressbardiv).style.display = "block";
                         }
                     }
                     else {

                         window.alert("Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", "));
                     }

                 }
             }
             function UpoadIntermediateCerti() {
                 var ProgressPanel = "showProgressIntermediateCerti";
                 var Progressbardiv = "progressIntermediateCerti";
                 var UploadControl = '<%=FileUploadIntermediateCerti.ClientID %>';
                 var FileNameLabel = "IntermediateCertiName";
                 var FileSizeLabel = "IntermediateCertiSize";
                 var FileSizeValidation = ValidateSize(UploadControl);
                 if (FileSizeValidation) {
                     var CorectFileType = ValidateFile(UploadControl);
                     if (CorectFileType) {
                         var flag = ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel);
                         if (flag) {

                             var btnID = '<%=uploadIntermediateCerti.ClientID %>';
                             document.getElementById('<%=uploadIntermediateCerti.ClientID %>').click();
                             document.getElementById(Progressbardiv).style.display = "block";
                         }
                     }
                     else {

                         window.alert("Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", "));
                     }
                 }
             }



             function uploadItemTest(object, index) {
                 var id = object.getAttribute("data-itemID");

                 var ProgressPanel = document.getElementsByName("showProgress" + id)[0].id;
                 var Progressbardiv = document.getElementsByName("progress" + id)[0].id;

                 var UploadControl = object.id;
                 var FileNameLabel = document.getElementsByName("Name" + id)[0].id;
                 var FileSizeLabel = document.getElementsByName("Size" + id)[0].id;
                 var FileSizeValidation = ValidateSize(UploadControl);
                 if (FileSizeValidation) {
                     var CorectFileType = ValidateFile(UploadControl);
                     if (CorectFileType) {
                         var flag = ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel);
                         if (flag) {

                             var val = "uploadTest" + id;
                             var btnID = $("[itemID='" + val + "']")[0].id;
                             document.getElementById(btnID).click();
                             document.getElementById(Progressbardiv).style.display = "block";
                         }
                     }
                     else {

                         window.alert("Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", "));
                     }
                 }

             }
             var size = 2;

             var id = 0;



             function ProgressBar(ProgressPanel, Progressbardiv, UploadControl, FileNameLabel, FileSizeLabel) {

                 if (document.getElementById(UploadControl).value != "") {
                     input = document.getElementById(UploadControl);
                     file = input.files[0];

                     document.getElementById(Progressbardiv).style.display = "block";

                     document.getElementById(FileNameLabel).innerHTML = file.name;
                     document.getElementById(FileSizeLabel).innerHTML = file.size / 1000 + "KB";
                     document.getElementById(ProgressPanel).style.display = "block";

                     id = setInterval("progress('" + Progressbardiv + "')", 20);

                     return true;

                 }

                 else {

                     alert("Select a file to upload");

                     return false;

                 }



             }

             function closing(vart) {
                 alert(vart)
             }

             function progress(Progressbardiv) {

                 size = size + 1;

                 if (size > 299) {

                     clearTimeout(id);

                 }

                 document.getElementById(Progressbardiv).style.width = size + "pt";



             }



        </script>
    </header>
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-left">
        <h3 class="NormalCharacterStyle12">Upload Documents</h3>
        <div class="panel panel-default panel_shadow">
            <a id="menu_togglePersonalDoc" href="#collapse2" data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">Personal Documents
                            <div class="pull-right">
                            <img src="images/caution_icon.png"  style="margin-right:5px" />
                            <img src="images/check_icon.png"   style="margin-right:10px"/>
                            <div class="icon-arrow-right pull-right">
                            <div class="check-"></div>
                            <i class="glyphicon glyphicon-chevron-down normal-color"></i></div>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="collapse2" class="panel-collapse panel-heading collapse">
                <div class="panel-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="upload_documents_names">&#9656;B Form/CNIC of Student&nbsp;<span class="upload_documents_info">(Scanned Copy)</span></div>
                            <asp:Repeater ID="studentCNICList" OnItemDataBound="studentCNICList_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <div class="upload_image_icon margin_top"></div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8">
                                            <div class="upload_documents_names margin_top3"><%# Eval("documentName") %></div>
                                            <div class="upload_documents_complete_text">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text"><%# Eval("documentSizeInKB") %> KB</span></div>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <asp:LinkButton runat="server" ID="deleteStudentCNIC" CommandArgument='<%# Eval("id")  %>' OnClick="delete"><div class=" cancel_icon margin_top3"></div></asp:LinkButton></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <br />
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="showProgressStudentCNIC" style="display: none">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <div class="upload_image_icon margin_top"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="upload_documents_progress_text margin_top3">
                                        <asp:Label runat="server" ClientIDMode="Static" ID="studentCNICName"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ClientIDMode="Static" ID="studentCNICSize" class="upload_documents_filesize_text"></asp:Label></div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-info" id="progressStudentCNIC" role="progressbar" style="width: 0%; height: 5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                <div class="fileUpload btn btn-link NormalCharacterStyle22 pull-right">Upload Document<input id="FileUploadStudentCNIC" type="file" runat="server" onclose="closing(this)" onchange="UplaodStudentCNic()" name="Upload Image" title="Upload Image" class="upload" /></div>
                                <asp:Button ID="uploadStudentCNIc" OnClick="uploadStudentCNIc_Click" ClientIDMode="Static" Style="display: none" runat="server" Text="Button" />
                            </div>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="uploadStudentCNIc"></asp:PostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>

                    <div class="panel_divider2"></div>
                    <br />

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="upload_documents_names">&#9656;Father CNIC&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                            <asp:Repeater ID="FatherCNICList" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <div class="upload_image_icon margin_top"></div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8">
                                            <div class="upload_documents_names margin_top3"><%# Eval("documentName") %></div>
                                            <div class="upload_documents_complete_text">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text"><%# Eval("documentSizeInKB") %> KB</span></div>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <asp:LinkButton runat="server" ID="deleteStudentCNIC" CommandArgument='<%# Eval("id")  %>' OnClick="delete"><div class=" cancel_icon margin_top3"></div></asp:LinkButton></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="showProgressFatherCNIC" style="display: none">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <div class="upload_image_icon margin_top"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="upload_documents_progress_text margin_top3">
                                        <asp:Label runat="server" ClientIDMode="Static" ID="fatherCNICName"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ClientIDMode="Static" ID="fatherCNICSize" class="upload_documents_filesize_text"></asp:Label></div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-info" id="progressFatherCNIC" role="progressbar" style="width: 0%; height: 5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                <div class="fileUpload btn btn-link NormalCharacterStyle22 pull-right">Upload Document<input id="FileUploadFatherCNIC" type="file" runat="server" onclose="closing(this)" onchange="UplaodFatherCNic()" name="Upload Image" title="Upload Image" class="upload" /></div>
                                <asp:Button ID="uploadFatherCNIC" OnClick="uploadFatherCNIC_Click" ClientIDMode="Static" Style="display: none" runat="server" Text="Button" />
                            </div>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="uploadFatherCNIC"></asp:PostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>


                    <div class="panel_divider2"></div>
                    <br />

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="upload_documents_names">&#9656;Father Income Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                            <asp:Repeater ID="FatherIncomeCertiList" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <div class="upload_image_icon margin_top 2"></div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8">
                                            <div class="upload_documents_names margin_top3 "><%# Eval("documentName") %></div>
                                            <div class="upload_documents_complete_text ">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text"><%# Eval("documentSizeInKB") %> KB</span></div>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <asp:LinkButton runat="server" ID="deleteFatherIncomeCerti" CommandArgument='<%# Eval("id")  %>' OnClick="delete"><div class=" cancel_icon margin_top3"></div></asp:LinkButton></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="showProgressFatherIncomeCerti" style="display: none">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <div class="upload_image_icon margin_top 2"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="upload_documents_progress_text margin_top3 ">
                                        <asp:Label runat="server" ClientIDMode="Static" ID="FatherIncomeCertiName"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ClientIDMode="Static" ID="FatherIncomeCertiSize" class="upload_documents_filesize_text"></asp:Label></div>
                                    <div class="progress ">
                                        <div class="progress-bar progress-bar-info" id="progressFatherIncomeCerti" role="progressbar" style="width: 0%; height: 5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                <div class="fileUpload btn btn-link NormalCharacterStyle22 pull-right">Upload Document<input id="FileUploadFatherIncomeCerti" type="file" runat="server" onclose="closing(this)" onchange="UplaodFatherIncomeCerti()" name="Upload Image" title="Upload Image" class="upload" /></div>
                                <asp:Button ID="uploadFatherIncomeCerti" OnClick="uploadFatherIncomeCerti_Click" ClientIDMode="Static" Style="display: none" runat="server" Text="Button" />
                            </div>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="uploadFatherIncomeCerti"></asp:PostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>

                    <br />
                    <div class="panel_divider2"></div>
                </div>
            </div>
        </div>


        <div class="panel panel-default panel_shadow">
            <a id="menu_toggleEducationalDoc" href="#Educational" data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">Educational Details
                            <div class="pull-right">
                            <img src="images/caution_icon.png"  style="margin-right:5px" />
                            <img src="images/check_icon.png"   style="margin-right:10px"/>
                            <div class="icon-arrow-right pull-right">
                            <div class="check-"></div>
                            <i class="glyphicon glyphicon-chevron-down normal-color"></i></div>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="Educational" class="panel-collapse panel-heading collapse">
                <div class="panel-body">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div class="upload_documents_names">&#9656;Matriculation/O-Level Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                            <asp:Repeater ID="MatricCertiList" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <div class="upload_image_icon margin_top"></div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8">
                                            <div class="upload_documents_names margin_top3"><%# Eval("documentName") %></div>
                                            <div class="upload_documents_complete_text ">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text"><%# Eval("documentSizeInKB") %> KB</span></div>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <asp:LinkButton runat="server" ID="deleteMatricCerti" CommandArgument='<%# Eval("id")  %>' OnClick="delete"><div class=" cancel_icon margin_top3"></div></asp:LinkButton></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="showProgressMatricCerti" style="display: none">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <div class="upload_image_icon margin_top "></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="upload_documents_progress_text margin_top3">
                                        <asp:Label runat="server" ClientIDMode="Static" ID="MatricCertiName"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ClientIDMode="Static" ID="MatricCertiSize" class="upload_documents_filesize_text"></asp:Label></div>
                                    <div class="progress ">
                                        <div class="progress-bar progress-bar-info" id="progressMatricCerti" role="progressbar" style="width: 0%; height: 5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                <div class="fileUpload btn btn-link NormalCharacterStyle22 pull-right">Upload Document<input id="FileUploadMatricCerti" type="file" runat="server" onclose="closing(this)" onchange="UpoadMatricCerti()" name="Upload Image" title="Upload Image" class="upload" /></div>
                                <asp:Button ID="upoadMatricCerti" OnClick="upoadMatricCerti_Click" ClientIDMode="Static" Style="display: none" runat="server" Text="Button" />
                            </div>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="upoadMatricCerti"></asp:PostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>

                    <div class="panel_divider2"></div>

                    <br />
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <div class="upload_documents_names">&#9656;Intermediate/A-Level Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                            <asp:Repeater ID="InterCertiList" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2">
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <div class="upload_image_icon margin_top"></div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8">
                                            <div class="upload_documents_names margin_top3"><%# Eval("documentName") %></div>
                                            <div class="upload_documents_complete_text">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text"><%# Eval("documentSizeInKB") %> KB</span></div>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                            <asp:LinkButton runat="server" ID="deleteMatricCerti" CommandArgument='<%# Eval("id")  %>' OnClick="delete"><div class=" cancel_icon margin_top3"></div></asp:LinkButton></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="showProgressIntermediateCerti" style="display: none">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <div class="upload_image_icon margin_top"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="upload_documents_progress_text margin_top3">
                                        <asp:Label runat="server" ClientIDMode="Static" ID="IntermediateCertiName"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ClientIDMode="Static" ID="IntermediateCertiSize" class="upload_documents_filesize_text"></asp:Label></div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-info" id="progressIntermediateCerti" role="progressbar" style="width: 0%; height: 5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc">
                                <div class="fileUpload btn btn-link NormalCharacterStyle22 pull-right">
                                    Upload Document
            <input id="FileUploadIntermediateCerti" type="file" runat="server" onclose="closing(this)" onchange="UpoadIntermediateCerti()" name="Upload Image" title="Upload Image" class="upload" />

                                </div>
                                <asp:Button ID="uploadIntermediateCerti" OnClick="uploadIntermediateCerti_Click" ClientIDMode="Static" Style="display: none" runat="server" Text="Button" />
                            </div>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="uploadIntermediateCerti"></asp:PostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="panel_divider2"></div>


                </div>
            </div>
        </div>



        <div class="panel panel-default panel_shadow">
            <a id="menu_toggleTest" href="#Test" data-toggle="collapse" data-parent="#accordion">
                <div class="panel-heading" style="height: 60px">
                    <h4 class="panel-title">
                        <div class="NormalCharacterStyle10 margin_top">Test Result Documents
                            <div class="pull-right">
                            <img src="images/caution_icon.png"  style="margin-right:5px" />
                            <img src="images/check_icon.png"   style="margin-right:10px"/>
                            <div class="icon-arrow-right pull-right">
                            <div class="check-"></div>
                            <i class="glyphicon glyphicon-chevron-down normal-color"></i></div>
                            </div>
                        </div>
                    </h4>

                </div>
            </a>
            <div id="Test" class="panel-collapse panel-heading collapse">
                <div class="panel-body">
                    <asp:Repeater runat="server" ID="TestResultDocList" OnItemDataBound="TestResultDocList_ItemDataBound" OnItemCommand="TestResultDocList_ItemCommand">
                        <ItemTemplate>
                            <div class="upload_documents_names">&#9656;<%# Eval("TestName")  %>&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc2" runat="server" id="documentDiv" visible="false">
                                <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                    <div class="upload_image_icon margin_top 2"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8">
                                    <div class="upload_documents_names margin_top3 ">
                                        <asp:Label ID="documentName" runat="server"></asp:Label>
                                    </div>
                                    <div class="upload_documents_complete_text ">Completed&nbsp;&nbsp;&nbsp;<span class="upload_documents_filesize_text"><asp:Label ID="documentSizeInKB" runat="server"></asp:Label>
                                        KB</span></div>
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                    <asp:LinkButton runat="server" ID="delete" OnClick="delete"><div class=" cancel_icon margin_top3"></div></asp:LinkButton></div>
                            </div>
                            <div class="col-md-12" id="showProgressTest" runat="server" name='<%# "showProgress"+Container.ItemIndex %>' style="display: none">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <div class="upload_image_icon margin_top 2"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="upload_documents_progress_text margin_top3 ">
                                        <asp:Label runat="server" ClientIDMode="Static" name='<%# "Name"+Container.ItemIndex %>' ID="NameTest"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ClientIDMode="Static" name='<%# "Size"+Container.ItemIndex %>' ID="sizeTest" class="upload_documents_filesize_text"></asp:Label></div>
                                    <div class="progress ">
                                        <div class="progress-bar progress-bar-info" runat="server" id="progressTest" name='<%# "progress"+Container.ItemIndex %>' role="progressbar" style="width: 0%; height: 5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mybspc">
                                <div class="fileUpload btn btn-link NormalCharacterStyle22 pull-right">Upload Document<asp:FileUpload ID="FileUploadTest" type="file" runat="server" onclose="closing(this)" onchange='uploadItemTest(this,1)' data-itemID='<%# Container.ItemIndex %>' title="Upload Image" class="upload" /></div>
                                <asp:Button ID="uploadTest" CommandArgument='<%# Eval("UniversityID") %>' CommandName="Add" itemID='<%# "uploadTest"+Container.ItemIndex %>' Style="display: none" runat="server" Text="Button" />
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>






        <br />
        <br />
        <asp:LinkButton runat="server" ID="SubmitToNext" OnClick="SubmitToNext_Click" type="button" class=" btn button_bg"><span class="NormalCharacterStyle">NEXT</span></asp:LinkButton>
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
