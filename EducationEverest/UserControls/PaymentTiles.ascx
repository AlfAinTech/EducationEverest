<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PaymentTiles.ascx.cs" Inherits="UserControls_PaymentTiles" %>

<asp:Repeater ID="ChoicesList" runat="server" OnItemDataBound="ChoicesList_ItemDataBound">
<ItemTemplate>
    <div class="panel panel-default ">
        <div class="panel-heading card_bg">
            <div class="row text-left">
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                    <asp:Image ID="logo" runat="server" src="../images/university_icon.png" />

                </div>
                <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
                    <h4 class="panel-title margin_top">
                        <div class="NormalCharacterStyle_new1 margin_left"><%# Eval("university.Name") %><small class='<%# Eval("CurrentStatus_").ToString()=="pending" || Eval("CurrentStatus_").ToString()=="rejected"?"rejected_text pull-right":"progress_text pull-right" %> pull-right'></span><b><%# Eval("CurrentStatus") %></b></small></div>
                    </h4>
                    <%--<div  class="NormalCharacterStyle_new2 margin_left margin_top">BBA &nbsp;&nbsp;&nbsp; Lahore Campus &nbsp;&nbsp;&nbsp; Spring Semester &nbsp; ...</div>--%>
                    <h4 class="blue_text margin_left">Application ID: <%# Eval("appID") %></h4>
                    <div>
                        <span class="orange_text margin_left">Application Date: </span><span class="panel_text"><%# Eval("ApplicationDate") %></span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red_text">Late Date: </span><span class="panel_text"><%# Eval("university.deadLine") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="green_text">Status: </span><span class="panel_text"><%# Eval("CurrentStatus") %></span><small class="NormalCharacterStyle102 pull-right"><b>PKR <%# Eval("Fees") %></b></small>
                    </div>
                </div>
                <div class="margin_top col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <button type="button" data-toggle="modal" runat="server" id="btn_MakePayment"  data-target="#exampleModalCenterSingleItem" onclick='<%# String.Format("javascript:return AddPayment(\"{0}\",\"{1}\")", Eval("id").ToString(),Eval("Fees").ToString())   %>'   class=" btn make_paymeny_button_bg pull-right">Make Payment</button>
                </div>
            </div>
            <br />

        </div>
    </div>
</ItemTemplate>
</asp:Repeater>
<asp:HiddenField ID="paymentAppID" runat="server" />
<div style="padding-bottom: 3%">
            <button id="btn_MakeTotalPayment" runat="server" type="button" class=" btn button_bg" data-toggle="modal" data-target="#exampleModalCenter"><span class="NormalCharacterStyle">Make Payment</span></button>
        </div>
<div class="modal fade" id="exampleModalCenter">
            <div class="modal-dialog">
                <div class="panel panel-heading pop_bg1 text-center">
                    <div class="NormalCharacterStyle12" style="margin-top: 5px;">
                        Select Payment Method
  <span>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span>
              <img src="/Content/img/close_icon.png"></span>
      </button>
  </span>
                    </div>

                    <br />
                    <div class="pop_divider"></div>
                    <br />
                    <div class="popup_text">Your Invoice Total</div>
                    <br />
                    <div class="popup_text2">
                        PKR
                            <asp:Label ID="totalInvoice" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="NormalCharacterStyle25">Select your method from below</div>
                    <br />
                    <div class="col-md-12">


                        <a href="" data-toggle="tab" data-target="#easypaisatab2">
                            <div class="col-md-2" style="margin-left: 150px;">
                                <div class="popup_cards2">
                                    <div class="easy_paisa_logo"></div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="payment_methods_text">Easypaisa</div>
                                </div>
                            </div>
                        </a>

                        <a  href="" data-toggle="tab" data-target="#jazztab2">
                            <div class="col-md-2" style="margin-left: 50px;">
                                <div class="popup_cards2">
                                    <div class="jazz_cash_logo"></div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="payment_methods_text">Bank of Punjab</div>
                                </div>
                            </div>
                        </a>



                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="easypaisatab2">


                                <div class="callout bottom text-center">
                                    <div class="col-md-12 text-center" style="margin-top: 40px">
                                        <div class="NormalCharacterStyle16">
                                            Please contact the following representative for
                                                <br />
                                            payment information.
                                        </div>
                                        <br />
                                        <br />
                                        <div class="NormalCharacterStyle222">EasyPaisa Account Title: Fahad Ali Subhan</div>
                                        <div class="NormalCharacterStyle222">Phone Number: +92 321 6444374</div>
                                        <br />
                                        
                                        <div class="NormalCharacterStyle16">Call at 0322 EVEREST (3837378) if you have any questions.</div>

                                    </div>

                                </div>

                            </div>
                            <div class="tab-pane fade in" id="jazztab2">


                                <div class="callout1 bottom text-center">
                                    <div class="col-md-12 text-center" style="margin-top: 40px">
                                        <div class="NormalCharacterStyle16">
                                            Please contact the following representative for
                                                <br />
                                            payment information.
                                        </div>
                                        <br />
                                        <br />
                                        <div class="NormalCharacterStyle222">Account No: 6020096349000012</div>
                                        <div class="NormalCharacterStyle222">Account Title: Education Everest (pvt) Ltd Bank of Punjab</div>
                                        <br />
                                        
                                        <div class="NormalCharacterStyle16">Call at 0322 EVEREST (3837378) if you have any questions.</div>

                                    </div>

                                </div>

                                <%--<div class="callout1 bottom text-center">
                                    <div class="col-md-12 text-center" style="margin-top: 40px">
                                        <div class="NormalCharacterStyle16">
                                            Please contact the following representative for
                                                <br />
                                            payment information.
                                        </div>
                                        <br />
                                        <br />
                                        <div class="NormalCharacterStyle222">EasyPaisa Account Title: Fahad Ali Subhan</div>
                                        <div class="NormalCharacterStyle222">Phone Number: +92 321 6444374</div>
                                        <br />
                                        
                                        <div class="NormalCharacterStyle16">Call at 0322 EVEREST (3837378) if you have any questions.</div>

                                    </div>

                                </div>--%>

                            </div>

                            <div class="col-md-12" style="margin-top: 13px;">
                                <div class="NormalCharacterStyle16" style="text-align: left; padding-left: 15px;">
                                    <b>Add Tracking ID to Confirm Payment</b><br />
                                </div>
                                <div class="col-md-12">
                                    <input class="inputs" id="TrackingID" type="text" name="TrackingID" style="position: relative" placeholder="Tracking Id" runat="server" />
                                </div>
                                <div class="col-md-12" style="padding: 2%">
                                    <asp:LinkButton ID="SubmitTrackingID" OnClick="SubmitTrackingID_Click" class=" btn btn_custom pull-right" runat="server"><span class="NormalCharacterStyle">NEXT</span></asp:LinkButton>
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />

                        </div>

                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModalCenterSingleItem">
            <div class="modal-dialog">
                <div class="panel panel-heading pop_bg1 text-center">
                    <div class="NormalCharacterStyle12" style="margin-top: 5px;">
                        Select Payment Method
  <span>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span>
              <img src="/Content/img/close_icon.png"></span>
      </button>
  </span>
                    </div>

                    <br />
                    <div class="pop_divider"></div>
                    <br />
                    <div class="popup_text">Your Invoice</div>
                    <br />
                    <div class="popup_text2">
                        PKR
                            <asp:Label ID="InvoicePayment" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="NormalCharacterStyle25">Select your method from below</div>
                    <br />
                    <div class="col-md-12">


                        <a href="" data-toggle="tab" data-target="#easypaisatab">
                            <div class="col-md-2" style="margin-left: 150px;">
                                <div class="popup_cards2">
                                    <div class="easy_paisa_logo"></div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="payment_methods_text">Easypaisa</div>
                                </div>
                            </div>
                        </a>

                        <a href="#jazztab" data-toggle="tab" data-target="#jazztab">
                            <div class="col-md-2" style="margin-left: 50px;">
                                <div class="popup_cards2">
                                    <div class="jazz_cash_logo"></div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div class="payment_methods_text">Bank of Punjab</div>
                                </div>
                            </div>
                        </a>



                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="easypaisatab">


                                <div class="callout bottom text-center">
                                    <div class="col-md-12 text-center" style="margin-top: 40px;">
                                        <div class="NormalCharacterStyle16">
                                            Please contact the following representative for
                                                <br />
                                            payment information.
                                        </div>
                                        <br />
                                        <br />
                                        <div class="NormalCharacterStyle222">EasyPaisa Account Title: Fahad Ali Subhan</div>
                                        <div class="NormalCharacterStyle222">Phone Number: +92 321 6444374</div>
                                        
                                        <br />
                                        <div class="NormalCharacterStyle16">Call at 0322 EVEREST (3837378) if you have any questions.</div>

                                    </div>

                                </div>

                            </div>
                            <div class="tab-pane fade in" id="jazztab">

                               
                                    <div class="callout1 bottom text-center">
                                    <div class="col-md-12 text-center" style="margin-top: 40px">
                                        <div class="NormalCharacterStyle16">
                                            Please contact the following representative for
                                                <br />
                                            payment information.
                                        </div>
                                        <br />
                                        <br />
                                        <div class="NormalCharacterStyle222">Account No: 6020096349000012</div>
                                        <div class="NormalCharacterStyle222">Account Title: Education Everest (pvt) Ltd Bank of Punjab</div>
                                        <br />
                                        
                                        <div class="NormalCharacterStyle16">Call at 0322 EVEREST (3837378) if you have any questions.</div>

                                    </div>

                                </div>
                                    
                                        
                                        <%--<div class="callout1 bottom text-center">
                                            <div class="col-md-12 text-center" style="margin-top: 40px">
                                                <div class="NormalCharacterStyle16">
                                                    Please contact the following representative for
                                                        <br />
                                                    payment information.
                                                </div>
                                                <br />
                                                <br />
                                                <div class="NormalCharacterStyle222">EasyPaisa Account Title: Fahad Ali Subhan</div>
                                        <div class="NormalCharacterStyle222">Phone Number: +92 321 6444374</div>
                                        <br />
                                        
                                        <div class="NormalCharacterStyle16">Call at 0322 EVEREST (3837378) if you have any questions.</div>

                                            </div>

                                        </div>--%>

                                  
                               

                            </div>
                            <div class="col-md-12" style="margin-top: 13px;">
                                <div class="NormalCharacterStyle16" style="text-align: left; padding-left: 15px">
                                    <b>Add Tracking ID to Confirm Payment</b><br />
                                </div>
                                <div class="col-md-12">
                                    <input class="inputs" id="SingleTrackingId" type="text" name="SingleTrackingID" style="position: relative" placeholder="Tracking Id" runat="server" />
                                </div>
                                <div class="col-md-12" style="padding: 2%">
                                    <asp:LinkButton ID="SinglePayment" OnClick="SinglePayment_Click" class=" btn btn_custom pull-right" runat="server"><span class="NormalCharacterStyle">NEXT</span></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                
                function AddPayment(appid, price) {
                    
                    console.log(appid, price);
                    $("[id*=paymentAppID]").val(appid);
                    $("[id*=InvoicePayment]")[0].innerHTML = "";
                    $("[id*=InvoicePayment]")[0].innerHTML = price;

                }

                function myFunction() {
                    alert("hellooo");
                }

                $(window).on('load', function () {

                    OpenCurrentPage();
                });

                $(document).ready(function () {

                    $('.menu_toggles').on('click', function () {

                        var iSelector = $(this).find('i:first');
                        if (iSelector.hasClass('glyphicon-chevron-down')) {
                            iSelector.removeClass('glyphicon-chevron-down')
                            iSelector.addClass('glyphicon-chevron-up')
                        } else if (iSelector.hasClass('glyphicon-chevron-up')) {
                            iSelector.removeClass('glyphicon-chevron-up')
                            iSelector.addClass('glyphicon-chevron-down')
                        }
                    });
                    
                    //  OpenCurrentPage();
                });

                

                function OpenCurrentPage() {
                    $("#Payments").parent().addClass("selected_bg");
                    $("#Payments").removeClass("NormalCharacterStyle24")
                    $("#Payments").addClass("NormalCharacterStyle22");
                    document.getElementById("fileAdmission").click();
                    $("#fileAdmission").removeClass("NormalCharacterStyle25")
                    $("#fileAdmission").addClass("NormalCharacterStyle18");
                    document.getElementById("menu_togglePersonalDoc").click();
                }
            </script>




        </div>