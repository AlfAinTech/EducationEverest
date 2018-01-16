<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Universities.aspx.cs" Inherits="Universities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="Content/vendor/jquery/jquery.min.js"></script>
    
    <div class="container" style="margin-top:100px;">
        
        
        <div class="row" style="background-color:rgba(0,0,0,0.03);border-radius:4px;">
        <div class="col-md-12">
    <ul class="nav nav-pills nav-fill">
    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#home">Portfolio</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#menu1">Criteria</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#menu2">Admission Documents</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#menu3">Fee Structure</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#menu4">Categories</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="pill" href="#menu5">Departments & Programs</a></li>
  </ul>
            
            </div>
            <div class="col-md-12" style="min-height:400px;">
                
  <div class="tab-content">
    <div id="home" class="tab-pane fade">
   
        <div class="row">
            <div class="col-md-1"></div>
             <div class="col-md-4">
                 <h3>About University</h3>
        University Name: <asp:TextBox ID="TextBox1"  placeholder="Enter University Name" CssClass="form-control" runat="server"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" display="Dynamic" validationgroup="UniversityGroup" ErrorMessage="Cannot Be Blank" ForeColor="Red"></asp:RequiredFieldValidator><br />
                 <h4>Campuses</h4>
                 <asp:PlaceHolder ID="PlaceHolder4" runat="server">
                     <asp:TextBox ID="TextBox9"  CssClass="form-control" style="margin-top:5px;" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox10" CssClass="form-control" style="margin-top:5px;" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox31" CssClass="form-control" style="margin-top:5px;" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox32" CssClass="form-control" style="margin-top:5px;" runat="server"></asp:TextBox>
                 </asp:PlaceHolder>
    </div>
            <div class="col-md-1"></div>
            <div class="col-md-5">
                <h3>Portfolio</h3>
                <div class="row">
                    
                <div style="margin-bottom:4px;" class="col-md-12"> Contact 1: <asp:TextBox ID="TextBox2" placeholder="Enter Contact Number" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div style="margin-bottom:4px;" class="col-md-12"> Contact 2: <asp:TextBox ID="TextBox3" placeholder="Enter Contact Number" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div style="margin-bottom:4px;" class="col-md-12"> Contact 3: <asp:TextBox ID="TextBox4" placeholder="Enter Contact Number" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div style="margin-bottom:4px;" class="col-md-12"> Contact 4: <asp:TextBox ID="TextBox5" placeholder="Enter Contact Number" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div style="margin-bottom:4px;" class="col-md-12"> Email:       <asp:TextBox ID="TextBox6" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div style="margin-bottom:4px;" class="col-md-12"> Address:    <asp:TextBox ID="TextBox7" placeholder="Enter Address" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div  class="col-md-12"> Category:   <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Enter Address" runat="server"></asp:TextBox></div>
            
                </div>
                <br />
                <asp:Button ID="Button_Uni" runat="server"  causesvalidation="true"
      validationgroup="UniversityGroup" CssClass="btn btn-primary" OnClick="ButtonUni_Click" Text="Save" />
                </div>
            
            </div>
                        
                           
        </div>

    <div id="menu1" class="tab-pane fade">
      <h4>Type or Paste Criteria Here</h4>
        <textarea id="TextArea1" class="form-control" placeholder="Type or Paste Criteria ..." style="min-width:1110px;max-width:1110px;min-height:410px;" runat="server"></textarea><br />
        <asp:Button ID="Button3" OnClick="Criteria_Click" style="float:right;" runat="server" Class="btn btn-primary" Text="Save" />
    </div>
    <div id="menu2" class="tab-pane fade">
      <h4>Type or Paste Admission Document Details Here </h4>
        <textarea id="TextArea2" class="form-control" placeholder="Type or Paste Admission Details ..." style="min-width:1110px;max-width:1110px;min-height:410px;" runat="server"></textarea><br />
        <asp:Button ID="Button5" OnClick="Document_Click" style="float:right;" runat="server" Class="btn btn-primary" Text="Save" />
    </div>
    <div id="menu3" class="tab-pane fade">
      <h4>Type or Paste Fee Structure Details Here </h4>
        <textarea id="TextArea3" class="form-control" placeholder="Type or Paste Fee Structure Details ..." style="min-width:1110px;max-width:1110px;min-height:410px;" runat="server"></textarea><br />
        <asp:Button ID="Button6" OnClick="Fee_Click" runat="server" style="float:right;" Class="btn btn-primary" Text="Save" />
    </div>


      <div id="menu4" class="tab-pane fade">
          <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-3">
          <h4>Categories</h4>
                  </div>
              </div>
      <asp:PlaceHolder ID="PlaceHolder1" runat="server">
          <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-5"><br />
                  <div class="row">
          <div class="col-md-12"><asp:TextBox ID="TextBox11" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox12" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox13" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox14" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox15" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          </div>
                  </div>
              <div class ="col-md-1"></div>
              <div class="col-md-5"><br />
              <div class="row">
          <div class="col-md-12"><asp:TextBox ID="TextBox16" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox17" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox18" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox19" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox20" style="margin-bottom:5px;" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox></div>  
    </div>
                  </div>
              </div>
          </asp:PlaceHolder>
          <asp:Button ID="Button1" style="float:right;" class="btn btn-primary" Text="Save" OnClick="Button1_Click" runat="server" />
          </div>


      <div id="menu5" class="tab-pane fade">
          
          <div class="row"><div class="col-md-1"></div>
              <div class="col-md-5">
                  <h4>Departments</h4>
           <asp:PlaceHolder ID="PlaceHolder2" runat="server">
           <div class="row">
          <div class="col-md-12"><asp:TextBox ID="TextBox21" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox22" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox23" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox24" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox25" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          </div>
              <div class="row">
          <div class="col-md-12"><asp:TextBox ID="TextBox26" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox27" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox28" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox29" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="col-md-12"><asp:TextBox ID="TextBox30" style="margin-bottom:5px;" placeholder="Enter Department Name" CssClass="form-control" runat="server"></asp:TextBox></div>  
          </div>
        </asp:PlaceHolder>
                  <asp:Button ID="Button2" style="float:left;" class="btn btn-primary"  Text="Save" OnClick="Button2_Click" runat="server" />
              </div>
              
          
                  
              <div class="col-md-6">
                  

                  <h4>Programms</h4>
                <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder><br />
                  <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" OnClick="Button4_Click" Text="Save" />







              </div>
              </div>
         </div>

  </div>
        </div>
        </div>
    </div>
</asp:Content>

