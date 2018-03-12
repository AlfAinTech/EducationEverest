<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ApplicationRecords.ascx.cs" Inherits="UserControls_ApplicationRecords" %>
<asp:Repeater ID="ApplicationsList" runat="server" OnItemDataBound="ApplicationsList_ItemDataBound">
           <ItemTemplate>
    <div class="panel panel-default ">
      <div class="panel-heading card_bg">
        <div class="row text-left">
          <div class="col-md-1">
            <asp:Image ID="logo" runat="server"  />
          </div>
             <div class="col-md-11">
        <h4 class="panel-title margin_top">
                  <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus").ToString()=="pending"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("CurrentStatus") %></b></small></div>
        </h4>
        <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
        <h4 class="blue_text margin_left">Application ID: <%# Eval("appID") %></h4>
        <div><span class="orange_text margin_left">Application Date: </span><span class="panel_text"><%# Eval("ApplicationDate") %></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text"><%# Eval("university.deadLine") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text"><%# Eval("CurrentStatus") %></span>
      </div>
        </div>
        </div><br/>
        <div class="divider"></div><br/>
        <a data-toggle="collapse" data-parent="#accordion" href='<%# "#details"+Container.ItemIndex %>' class="pull-right NormalCharacterStyle18 margin_top" style="margin-right: 30px;"><b>VIEW</b></a>
      </div>
      <div id='<%# "details"+Container.ItemIndex %>' class="panel-collapse collapse panel_shadow">
        <div class="panel-body">
            <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#pinfo"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Personal Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "pinfo"+Container.ItemIndex %>'  class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px">Personal Details</div>
              <div class="Profile_sidemenu_Name4">Full Name:</div>
              <div class="Profile_sidemenu_Name4">Father Name:</div>
              <div class="Profile_sidemenu_Name4">CNIC (Faizan Elahi):</div>
              <div class="Profile_sidemenu_Name4">CNIC (Father):</div>
              <div class="Profile_sidemenu_Name4">Date of Birth:</div>
              <div class="Profile_sidemenu_Name4">Nationality:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div>
                 <asp:Label ID="Name" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="FatherName" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="StudentCNIC" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="FatherCNIC" runat="server"></asp:Label></div>
              <div ><asp:Label ID="DOB" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="Nationality" runat="server"></asp:Label></div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
                <asp:Image runat="server" ID="user_Image" />
              
              
            </div>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">Contact Details</div>
              <div class="Profile_sidemenu_Name4">Current Address:</div>
              <div class="Profile_sidemenu_Name4">Parmanent Address:</div>
              <div class="Profile_sidemenu_Name4">Phone (Faizan Elahi):</div>
              <div class="Profile_sidemenu_Name4">Phone (Father):</div>
              <div class="Profile_sidemenu_Name4">Phone (Landline):</div>
              <div class="Profile_sidemenu_Name4">Zip Code/Postal Code:</div>
            </div>
            <div class="col-md-8">
              <div style="color: transparent;">Personal Details</div>
              <div ><asp:Label ID="CurrentAddress" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="ParmanentAddress" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="phoneStudent" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="phoneFather" runat="server" Text="Label"></asp:Label></div>
              <div ><asp:Label ID="landLine" runat="server" Text="Label"></asp:Label></div>
             
              <div ><asp:Label ID="PostalCode" runat="server" Text="Label"></asp:Label></div>
            </div>
          </div>
        </div>
      </div>
    </div>
             <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#mychoice"+Container.ItemIndex %>'  data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Preferences<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "mychoice"+Container.ItemIndex %>' class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top:-30px">
          <h3 class="NormalCharacterStyle12"><%# Eval("university.Name") %></h3>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
              <asp:Repeater ID="PreferencesList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 ">
                            <div class="Profile_sidemenu_Name4"><%# Container.ItemIndex+"." %> <%# Eval("Department.Department_Name") %></div>
                  
              
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-3 ">
                              <div class="Profile_sidemenu_Name4"> <%# Eval("Campus.Campus_Name") %></div>
                            </div>
            <div class="col-md-3 ">
              <div class="Profile_sidemenu_Name4">Catagory  <%# Eval("ProgrammCategory.Category.Category_Name") %></div>
              
            </div>
              </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
      </div>
    </div>
             <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#myeduinfo"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Educational Information<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "myeduinfo"+Container.ItemIndex %>' class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px">Matriculation/O-Level Details</div>
              <div class="Profile_sidemenu_Name4">Name of Board:</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Division:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div><asp:Label ID="MetricBoard" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricRollNo" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricYear" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricTotalMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricObtainedMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricPercentage" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="MetricGrades" runat="server" ></asp:Label></div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
             
              
            </div>
          </div>
          <br/><br/>
          <div class="col-md-12 text-left" style="margin-top: 10px;">
            <div class="col-md-4 ">
              <div class="NormalCharacterStyle101" style="margin-left: -30px">Intermediate/ A-Level Details</div>
               <div class="Profile_sidemenu_Name4">Name of Board:</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Division:</div>
            </div>
            <div class="col-md-8">
              <div style="color: transparent;">Personal Details</div>
            <div><asp:Label ID="InterBoard" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterRollNo" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterYear" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterTotalMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterObtainedMarks" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterPercentage" runat="server" ></asp:Label></div>
              <div ><asp:Label ID="InterGrades" runat="server" ></asp:Label></div>
            </div>
          </div>
        </div>
      </div>
    </div>
             <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#mytests"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Test Results<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "mytests"+Container.ItemIndex %>'class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
            <asp:Repeater ID="TestResultList" runat="server"><ItemTemplate>
          <div class="col-md-12 text-left" style="margin-top: 10px">
            <div class="col-md-4">
              <div class="NormalCharacterStyle12" style="margin-left: -30px"><%# Eval("Test_Name")  %> Details</div>
              <div class="Profile_sidemenu_Name4">Roll Number:</div>
              <div class="Profile_sidemenu_Name4">Year of Passing:</div>
              <div class="Profile_sidemenu_Name4">Total Marks:</div>
              <div class="Profile_sidemenu_Name4">Obtained Marks:</div>
              <div class="Profile_sidemenu_Name4">Percentage:</div>
              <div class="Profile_sidemenu_Name4">Aggregate:</div>
            </div>
            <div class="col-md-4">
              <div style="color: transparent;">Personal Details</div>
              <div ><%# Eval("Rollno")  %></div>
              <div ><%# Eval("Passing_Year")  %></div>
              <div ><%# Eval("Total_Marks")  %></div>
              <div ><%# Eval("Obtained_Marks")  %></div>
              <div ><%# Eval("Percentage")  %> %</div>
              <div ><%# Eval("Aggregate")  %> %</div>
            </div>
            <div class="col-md-4">
               <div class="Profile_sidemenu_Name3" style="color: transparent;">Personal Details</div>
             
              
            </div>
          </div>
          <br/><br/><br/>
           </ItemTemplate></asp:Repeater>
        </div>
      </div>
    </div>
            <div class="panel panel-default panel_shadow">
  <a id="menu_toggle3" href='<%# "#mydocs"+Container.ItemIndex %>' data-toggle="collapse" data-parent="#accordion" >
      <div class="panel-heading text-left" style="background: white;height: 60px;">       
        
        <h4 class="panel-title NormalCharacterStyle2 other_info_card_icon">
                 <div class="NormalCharacterStyle10 margin_top">My Documents<span class="icon-arrow-right pull-right"><i class="glyphicon glyphicon-chevron-down normal-color" ></i></span></div>
        </h4></div></a>
      <div id='<%# "mydocs"+Container.ItemIndex %>' class="panel-collapse collapse" >
        <div class="panel-body" style="background: white;">
          
        
          
          <div class="col-md-12 text-left" style="margin-top: -10px">
            <div class="NormalCharacterStyle101 margin_left2">&#9656;B Form/CNIC of Student&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
              <asp:Repeater ID="studentCNICList" runat="server"><ItemTemplate>
              <div class="col-md-12">
              <div class="col-md-1">
                    <div class="upload_image_icon margin_top margin_left2"></div>
                </div>
                <div class="col-md-3">
                    <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                    <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                    </div>
                  </div>
                    <br/>
                  </ItemTemplate></asp:Repeater>
            <br/><br/><br/><br/><br/><br/><br/><br/>
            <div class="profile_divider2" ></div><br/>
              
            <div class="NormalCharacterStyle101 margin_left2" >&#9656;B Form/CNIC of Father/Guardian&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
            <asp:Repeater ID="FatherCNICList" runat="server"><ItemTemplate>
              <div class="col-md-12">
              <div class="col-md-1">
                    <div class="upload_image_icon margin_top margin_left2"></div>
                </div>
                <div class="col-md-3">
                    <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                    <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                    </div>
                  </div>
                    <br/>
                  </ItemTemplate></asp:Repeater>
            <br/><br/><br/><br/><br/><br/><br/><br/>
                 <div class="profile_divider2" ></div><br/>
              <div class="NormalCharacterStyle101 margin_left2" >&#9656;Father/Guardian Income Certificate&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
             <asp:Repeater ID="FatherIncomeCertiList" runat="server"><ItemTemplate>
                  <div class="col-md-12">
                  <div class="col-md-1">
                        <div class="upload_image_icon margin_top margin_left2"></div>
                    </div>
                    <div class="col-md-3">
                        <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                        <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                        </div>
                      </div>
                        <br/>
                      </ItemTemplate></asp:Repeater>
            <br/><br/><br/><br/><br/><br/><br/><br/>
             <div class="profile_divider2" ></div><br/>
            <div class="NormalCharacterStyle101 margin_left2" >&#9656;Matriculation/ O-Leve Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
             <asp:Repeater ID="MatricCertiList" runat="server"><ItemTemplate>
                  <div class="col-md-12">
                  <div class="col-md-1">
                        <div class="upload_image_icon margin_top margin_left2"></div>
                    </div>
                    <div class="col-md-3">
                        <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                        <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                        </div>
                      </div>
                        <br/>
                      </ItemTemplate></asp:Repeater>
              <br/><br/><br/><br/><br/>
              <div class="profile_divider2" ></div><br/>
              <div class="NormalCharacterStyle101 margin_left2" >&#9656;Intermediate/ A-Level Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
               <asp:Repeater ID="InterCertiList" runat="server"><ItemTemplate>
                  <div class="col-md-12">
                  <div class="col-md-1">
                        <div class="upload_image_icon margin_top margin_left2"></div>
                    </div>
                    <div class="col-md-3">
                        <div class="upload_documents_names margin_top3 margin_left3"><%# Eval("documentName") %></div>
                        <div  class="upload_documents_filesize_text margin_left3"><%# Eval("documentSizeInKB") %> KB</div>
                        </div>
                      </div>
                        <br/>
                      </ItemTemplate></asp:Repeater>
              <br/><br/><br/><br/><br/>
              <div class="profile_divider2" ></div><br/>
              <asp:Repeater ID="TestResultDocList" OnItemDataBound="TestResultDocList_ItemDataBound" runat="server"><ItemTemplate>
                  <div class="NormalCharacterStyle101 margin_left2" >&#9656;<%# Eval("TestName")  %> Certificate/Result Cards&nbsp;<span class="upload_documents_info">(Scaned Copy High Resolution)</span></div>
               <div class="col-md-12">
          <div class="col-md-1">
                <div class="upload_image_icon margin_top margin_left2"></div>
            </div>
            <div class="col-md-3">
                <div class="upload_documents_names margin_top3 margin_left3"><asp:Label ID="documentName" runat="server" ></asp:Label></div>
                <div  class="upload_documents_filesize_text margin_left3"><asp:Label ID="documentSizeInKB" runat="server" ></asp:Label> KB</div>
                </div>
              </div>
                  <br/><br/><br/><br/><br/>
             <div class="profile_divider2" ></div><br/>
         </ItemTemplate></asp:Repeater>
            </div></div></div>
            
    </div>
                </div></div></div>
</ItemTemplate>
           
            <FooterTemplate>
                 <div class="col-md-12" runat="server" visible="false" id="EmptyDiv">
                  <img src="images/Dashboard.png" style="margin-top: 120px;">

                     <br/><br/>
                    <div class="NormalCharacterStyle111">You have no admission application yet.</div>
                </div>
                 <br/>
            </FooterTemplate>
        </asp:Repeater>