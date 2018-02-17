<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DepartmentPage.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_DepartmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:100px; margin-left:200px;">
    <div class="container" style="margin-bottom:50px;" >
        <div class="row container" style="margin-bottom:20px;">
        <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_campuses" OnClick="lb_campuses_Click" runat="server" Text="Campuses"></asp:LinkButton>
            <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_departments" OnClick="lb_departments_Click" runat="server" Text="Departments"></asp:LinkButton>
        
        <asp:Label runat="server" Text=" > Add new Department"></asp:Label>
            </div>
        <asp:Label runat="server" Font-Bold="true">Add Department</asp:Label>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                Department Name : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_DepartmentName" CssClass="form-control" placeholder="Enter Department Name" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="tb_DepartmentName" Display="Dynamic"
                        CssClass="text-danger" ErrorMessage="* Field is required." />
                    <asp:RegularExpressionValidator ID="re_tb_uniName" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[a-z A-Z]{1,100}$" ControlToValidate="tb_DepartmentName" ForeColor="red"
                        ErrorMessage="* Name should consist of alphabets"></asp:RegularExpressionValidator>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-2">
                Application Fee : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_ApplicationFee" CssClass="form-control" placeholder="Enter Application Fee" TextMode="Number" ></asp:TextBox>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-2">
                Criteria : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_Criteria" Width="1000" CssClass="form-control" placeholder="Enter Criteria For This Department" TextMode="MultiLine"  ></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                Admission Documents : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_AdmissionDocs" Width="1000" CssClass="form-control" placeholder="Enter Admission Docs For This Department" TextMode="MultiLine"  ></asp:TextBox>
            </div>
        </div>

        <div class="row" style="margin-top:50px;">
            <div class="col-md-3" >
                <asp:Button runat="server" ID="btn_addPrograms" CssClass="btn btn-primary form-control" OnClick="btn_addPrograms_Click"  Text="Next -> Add Programs" />
            </div>
            
        </div>
    </div>
        </div>
</asp:Content>
