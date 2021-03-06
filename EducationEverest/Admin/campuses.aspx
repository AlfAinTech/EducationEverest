﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="campuses.aspx.cs" Inherits="Admin_campuses" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">

        <div class="row" style="margin-top:50px;margin-bottom:50px;">
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
        <asp:Label runat="server" Text=" > Campuses"></asp:Label>
                </div>
        </div>
        <div class="row" style="margin-bottom:20px;">
            
            <div class="col-md-2"></div>
            <div class="col-md-8" style="margin-top:5px; margin-bottom:5px;">
        <asp:Button ID="Button2" class="btn btn-primary"  runat="server" OnClick="Button2_Click"  Text="Create New Campus" />
                </div>
            </div>
        <div class="row">  <div class="col-md-2"></div>
            <div class="col-md-10">
                <h2>Campuses</h2>
    <asp:GridView ID="GridView1" CssClass="table table-bordered" AutoGenerateColumns ="false" runat="server">
        <Columns>

            <asp:TemplateField HeaderText= "Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Campus_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            

            <asp:TemplateField HeaderText= "Status">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Convert.ToBoolean(Eval("Status"))==true?"Complete":"Incomplete" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText= "Actions">
                <ItemTemplate>
                    <asp:Button ID="Button3" class="btn btn-primary" OnCommand="MyID_Click"  CommandName="MyCampusID" CommandArgument='<%# Eval("id") %>' runat="server" Text="Edit" />
                    
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
       

    </asp:GridView>

                </div>
            </div>
</div>
    </asp:Content>