<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ApplicationRecords.ascx.cs" Inherits="UserControls_ApplicationRecords" %>
<script type="text/javascript">
    
    function edit_repeaterclick(id) {
            
            document.getElementById("<%= hf1.ClientID %>").value = id;
            document.getElementById("<%= btn_editApplication.ClientID %>").click();
        }
    $(document).ready(function () {

        $('.viewbutton').on('click', function () {
            var panel_id=($(this).attr('id').replace("href_","#details"));
            $(panel_id).slideToggle("slow");
            if ($(this).text() == "VIEW") {
                $(this).text('CLOSE');
                $(this).css("font-weight", "Bold");
            }
            else {
                $(this).text('VIEW');
                $(this).css("font-weight", "Bold");
            }
            
        });

        
        $(".panel-collapse").on('show.bs.modal', function (event) {
            alert('hi');
        });

    });
</script>
<asp:Repeater ID="ApplicationsList" runat="server" OnItemDataBound="ApplicationsList_ItemDataBound">
    <ItemTemplate>
        <div class="panel panel-default ">
            <div class="panel-heading card_bg">
                <div class="row text-left" style="padding-bottom: 2%">
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                        <asp:Image ID="logo" runat="server" src="../images/university_icon.png"/>
                        
                    </div>
                    <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
                        <h4 class="panel-title margin_top">
                            <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus_").ToString()=="pending" || Eval("CurrentStatus_").ToString()=="rejected"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("CurrentStatus") %></b></small></div>
                        </h4>
                        <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
                        <h4 class="blue_text col-lg-12 col-md-12 col-sm-12 col-xs-12">Application ID: <%# Eval("appID") %></h4>
                        <div>
                            <span class="orange_text col-lg-2 col-md-2 col-sm-2 col-xs-2">Application Date: </span><span class="panel_text col-lg-2 col-md-2 col-sm-2 col-xs-2"><%# Eval("ApplicationDate") %></span>
                            <span class="red_text col-lg-2 col-md-2 col-sm-2 col-xs-2">Last Date: </span><span class="panel_text col-lg-2 col-md-2 col-sm-2 col-xs-2"><%# Eval("university.deadLine") %></span><span class="green_text col-lg-2 col-md-2 col-sm-2 col-xs-2">Status: </span><span class="panel_text col-lg-2 col-md-2 col-sm-2 col-xs-2"><%# Eval("CurrentStatus_") %></span>
                        </div>
                    </div>
                </div> 
                <div class="row" style="border-top: 1px solid #d0d0d0;">
                    <a id='<%# "href_"+Container.ItemIndex %>' data-toggle="collapse"  data-parent="#accordion" class="pull-right viewbutton margin_top" style="cursor: pointer;margin-right: 30px;"><b>VIEW</b></a>
                    <a id='<%# "edit"+Container.ItemIndex %>' class="pull-right editbutton margin_top" onclick="edit_repeaterclick('<%# Eval("id") %>')" style="cursor: pointer;margin-right: 30px;"><b>EDIT</b></a>
                </div>
            </div>
            <div id='<%# "details"+Container.ItemIndex %>' class="panel-collapse collapse panel_shadow">
                <div class="panel-body">
                    <div class="panel panel-default panel_shadow">
                        <a id="menu_toggle3" href='<%# "#pinfo"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                            <div class="panel-heading text-left" style="background: white; height: 60px;">

                                <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                                    <div class="NormalCharacterStyle10 margin_top">My Personal Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color"></i></span></div>
                                </h4>
                            </div>
                        </a>
                        <div id='<%# "pinfo"+Container.ItemIndex %>' class="panel-collapse collapse">
                            <div class="panel-body" style="background: white;">

                                <div class="col-md-12 text-left">
                                    <h3 class="NormalCharacterStyle12">Personal Details</h3>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                    <div class="col-lg-5 col-md-5 col-sm-4 col-xs-4">
                                        <div class="Profile_sidemenu_Name4">Full Name:</div>
                                        <div class="Profile_sidemenu_Name4">Father Name:</div>
                                        <div class="Profile_sidemenu_Name4">CNIC (Faizan Elahi):</div>
                                        <div class="Profile_sidemenu_Name4">CNIC (Father):</div>
                                        <div class="Profile_sidemenu_Name4">Date of Birth:</div>
                                        <div class="Profile_sidemenu_Name4">Nationality:</div>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-4 col-xs-4">
                                        <div>
                                            <asp:Label ID="Name" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <asp:Label ID="FatherName" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="StudentCNIC" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="FatherCNIC" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="DOB" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="Nationality" runat="server"></asp:Label></div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-4">
                                        <div class="Profile_sidemenu_Name3 text-center" style="color: transparent;">Personal Details</div>
                                        <asp:Image runat="server" ID="user_Image" />


                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="col-md-12 text-left">
                                    <h3 class="NormalCharacterStyle12">Contact Details</h3>
                                </div>
                                <div class="col-md-12 text-left" style="margin-top: 10px;">

                                    <div class="col-lg-5 col-md-5 col-sm-4 col-xs-4">
                                        <div class="Profile_sidemenu_Name4">Current Address:</div>
                                        <div class="Profile_sidemenu_Name4">Parmanent Address:</div>
                                        <div class="Profile_sidemenu_Name4">Phone (Personal):</div>
                                        <div class="Profile_sidemenu_Name4">Phone (Father):</div>
                                        <div class="Profile_sidemenu_Name4">Phone (Landline):</div>
                                        <div class="Profile_sidemenu_Name4">Zip Code/Postal Code:</div>
                                    </div>
                                    <div class="col-lg-7 col-md-7 col-sm-4 col-xs-4">
                                        <div>
                                            <asp:Label ID="CurrentAddress" runat="server" Text="Label"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="ParmanentAddress" runat="server" Text="Label"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="phoneStudent" runat="server" Text="Label"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="phoneFather" runat="server" Text="Label"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="landLine" runat="server" Text="Label"></asp:Label></div>

                                        <div>
                                            <asp:Label ID="PostalCode" runat="server" Text="Label"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default panel_shadow">
                        <a id="menu_toggle3" href='<%# "#mychoice"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                            <div class="panel-heading text-left" style="background: white; height: 60px;">

                                <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                                    <div class="NormalCharacterStyle10 margin_top">My Preferences<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color"></i></span></div>
                                </h4>
                            </div>
                        </a>
                        <div id='<%# "mychoice"+Container.ItemIndex %>' class="panel-collapse collapse">
                            <div class="panel-body" style="background: white;">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                    <h3 class="NormalCharacterStyle12"><%# Eval("university.Name") %></h3>
                                </div>
                                <br />
                                <br />
                                <div class="col-md-12 text-left">
                                    <asp:Repeater ID="PreferencesList" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                                                <div class="Profile_sidemenu_Name4"><%# (int.Parse(Container.ItemIndex.ToString())+1).ToString()+"." %> <%# Eval("Department.Department_Name") %></div>


                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                                                <div class="Profile_sidemenu_Name4"><%# Eval("Campus.Campus_Name") %></div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <div class="Profile_sidemenu_Name4">Catagory  <%# Eval("ProgrammCategory.Category.Category_Name") %></div>

                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default panel_shadow">
                        <a id="menu_toggle3" href='<%# "#myeduinfo"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                            <div class="panel-heading text-left" style="background: white; height: 60px;">

                                <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                                    <div class="NormalCharacterStyle10 margin_top">My Educational Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color"></i></span></div>
                                </h4>
                            </div>
                        </a>
                        <div id='<%# "myeduinfo"+Container.ItemIndex %>' class="panel-collapse collapse">
                            <div class="panel-body" style="background: white;">


                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  text-left">
                                    <h3 class="NormalCharacterStyle12">Matriculation/O-Level Details</h3>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  text-left">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                                        <div class="Profile_sidemenu_Name4">Name of Board:</div>
                                        <div class="Profile_sidemenu_Name4">Roll Number:</div>
                                        <div class="Profile_sidemenu_Name4">Year of Passing:</div>
                                        <div class="Profile_sidemenu_Name4">Total Marks:</div>
                                        <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
                                        <div class="Profile_sidemenu_Name4">Percentage:</div>
                                        <div class="Profile_sidemenu_Name4">Division:</div>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 ">
                                        <div>
                                            <asp:Label ID="MetricBoard" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="MetricRollNo" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="MetricYear" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="MetricTotalMarks" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="MetricObtainedMarks" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="MetricPercentage" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="MetricGrades" runat="server"></asp:Label></div>
                                    </div>

                                </div>
                                <br />
                                <br />
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                    <h3 class="NormalCharacterStyle12">Intermediate/ A-Level Details</h3>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">

                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <div class="Profile_sidemenu_Name4">Name of Board:</div>
                                        <div class="Profile_sidemenu_Name4">Roll Number:</div>
                                        <div class="Profile_sidemenu_Name4">Year of Passing:</div>
                                        <div class="Profile_sidemenu_Name4">Total Marks:</div>
                                        <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
                                        <div class="Profile_sidemenu_Name4">Percentage:</div>
                                        <div class="Profile_sidemenu_Name4">Division:</div>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 ">
                                        <div>
                                            <asp:Label ID="InterBoard" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="InterRollNo" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="InterYear" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="InterTotalMarks" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="InterObtainedMarks" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="InterPercentage" runat="server"></asp:Label></div>
                                        <div>
                                            <asp:Label ID="InterGrades" runat="server"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default panel_shadow">
                        <a id="menu_toggle3" href='<%# "#mytests"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                            <div class="panel-heading text-left" style="background: white; height: 60px;">

                                <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                                    <div class="NormalCharacterStyle10 margin_top">My Test Results<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color"></i></span></div>
                                </h4>
                            </div>
                        </a>
                        <div id='<%# "mytests"+Container.ItemIndex %>' class="panel-collapse collapse">
                            <div class="panel-body" style="background: white;">
                                <asp:Repeater ID="TestResultList" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                            <h3 class="NormalCharacterStyle12"><%# Eval("Test_Name")  %> Details</h3>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                <div class="Profile_sidemenu_Name4">Roll Number:</div>
                                                <div class="Profile_sidemenu_Name4">Year of Passing:</div>
                                                <div class="Profile_sidemenu_Name4">Total Marks:</div>
                                                <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
                                                <div class="Profile_sidemenu_Name4">Percentage:</div>
                                                <%--<div class="Profile_sidemenu_Name4">Aggregate:</div>--%>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
                                                <div><%# Eval("Rollno")  %></div>
                                                <div><%# Eval("Passing_Year")  %></div>
                                                <div><%# Eval("Total_Marks")  %></div>
                                                <div><%# Eval("Obtained_Marks")  %></div>
                                                <div><%# Eval("Percentage")  %> %</div>
                                                <%--<div ><%# Eval("Aggregate")  %> %</div>--%>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default panel_shadow">
                        <a id="menu_toggle3" href='<%# "#mydocs"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion">
                            <div class="panel-heading text-left" style="background: white; height: 60px;">

                                <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                                    <div class="NormalCharacterStyle10 margin_top">My Documents<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color"></i></span></div>
                                </h4>
                            </div>
                        </a>
                        <div id='<%# "mydocs"+Container.ItemIndex %>' class="panel-collapse collapse">
                            <div class="panel-body" style="background: white;">



                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="margin-top: -10px">
                                    <div class="NormalCharacterStyle101 col-lg-12 col-md-12 col-sm-12 col-xs-12">&#9656;B Form/CNIC of Student&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                                    <asp:Repeater ID="studentCNICList" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                                                    <div class="upload_image_icon margin_top "></div>
                                                </div>
                                                <div class="col-lg-11 col-md-11 col-sm-9 col-xs-9">
                                                    <div class="upload_documents_names margin_top3 "><%# Eval("documentName") %></div>
                                                    <div class="upload_documents_filesize_text "><%# Eval("documentSizeInKB") %> KB</div>
                                                </div>
                                            </div>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="profile_divider2"></div>
                                    <br />

                                    <div class="NormalCharacterStyle101 ">&#9656;B Form/CNIC of Father/Guardian&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                                    <asp:Repeater ID="FatherCNICList" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                                                    <div class="upload_image_icon margin_top "></div>
                                                </div>
                                                <div class="col-lg-11 col-md-11 col-sm-9 col-xs-9">
                                                    <div class="upload_documents_names margin_top3 "><%# Eval("documentName") %></div>
                                                    <div class="upload_documents_filesize_text "><%# Eval("documentSizeInKB") %> KB</div>
                                                </div>
                                            </div>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="profile_divider2"></div>
                                    <br />
                                    <div class="NormalCharacterStyle101 ">&#9656;Father/Guardian Income Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                                    <asp:Repeater ID="FatherIncomeCertiList" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                                                    <div class="upload_image_icon margin_top "></div>
                                                </div>
                                                <div class="col-lg-11 col-md-11 col-sm-9 col-xs-9">
                                                    <div class="upload_documents_names margin_top3 "><%# Eval("documentName") %></div>
                                                    <div class="upload_documents_filesize_text "><%# Eval("documentSizeInKB") %> KB</div>
                                                </div>
                                            </div>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="profile_divider2"></div>
                                    <br />
                                    <div class="NormalCharacterStyle101 ">&#9656;Matriculation/ O-Leve Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                                    <asp:Repeater ID="MatricCertiList" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                                                    <div class="upload_image_icon margin_top "></div>
                                                </div>
                                                <div class="col-lg-11 col-md-11 col-sm-9 col-xs-9">
                                                    <div class="upload_documents_names margin_top3 "><%# Eval("documentName") %></div>
                                                    <div class="upload_documents_filesize_text "><%# Eval("documentSizeInKB") %> KB</div>
                                                </div>
                                            </div>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="profile_divider2"></div>
                                    <br />
                                    <div class="NormalCharacterStyle101">&#9656;Intermediate/ A-Level Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                                    <asp:Repeater ID="InterCertiList" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                                                    <div class="upload_image_icon margin_top "></div>
                                                </div>
                                                <div class="col-lg-11 col-md-11 col-sm-9 col-xs-9">
                                                    <div class="upload_documents_names margin_top3 "><%# Eval("documentName") %></div>
                                                    <div class="upload_documents_filesize_text "><%# Eval("documentSizeInKB") %> KB</div>
                                                </div>
                                            </div>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="profile_divider2"></div>
                                    <br />
                                    <asp:Repeater ID="TestResultDocList" OnItemDataBound="TestResultDocList_ItemDataBound" runat="server">
                                        <ItemTemplate>
                                            <div class="NormalCharacterStyle101 ">&#9656;<%# Eval("TestName")  %> Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
                                            <div  class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                                                    <div class="upload_image_icon margin_top "></div>
                                                </div>
                                                <div class="col-lg-11 col-md-11 col-sm-9 col-xs-9">
                                                    <div class="upload_documents_names margin_top3 ">
                                                        <asp:Label ID="documentName" runat="server"></asp:Label></div>
                                                    <div class="upload_documents_filesize_text ">
                                                        <asp:Label ID="documentSizeInKB" runat="server"></asp:Label>
                                                        KB</div>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <div class="profile_divider2"></div>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>

    <FooterTemplate>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" visible="false" id="EmptyDiv">
            <img src="images/Dashboard.png" style="margin-top: 120px;">

            <br />
            <br />
            <div class="NormalCharacterStyle111">You have no admission application yet.</div>
        </div>
        <br />
    </FooterTemplate>
</asp:Repeater>
<asp:HiddenField runat="server" Value="" ID="hf1"/>
        <asp:Button runat="server" ID="btn_editApplication" OnClick="btn_editApplication_Click" style="display:none;" />