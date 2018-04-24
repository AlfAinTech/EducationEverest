<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNavBar.ascx.cs" Inherits="UserControls_TopNavBar" %>

<script type="text/javascript">

function excluirItemNotificacao(e) {
            $('#item_notification_' + e.id).remove()
        }

        function notificationClicked(notfxnID) {
            document.getElementById("<%= hf1.ClientID %>").value = notfxnID;
            var clickButton = document.getElementById("<%= btn_notfxn.ClientID %>");
            clickButton.click();
        }
    
    </script>
<div class="navbar-inverse" style="border-radius: 0px; height: 60px;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <a class="navbar-brand" href="Dashboard.aspx">
                    <img src="images/Logo_1_.png"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="https://educationeverest.org/" target="_blank" style="font-size: 20px; top: 6px;">Home </a></li>
                    <li><a href="Dashboard.aspx" style="font-size: 20px; top: 6px;">Dashboard</a></li>
                    <li style="color: transparent;">home</li>
                </ul>
                <div class="navbar-form navbar-left">
                    <div class="form-group" style="margin-top: -40px">
                        <asp:TextBox ID="TextBox1" runat="server" Style="height: 32px"></asp:TextBox>

                        <%--<input type="text" class="form-control" placeholder="UET" style="width: 260px;border-radius: 3px;">--%>
                    </div>
                    <span>
                        <asp:ImageButton ID="btnSearch" ImageUrl="~/images/search_button.png" Style="margin-top: 4px;" runat="server" OnClick="btnSearch_Click"></asp:ImageButton></span>
                    <span>
                        <asp:ImageButton ID="btnFilter" ImageUrl="~/images/filter_button.png" Style="margin-top: 4px; margin-left: -10px" runat="server" OnClick="btnFilter_Click"></asp:ImageButton></span>

                    <%--<span><a href=""><img src="images/search_button.png" style="margin-top: 4px;"></a></span>
        <span><a href=""><img src="images/filter_button.png" style="margin-top: 4px;;margin-left: -10px;"></a></span>--%>
                </div>


                <ul class="nav navbar-nav navbar-right">
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            
                            <span class="alertNotificacao">
                                <img src="images/bell.png" /></span>
                            <div id="div_notfxnBell" runat="server"><span class='badgeAlert'><asp:Label runat="server"  ID="lbl_Totalnotification"></asp:Label></span></div>
                            <%--<span class="caret"></span>--%>
                        </a>
                        <ul class="list-notificacao dropdown-menu">
                        <asp:Repeater runat="server" ID="rptr_Notifications" OnItemDataBound="rptr_Notifications_ItemDataBound">
                        <ItemTemplate>
                            
                            <li>
                                <div class="media" id="div_listItem"  onclick="notificationClicked(<%# Eval("id") %>)" >
                                    <div class="media-left">
                                        <a href="#">
                                            <asp:Image runat="server" ID="img_notfxn" ImageUrl="~/images/notifi_payment_icon.png" />
                                            <%--<img src="/images/notifi_payment_icon.png" />--%>
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <%--<div class='exclusaoNotificacao'>
                                            <button class='btn btn-danger btn-xs button_exclusao' id='1' onclick='excluirItemNotificacao(this)'>x</button>
                                        </div>--%>
                                        <p class="media-heading" style="font-size: 11px">
                                            <strong><%# Eval("Title") %></strong>

                                        </p>
                                        <asp:Label runat="server" ID="lbl_Time" style="font-size: 10px; color: lightgray">Today</asp:Label>
                                    </div>
                                    <div class="media-right">
                                        <asp:Image ImageUrl="~/images/circle.png" ID="img_Circle" runat="server" class="media-object" style="width: 8px ;padding-top: 15px !important;" />
                                        <%--<img src="images/circle.png" id="img_Circle" class="media-object" style="width: 8px ;padding-top: 15px !important;" />--%>
                                    </div>
                                </div>
                            </li>
                            </ItemTemplate>
                            </asp:Repeater>
                            <li>
                                <div runat="server" class="media" id="div_noNotification" style="display:none;" >
                                    <div class="media-left">
                                        <a href="#">
                                            <img src="images/admin_icon.png" />
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <%--<div class='exclusaoNotificacao'>
                                            <button class='btn btn-danger btn-xs button_exclusao' id='1' onclick='excluirItemNotificacao(this)'>x</button>
                                        </div>--%>
                                        <p class="media-heading" style="font-size: 11px">
                                            <strong>No New Notifications</strong>

                                        </p>
                                        
                                    </div>
                                </div>
                            </li>
                            </ul>
                           
                    </li>
                    <%-- <li><a href="#" style="margin-top: 5px;"><img src="images/header_notification_icon_1_.png"></a></li>--%>
                    <li class="dropdown" style="height: 60px;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="NormalCharacterStyle22" style="font-size: 20px; margin-right: 10px; border-bottom: 1px solid white;">
                            <asp:Label ID="lblLoggedUser" runat="server" Text="" Style="font-size: 20px; color: #0094ff; border-bottom: 1px solid; border-color: white"></asp:Label>
                        </span>&nbsp;<img src="images/header_profile_icon_1_.png"></a>
                        <ul class="dropdown-menu myprofile_dropdown">
                            <li><a href="My_Profile.aspx" class="myprofile_dropdown_link NormalCharacterStyle24">Profile</a></li>
                            <li role="separator" class="profile_divider"></li>
                            <%--<li><a href="#" class="myprofile_dropdown_link NormalCharacterStyle25">Settings</a></li>
            <li role="separator" class="profile_divider"></li>--%>
                            <%--<li><a href="Login.aspx"  class="myprofile_dropdown_link NormalCharacterStyle25">Log Out</a></li>--%>
                            <li class="myprofile_dropdown_link">
                                <asp:LinkButton ID="logout" CausesValidation="false" OnClick="logout_Click" runat="server">
                                        <i class=" NormalCharacterStyle24"></i>Logout
                                </asp:LinkButton></li>
                         
                                                     
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
<asp:HiddenField runat="server" ID="hf1" />
                    <asp:Button ID="btn_notfxn" runat="server" OnClick="btn_notfxn_Click" style="display:none;" />