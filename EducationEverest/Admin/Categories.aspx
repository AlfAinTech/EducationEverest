<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Categories.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:100px; margin-left:200px;">
        <div class="container" style="margin-bottom:50px;" >
        <div class="row container" style="margin-bottom:20px;">
        <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_campuses" OnClick="lb_campuses_Click" runat="server" Text="Campuses"></asp:LinkButton>
        <asp:Label runat="server" Text=" > Add Categories"></asp:Label>
            </div>
        <asp:Label runat="server" Font-Bold="true">Add Categories</asp:Label>
    </div>
        <div class="container" style="margin-bottom:50px;" >

            <asp:PlaceHolder ID="ph_Categories" runat="server" ></asp:PlaceHolder>
            <div class="row" style="margin-top:20px;">
                <div class="col-md-3">
                    <asp:Button ID="btn_SaveCategories" runat="server" CssClass="form-control btn btn-primary" Text="Done" OnClick="btn_SaveCategories_Click" />
                </div>
            </div>
        </div>

        
    </div>
</asp:Content>   