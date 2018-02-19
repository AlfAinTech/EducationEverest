<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Programs.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_Programs" %>

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
         <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click"  Text="Search" />
                </div>
            
            </div>

        <div class="row" style="margin-bottom:20px;"> 
            <div class="col-md-2"></div>
            <div class="col-md-10">
            <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_campuses" OnClick="lb_campuses_Click" runat="server" Text="Campuses"></asp:LinkButton>
                <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_departments" OnClick="lb_departments_Click" runat="server" Text="Departments"></asp:LinkButton>
        <asp:Label runat="server" Text=" > Programs"></asp:Label>
                </div>
        </div>

        <div class="row" id="div_Buttons" runat="server" style="margin-bottom:20px;" visible="true">
            <div class="col-md-2"></div>
            <div class="col-md-3" style="margin-top:5px; margin-bottom:5px;">
                <asp:Button ID="btn_newProgram" class="btn btn-dark"  runat="server" OnClick="btn_newProgram_Click" Text="Create New Program" />
            </div>
            <div class="col-md-3" style="margin-top:5px; margin-bottom:5px;">
                <asp:Button ID="btn_bulkPrograms" class="btn btn-primary"  runat="server" OnClick="btn_bulkPrograms_Click" Text="Create Bulk Programs" />
            </div>
       </div>

        <div id="div_placeHolder" runat="server" class="row" visible="false" style="margin-top:20px;margin-bottom:20px;">
            <div class="container" style="margin-bottom:50px;margin-top:100px; margin-left:200px;" >
        
        <asp:Label runat="server" Font-Bold="true" style="margin-bottom:50px;">Add Programs</asp:Label>
    
            <asp:PlaceHolder ID="ph_Programs" runat="server" ></asp:PlaceHolder>
            <asp:Button ID="savePrograms" Text="Done" CssClass="btn btn-primary" runat="server" OnClick="savePrograms_Click" />
                </div>
            
        </div>

        <div class="row" runat="server" id="div_Gridview">  <div class="col-md-2"></div>
            <div class="col-md-10">
                <h2>Programs</h2>
    <asp:GridView ID="GridView1" CssClass="table table-bordered" AutoGenerateColumns ="false" runat="server">
        <Columns>

            <asp:TemplateField HeaderText= "Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Program_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText= "Status">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Convert.ToBoolean(Eval("Status"))==true?"Complete":"Incomplete" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText= "Actions">
                <ItemTemplate>
                    <asp:Button ID="Button3" class="btn btn-primary"  CommandName="MyProgramID" OnCommand="Button3_Command" CommandArgument='<%# Eval("id") %>' runat="server" Text="Details" />
                    
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
       

    </asp:GridView>

                </div>
            </div>
</div>
    </asp:Content>

