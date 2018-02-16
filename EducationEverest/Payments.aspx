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
     	<div class="NormalCharacterStyle12">Select Payment Method</div>
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

				<a href=""><div class="col-md-2">
				<div class="popup_cards">
					<div class="credit_card_icon"></div><br/><br/><br/><br/><br/>
					<div class="payment_methods_text">Credit Card</div>
				</div></div></a>

				<a href=""><div class="col-md-2" style="margin-left: 50px;">
				<div class="popup_cards2">
					<div class="easy_paisa_logo"></div><br/><br/><br/><br/><br/>
					<div class="payment_methods_text">Easypaisa</div>
				</div></div></a>

				<a href=""><div class="col-md-2" style="margin-left: 50px;">
				<div class="popup_cards2" >
					<div class="jazz_cash_logo"></div><br/><br/><br/><br/><br/>
					<div class="payment_methods_text">Jazz Cash</div>
				</div></div></a>

				<a href=""><div class="col-md-2" style="margin-left: 50px;">
				<div class="popup_cards2" >
					<div class="paypal_icon"></div><br/><br/><br/><br/><br/>
					<div class="payment_methods_text">Paypal</div>
				</div></div></a>

				<div class="callout bottom text-center">
					<div class="col-md-12" style="margin-top: 40px">
					<div class="col-md-1"></div>
					<div class="col-md-10">
					      <div class="input-group">
    <span class="input-group-addon"><img src="images/credit_card_icon_1_.png" height="20px"></span>
    <input  type="text" class="form-control" name="card number" placeholder="4524 - 2452 - 7214 - 8765">
  </div>
  <br/>

    <input  type="text" class="form-control" name="card holder" placeholder="Card Holder Name">
<br/>

  <div class="form-row">
  	<div class="col-md-2">
  		<label class="NormalCharacterStyle7">Expire</label>
  	</div>
  	<div class="col-md-3">
    <input  type="text" class="form-control" name="card number" placeholder="Month"></div>
  	<div class="col-md-3">
    <input  type="text" class="form-control" name="card number" placeholder="Year"></div>
  	<div class="col-md-4">
    <input  type="text" class="form-control" name="card number" placeholder="CVC/CVV"></div>

  </div>
<br/>

</div>
<div class="col-md-1"></div>
</div>

				</div>
     	<br/><br/>
     	 <button type="button" class="btn payment_btn"><span class="NormalCharacterStyle">Make Payment</span></button>
		</div>

     	</div>
  </div>
</div>

  </div>
</div>
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

