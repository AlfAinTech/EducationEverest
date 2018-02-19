<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Payments.aspx.cs" Inherits="Payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="col-sm-9 text-left"> 
      <h3 class="NormalCharacterStyle12">Payments</h3>
      <p class="NormalCharacterStyle11">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
      <br/>
      <dl class="NormalCharacterStyle11">
        <dd>-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</dd>
        <dd>-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</dd>
        <dd>-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</dd>
      </dl>
      <div class="panel panel-default panel_shadow">
      <div class="panel-heading" style="height: 50px">
        <h4 class="panel-title">
          <div class="NormalCharacterStyle10">Application Invoice<div class="icon-arrow-right pull-right"><div class="check-"></div><a id="menu_toggle" ><i class="glyphicon glyphicon-chevron-down normal-color" data-toggle="collapse" data-parent="#accordion" href="#collapse2"></i></a></div></div> 
        </h4>
              </div>
      <div id="collapse2" class="panel-collapse panel-heading collapse">
        <div class="panel-body" style="height: 400px;">

        </div>
      </div>
    </div>

 
   
         <button type="button" class=" btn button_bg" data-toggle="modal" data-target="#exampleModalCenter"><span class="NormalCharacterStyle">Make Payment</span></button>

            <div class="modal fade" id="exampleModalCenter" >
  <div class="modal-dialog">
     	<div class="panel panel-heading pop_bg text-center">
     	<div class="NormalCharacterStyle12" style="margin-top: 5px;">Select Payment Method
  <span> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span><img src="/Content/img/close_icon.png"></span>
        </button></span>
     	</div>

     	<br/>
     	<div class="pop_divider"></div>
     	<br/>
     	<div class="popup_text">Your Invoice Total</div>
     	<br/>
     	<div class="popup_text2">PKR 5934</div>
     	<br/>
		<div class="NormalCharacterStyle25">Select your method from below</div>
		<br/>
		<div class="col-md-12">


				<a href="" data-toggle="tab" data-target="#easypaisatab"><div class="col-md-2" style="margin-left: 150px;">
				<div class="popup_cards2">
					<div class="easy_paisa_logo"></div><br/><br/><br/><br/><br/>
					<div class="payment_methods_text">Easypaisa</div>
				</div></div></a>

				<a href="" data-toggle="tab" data-target="#jazztab"><div class="col-md-2" style="margin-left: 50px;">
				<div class="popup_cards2" >
					<div class="jazz_cash_logo"></div><br/><br/><br/><br/><br/>
					<div class="payment_methods_text">Jazz Cash</div>
				</div></div></a>



				  <div class="tab-content">
      <div class="tab-pane fade in active" id="easypaisatab">


				<div class="callout bottom text-center">
					<div class="col-md-12 text-center" style="margin-top: 40px">
						<div class="NormalCharacterStyle16">Please contact the following representative for <br/>
payment information.</div>
					<br/><br/>
					<div class="NormalCharacterStyle222">Mr. Representative : +92 321 123 4567</div>
					<br/><br/>
					<div class="NormalCharacterStyle16">Our representative will guide you through.</div>
					
</div>

				</div>

						</div>
 <div class="tab-pane fade in" id="jazztab">


				<div class="payment_callout bottom text-center">
					<div class="col-md-12 text-center" style="margin-top: 40px">
						<div class="NormalCharacterStyle16">Please contact the following representative for <br/>
payment information.</div>
					<br/><br/>
					<div class="NormalCharacterStyle222">Mr. Representative : +92 321 123 4567</div>
					<br/><br/>
					<div class="NormalCharacterStyle16">Our representative will guide you through.</div>
					
</div>

				</div>

						</div>


					</div>

		</div>

     	</div>
  </div>
</div></div>

<script type="text/javascript">
  $('#menu_toggle').on('click', function () {
    var iSelector = $(this).find('i:first');
    if (iSelector.hasClass('glyphicon-chevron-down')) {
        iSelector.removeClass('glyphicon-chevron-down')
        iSelector.addClass('glyphicon-chevron-up')
    } else if (iSelector.hasClass('glyphicon-chevron-up')) {
        iSelector.removeClass('glyphicon-chevron-down')
        iSelector.addClass('glyphicon-chevron-down')
    }
});
  $('#menu_toggle2').on('click', function () {
    var iSelector = $(this).find('i:first');
    if (iSelector.hasClass('glyphicon-chevron-down')) {
        iSelector.removeClass('glyphicon-chevron-down')
        iSelector.addClass('glyphicon-chevron-up')
    } else if (iSelector.hasClass('glyphicon-chevron-up')) {
        iSelector.removeClass('glyphicon-chevron-down')
        iSelector.addClass('glyphicon-chevron-down')
    }
});
  $('#menu_toggle3').on('click', function () {
    var iSelector = $(this).find('i:first');
    if (iSelector.hasClass('glyphicon-chevron-down')) {
        iSelector.removeClass('glyphicon-chevron-down')
        iSelector.addClass('glyphicon-chevron-up')
    } else if (iSelector.hasClass('glyphicon-chevron-up')) {
        iSelector.removeClass('glyphicon-chevron-down')
        iSelector.addClass('glyphicon-chevron-down')
    }
});
</script>




</asp:Content>

