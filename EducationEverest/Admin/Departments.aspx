<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departments.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">

        <div class="row" runat="server" id="div_Search" visible="true" style="margin-top:50px; margin-bottom:50px;">
            <div class="col-md-2">
            </div>

            <div class="col-md-1">
                <h3>Search</h3>
            </div>

            <div class="col-md-3" >
        <asp:TextBox ID="TextBox1" class="form-control"  runat="server"></asp:TextBox>
                </div>

       <div class="col-md-1">
         <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Search_Click"  Text="Search" />
                </div>

            </div>

        <div class="row" style="margin-bottom:20px;"> 
            <div class="col-md-2"></div>
            <div class="col-md-10">
            <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_campuses" OnClick="lb_campuses_Click" runat="server" Text="Campuses"></asp:LinkButton>
        <asp:Label runat="server" Text=" > Departments"></asp:Label>
                </div>
        </div>

        <div class="row" id="div_Buttons" runat="server" style="margin-bottom:20px;" visible="true">
            <div class="col-md-2"></div>
            <div class="col-md-3" style="margin-top:5px; margin-bottom:5px;">
                <asp:Button ID="btn_newDepart" class="btn btn-dark"  runat="server" OnClick="btn_newDepart_Click" Text="Create New Department" />
            </div>
            <div class="col-md-3" style="margin-top:5px; margin-bottom:5px;">
                <asp:Button ID="btn_bulkDeparts" class="btn btn-primary"  runat="server" OnClick="btn_bulkDeparts_Click" Text="Create Bulk Departments" />
            </div>
       </div>

        <div id="div_placeHolder" runat="server" visible="false" class="row" style="margin-top:20px;margin-bottom:20px;">
            <div class="container" style="margin-bottom:50px;margin-top:100px; margin-left:200px;" >
        
        <asp:Label runat="server" Font-Bold="true" style="margin-bottom:50px;">Add Departments</asp:Label>
    
            <asp:PlaceHolder ID="ph_Departments" runat="server" ></asp:PlaceHolder>
            <asp:Button ID="saveDepartments" Text="Done" CssClass="btn btn-primary" runat="server" OnClick="saveDepartments_Click" />
                </div>
         </div>

        <div class="row" runat="server" id="div_Gridview">  <div class="col-md-2"></div>
            <div class="col-md-10">
                <h2>Departments</h2>
    <asp:GridView ID="GridView1" CssClass="table table-bordered" AutoGenerateColumns ="false" runat="server">
        <Columns>

            <asp:TemplateField HeaderText= "Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Department_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText= "Status">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Convert.ToBoolean(Eval("Status"))==true?"Complete":"Incomplete" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText= "Actions">
                <ItemTemplate>
                    <asp:Button ID="Button3" class="btn btn-primary" OnCommand="MyID_Click"  CommandName="MyDepartmentID" CommandArgument='<%# Eval("id") %>' runat="server" Text="Details" />
                    
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
       

    </asp:GridView>

                </div>
            </div>
</div>
    </asp:Content>
