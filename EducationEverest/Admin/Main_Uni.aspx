<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Main_Uni.aspx.cs" Inherits="Main_Uni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">

        <div class="row" style="margin-top:50px; margin-bottom:50px;">
            <div class="col-md-2">
            </div>

            <div class="col-md-1">
                <h3>Search</h3>
            </div>

            <div class="col-md-3" >
    <asp:TextBox ID="TextBox1" class="form-control"  runat="server"></asp:TextBox>
                </div>

       <div class="col-md-1">
         <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Search_Click" Text="Search" />
                </div>

            </div>
        <div class="row" style="margin-bottom:20px;">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="margin-top:5px; margin-bottom:5px;">
        <asp:Button ID="Button2" class="btn btn-primary"  runat="server" OnClick="AddUni_Click" Text="Create New University" />
                </div>
            </div>
        <div class="row">  <div class="col-md-2"></div>
            <div class="col-md-10">
                <h2>Universities</h2>
    <asp:GridView ID="GridView1" CssClass="table table-bordered" AutoGenerateColumns ="false" runat="server">
        <Columns>

            <asp:TemplateField HeaderText= "Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <%--<asp:TemplateField HeaderText= "Last Updated">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("last_updated") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText= "Updated By">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("updated_by") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>


            <asp:TemplateField HeaderText= "Status">
                <ItemTemplate>
                    <%--<asp:Label ID="lbl_UniStatus" runat="server"  Text='<%# Convert.ToBoolean(Eval("Status"))==true?"Complete":"Incomplete" %>' ></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText= "Actions">
                <ItemTemplate>
                    <asp:Button ID="Button3" class="btn btn-primary" OnCommand="MyID_Click" CommandName="MyID" CommandArgument='<%# Eval("id") %>' runat="server" Text="Edit" />
                    
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
       

    </asp:GridView>

                </div>
            </div>


















        </div>

</asp:Content>

