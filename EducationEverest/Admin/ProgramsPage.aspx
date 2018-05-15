<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProgramsPage.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_ProgramsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:100px; margin-left:200px;">
    <div class="container" style="margin-bottom:50px;" >
        <div class="row container" style="margin-bottom:20px;">
        <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_campuses" OnClick="lb_campuses_Click" runat="server" Text="Campuses"></asp:LinkButton>
            <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_departments" OnClick="lb_departments_Click" runat="server" Text="Departments"></asp:LinkButton>
            <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_programs" OnClick="lb_programs_Click" runat="server" Text="Programs"></asp:LinkButton>
            <asp:Label runat="server" Text=" > Add new Program"></asp:Label>
            </div>
        <asp:Label runat="server" Font-Bold="true">Add Program</asp:Label>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                Program Name : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_ProgramName" CssClass="form-control" placeholder="Enter Program Name" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="tb_ProgramName"  ValidationGroup="ProgramFields" Display="Dynamic"
                        CssClass="text-danger" ErrorMessage="* Field is required." />
                    
            </div>
        </div>

        <div class="row" style="margin-top:20px;">
            <div class="col-md-4">
                Hide this Program for candidates
            </div>
                <div class="col-md-2">
                <asp:CheckBox Text="Hide" runat="server"  ID="cb_hidePrgrm" Checked="false" Enabled="true"  />
                    </div>
                <div class="col-md-6">
                    </div>
            
        </div>
        
        <div class="row" style="margin-top:20px;">
            <div class="col-md-2">
                Categories : 
            </div>
            <div class="col-md-10">
                <asp:PlaceHolder ID="ph_Categories" runat="server" ></asp:PlaceHolder>
            </div>
        </div>
        
        

        <div class="row" style="margin-top:50px;">
            <div class="col-md-3" >
                <asp:Button runat="server" ID="btn_Done" CssClass="btn btn-primary form-control" ValidationGroup="ProgramFields" OnClick="btn_Done_Click"  Text="Done" />
            </div>
            
        </div>
    </div>
        </div>
</asp:Content>