<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UniversityPage.aspx.cs"  MasterPageFile="Admin.master" Inherits="Admin_UniversityPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:100px; margin-left:200px;">
        
    <div class="container" style="margin-bottom:50px;" >
        <div class="row container" style="margin-bottom:20px;">
        <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" > Add new University"></asp:Label>
            </div>
        <asp:Label runat="server" Font-Bold="true">Add University</asp:Label>
    </div>

    <div class="container">
        <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-4">
                University Name : 
                </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_uniName" CssClass="form-control" placeholder="Enter University Name" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="tb_uniName" ValidationGroup="UniversityFields" Display="Dynamic"
                        CssClass="text-danger" ErrorMessage="* Field is required." />
                    <%--<asp:RegularExpressionValidator ID="re_tb_uniName" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[a-zA-Z]{1,100}$" ControlToValidate="tb_uniName" ForeColor="red"
                        ErrorMessage="* Name should consist of alphabets"></asp:RegularExpressionValidator>--%>
            </div>
            </div>

            <div class="row">
            <div class="col-md-4">
                Hec Ranking : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_HecRanking" CssClass="form-control" placeholder="Enter Hec Ranking" TextMode="Number" MaxLength="3" min="1" max="999"  ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ValidationGroup="UniversityFields" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,5}$" ControlToValidate="tb_HecRanking" ForeColor="red"
                        ErrorMessage="* Ranking should consist of maximum 5 digits"></asp:RegularExpressionValidator>
            </div>
            
        </div>
            <div class="row">
                <div class="col-md-4">
                Test Name : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_TestName" CssClass="form-control" placeholder="Enter Test Name i.e ECAT"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Testname" runat="server" Display="Dynamic" ValidationGroup="UniversityFields" CssClass="text-danger"
                    ControlToValidate="tb_TestName" ForeColor="Red" ErrorMessage="* Test Name is required field" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Display="Dynamic" ValidationGroup="UniversityFields" CssClass="text-danger"
                        ValidationExpression="^[A-Z a-z]{1,100}$" ControlToValidate="tb_TestName" ForeColor="red"
                        ErrorMessage="* Test Name should consist of alphabets"></asp:RegularExpressionValidator>
            </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                University Type : 
            </div>
            <div class="col-md-8">
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddl_UniversityType">
                    <asp:ListItem>Government</asp:ListItem>
                    <asp:ListItem>Semi-Government</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                </asp:DropDownList>
            </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                Admission Open ? 
            </div>
            <div class="col-md-2">
                <asp:CheckBox Text="Yes" runat="server"  ID="cb_AdmissionOpen"  Enabled="true" OnCheckedChanged="cb_AdmissionOpen_CheckedChanged" AutoPostBack="true" />
                    </div>
            <div class="col-md-6">

            </div>
            </div>

            <div class="row" visible="false" runat="server" id="divDeadline">
            
            <div class="col-md-4">
                Application Deadline : 
            </div>
             <div class="col-md-8">
                <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="tb_Deadline" ></asp:TextBox>
                     </div>
        </div>

            <div class="row" style="margin-top:20px;">
            <div class="col-md-4">
                Application Fee same for all Departments ? 
            </div>
                <div class="col-md-2">
                <asp:CheckBox Text="Same" runat="server"  ID="cb_sameFee" Checked="true" Enabled="true" OnCheckedChanged="cb_sameFee_CheckedChanged" AutoPostBack="true" />
                    </div>
                <div class="col-md-6">
                <asp:CheckBox Text="Differnt" runat="server"  ID="cb_DifferentFee" Enabled="true" AutoPostBack="true" OnCheckedChanged="cb_DifferentFee_CheckedChanged"  />
                    </div>
            
        </div>

        <div class="row" style="margin-top:20px;" runat="server" id="div_applicationFee">
            <div class="col-md-4">
                Application Fee :
            </div>
            <div class="col-md-8">
                <div >
                <asp:TextBox ID="tb_applicationFee" runat="server" placeholder="Enter Application Fee" CssClass="form-control" TextMode="Number" ></asp:TextBox>
            </div>
            </div>
        </div>
            
        </div>
        <div class="col-md-6">
            <div class="row">
            <div class="col-md-4" >
                Attach Logo : 
            </div>
            <div class="col-md-8">
                <asp:FileUpload ID="fu_logo" runat="server" />
                <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator6"
                        runat="server" Display="Dynamic" CssClass="text-danger"
                        ErrorMessage="Only Gif,Jpg,Png,Pdf and word files are allowed!"
                        ValidationGroup="UniversityFields"
                        ValidationExpression="^.+(.jpg|.JPG|.png|.PNG|.JPEG|.jpeg|.gif|.GIF|.pdf|.PDF|.docx|.DOCX|.DOC|.doc)$"
                        ControlToValidate="fu_logo"> </asp:RegularExpressionValidator>
            </div>
        </div>

            <div class="row">
            
            <div class="col-md-4">
                Contact 1 : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_uniContact1" CssClass="form-control" placeholder="Enter University Contact" ></asp:TextBox>
                
            </div>
            
        </div>

            
        <div class="row">
            
            <div class="col-md-4">
                Contact 2 : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_uniContact2" CssClass="form-control" placeholder="Enter University Contact"  ></asp:TextBox>
                
            </div>
            
        </div>

            <div class="row">
            
            <div class="col-md-4">
                Contact 3 : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_uniContact3" CssClass="form-control" placeholder="Enter University Contact"  ></asp:TextBox>

            </div>
            
        </div>

            <div class="row">
            
            <div class="col-md-4">
                Email : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_uniEmail" CssClass="form-control" placeholder="Enter University Email" ></asp:TextBox>
            </div>
        </div>

            <div class="row">
            <div class="col-md-4">
                Address : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_uniAddress" CssClass="form-control" placeholder="Enter University Address" ></asp:TextBox>
            </div>
        </div>

             <div class="row">
            
            <div class="col-md-4">
                About : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_About" Width="1000" CssClass="form-control" placeholder="Enter About Univeristy" TextMode="MultiLine"  ></asp:TextBox>
            </div>
        </div> 

            <div class="row">
            
            <div class="col-md-4">
                Criteria : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_Criteria" Width="1000" CssClass="form-control" placeholder="Enter Criteria For This Univeristy" TextMode="MultiLine"  ></asp:TextBox>
            </div>
        </div>
            <div class="row">
                <div class="col-md-4">
                Fee Structure : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_FeeStructure" Width="1000" CssClass="form-control" placeholder="Enter Fee Structure For This Univeristy" TextMode="MultiLine"  ></asp:TextBox>
            </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                Admission Docs : 
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="tb_AdmissionDocs" Width="1000" CssClass="form-control" placeholder="Enter Admission documents needed For This Univeristy" TextMode="MultiLine"  ></asp:TextBox>
            </div>
            </div>

        </div>
            </div>
    </div>

    <div class="container">
      
        <div class="row" style="margin-top:50px;">
            <div class="col-md-12" >
                <asp:Button runat="server" ID="btn_addCampuses" CssClass="btn btn-primary form-control" ValidationGroup="UniversityFields" OnClick="btn_addCampuses_Click" Text="Next -> Add Campuses" />
            </div>
            
        </div>
    </div>
        
        </div>
</asp:Content>