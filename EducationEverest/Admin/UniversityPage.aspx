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
            <div class="col-md-2">
                University Name : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_uniName" CssClass="form-control" placeholder="Enter University Name" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="tb_uniName" Display="Dynamic"
                        CssClass="text-danger" ErrorMessage="* Field is required." />
                    <%--<asp:RegularExpressionValidator ID="re_tb_uniName" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[a-zA-Z]{1,100}$" ControlToValidate="tb_uniName" ForeColor="red"
                        ErrorMessage="* Name should consist of alphabets"></asp:RegularExpressionValidator>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Contact 1 : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_uniContact1" CssClass="form-control" placeholder="Enter University Contact" TextMode="Number" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,20}$" ControlToValidate="tb_uniContact1" ForeColor="red"
                        ErrorMessage="* Contact should consist of digits"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Contact 2 : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_uniContact2" CssClass="form-control" placeholder="Enter University Contact" TextMode="Number" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,20}$" ControlToValidate="tb_uniContact2" ForeColor="red"
                        ErrorMessage="* Contact should consist of digits"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Contact 3 : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_uniContact3" CssClass="form-control" placeholder="Enter University Contact" TextMode="Number" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,20}$" ControlToValidate="tb_uniContact3" ForeColor="red"
                        ErrorMessage="* Contact should consist of digits"></asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Email : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_uniEmail" CssClass="form-control" placeholder="Enter University Contact" ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Address : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_uniAddress" CssClass="form-control" placeholder="Enter University Contact" ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Hec Ranking : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_HecRanking" CssClass="form-control" placeholder="Enter Hec Ranking" TextMode="Number" MaxLength="3" min="1" max="999"  ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,5}$" ControlToValidate="tb_HecRanking" ForeColor="red"
                        ErrorMessage="* Ranking should consist of maximum 5 digits"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                Test Name : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_TestName" CssClass="form-control" placeholder="Enter Test Name i.e ECAT"  ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[A-Za-z]{1,100}$" ControlToValidate="tb_TestName" ForeColor="red"
                        ErrorMessage="* Test Name should consist of alphabets"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                University Type : 
            </div>
            <div class="col-md-10">
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddl_UniversityType">
                    <asp:ListItem>Government</asp:ListItem>
                    <asp:ListItem>Semi-Government</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row" style="margin-top:20px;">
            <div class="col-md-2" >
                Attach Logo : 
            </div>
            <div class="col-md-10">
                <asp:FileUpload ID="fu_logo" runat="server" />
                <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator6"
                        runat="server" Display="Dynamic" CssClass="text-danger"
                        ErrorMessage="Only Gif,Jpg,Png,Pdf and word files are allowed!"
                        ValidationExpression="^.+(.jpg|.JPG|.png|.PNG|.JPEG|.jpeg|.gif|.GIF|.pdf|.PDF|.docx|.DOCX|.DOC|.doc)$"
                        ControlToValidate="fu_logo"> </asp:RegularExpressionValidator>
            </div>
            
        </div>

        
        <div class="row">
            <div class="col-md-2">
                Fee Structure : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_FeeStructure" Width="1000" CssClass="form-control" placeholder="Enter Fee Structure For This Univeristy" TextMode="MultiLine"  ></asp:TextBox>
            </div>
        </div>
        
        <div class="row" style="margin-top:50px;">
            <div class="col-md-12" >
                <asp:Button runat="server" ID="btn_addCampuses" CssClass="btn btn-primary form-control" OnClick="btn_addCampuses_Click" Text="Next -> Add Campuses" />
            </div>
            
        </div>
    </div>
        </div>
</asp:Content>