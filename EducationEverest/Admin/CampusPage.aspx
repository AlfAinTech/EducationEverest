<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CampusPage.aspx.cs" MasterPageFile="~/Admin/Admin.master" Inherits="Admin_CampusPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function MainCampus(){
            document.getElementById("cb_NoMc").checked = false;
        }
        function NoMainCampus() {
            document.getElementById("cb_yesMc").checked = false;
        }
    </script>
    <div class="container" style="margin-top:100px; margin-left:200px;">
        
    <div class="container" style="margin-bottom:50px;" >
        <div class="row container" style="margin-bottom:20px;">
        <asp:LinkButton ID="lb_Universities" OnClick="lb_Universities_Click" runat="server" Text="Universities"></asp:LinkButton>
        <asp:Label runat="server" Text=" >"></asp:Label>
            <asp:LinkButton ID="lb_campuses" OnClick="lb_campuses_Click" runat="server" Text="Campuses"></asp:LinkButton>
        <asp:Label runat="server" Text=" > Add new campus"></asp:Label>
            </div>
        <asp:Label runat="server" Font-Bold="true">Add Campus</asp:Label>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                Campus Name : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_campusName" CssClass="form-control" placeholder="Enter Campus Name" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="tb_campusName" ValidationGroup="CampusFields" Display="Dynamic"
                        CssClass="text-danger" ErrorMessage="* Field is required." />
                    
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Contact 1 : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_campusContact1" CssClass="form-control" placeholder="Enter Campus Contact"  ></asp:TextBox>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,20}$" ControlToValidate="tb_campusContact1" ForeColor="red"
                        ErrorMessage="* Contact should consist of digits"></asp:RegularExpressionValidator>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Contact 2 : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_campusContact2" CssClass="form-control" placeholder="Enter Campus Contact"  ></asp:TextBox>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,20}$" ControlToValidate="tb_campusContact2" ForeColor="red"
                        ErrorMessage="* Contact should consist of digits"></asp:RegularExpressionValidator>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Contact 3 : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_campusContact3" CssClass="form-control" placeholder="Enter Campus Contact"  ></asp:TextBox>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,20}$" ControlToValidate="tb_campusContact3" ForeColor="red"
                        ErrorMessage="* Contact should consist of digits"></asp:RegularExpressionValidator>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Email : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_campusEmail" CssClass="form-control" placeholder="Enter Campus Email" ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                Address : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_campusAddress" CssClass="form-control" placeholder="Enter Campus Adress"  ></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                Ratings : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_Ratings" CssClass="form-control" placeholder="Enter Campus Ratings i.e 3.5 ,4" TextMode="Number" MaxLength="1" max="10" min="0"  ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic" CssClass="text-danger"
                        ValidationExpression="^[0-9]{1,2}$" ControlToValidate="tb_Ratings" ValidationGroup="CampusFields" ForeColor="red"
                        ErrorMessage="* Rating should consist of maximum 1 digit"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                Prospectus Link : 
            </div>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tb_prospectusLink" CssClass="form-control" placeholder="Enter Campus Prospectus Link"  ></asp:TextBox>
            </div>
        </div>
        
        <div class="row" style="margin-top:20px;">
            <div class="col-md-2" >
                Is it Main Campus ? 
            </div>
          
                <div class="col-md-1">
                <asp:CheckBox Text="Yes" runat="server" ID="cb_yesMC" Enabled="true" OnCheckedChanged="cb_yesMC_CheckedChanged"  AutoPostBack="true" />
                    </div>
                <div class="col-md-1">
                <asp:CheckBox Text="No" runat="server"  ID="cb_NoMc" Checked="true" Enabled="true"  OnCheckedChanged ="cb_NoMc_CheckedChanged" AutoPostBack="true"  />
                    </div>
           
        </div>

        <div class="row" style="margin-top:20px;">
            <div class="col-md-2">
                Application Fee same for all Departments ? 
            </div>
                <div class="col-md-1">
                <asp:CheckBox Text="Same" runat="server"  ID="cb_sameFee" Checked="true" Enabled="true" OnCheckedChanged="cb_sameFee_CheckedChanged" AutoPostBack="true" />
                    </div>
                <div class="col-md-2">
                <asp:CheckBox Text="Differnt" runat="server"  ID="cb_DifferentFee" Enabled="true" AutoPostBack="true" OnCheckedChanged="cb_DifferentFee_CheckedChanged"  />
                    </div>
            
        </div>

        <div class="row" style="margin-top:20px;" runat="server" id="div_applicationFee">
            <div class="col-md-2">
                Application Fee :
            </div>
            <div class="col-md-10">
                <div >
                <asp:TextBox ID="tb_applicationFee" runat="server" placeholder="Enter Application Fee" CssClass="form-control" TextMode="Number" ></asp:TextBox>
            </div>
            </div>
        </div>

        <div class="row" style="margin-top:50px;">
            <div class="col-md-3" >
                <asp:Button runat="server" ID="btn_addCategories" CssClass="btn btn-dark form-control" ValidationGroup="CampusFields" OnClick="btn_addCategories_Click" Text="Add Categories" />

            </div>
            <div class="col-md-3" >
                <asp:Button runat="server" ID="btn_addDepartments" Enabled="false" CssClass="btn btn-primary form-control" ValidationGroup="CampusFields" OnClick="btn_addDepartments_Click" Text="Next -> Add Departments" />
            </div>
            
        </div>
    </div>
        </div>
</asp:Content>
