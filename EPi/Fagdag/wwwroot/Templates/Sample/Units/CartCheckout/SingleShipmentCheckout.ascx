<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SingleShipmentCheckout.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SingleShipmentCheckout" %>
<%@ Register Src="SharedModules/LineItemsSimpleView.ascx" TagName="LineItems" TagPrefix="cart" %>
<%@ Register Src="SharedModules/OrderSubtotalSimpleView.ascx" TagName="OrderSubtotal" TagPrefix="cart" %>
<%@ Register Src="SharedModules/PaymentOptions.ascx" TagName="PaymentOptions" TagPrefix="checkout" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/ApplyCoupons.ascx" TagName="ApplyCoupons" TagPrefix="cart" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/ErrorModule.ascx" TagPrefix="cart" TagName="ErrorModule" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/CartAddressView.ascx" TagPrefix="cart" TagName="CartAddressView" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/AddressControl.ascx" TagPrefix="cart" TagName="AddressControl" %>

<div class="row C_Billing-Shipping-Addresses" id="ShippingRegion">
    <div class="span12">
       <cart:ErrorModule runat="server" id="ErrorModule" />
    </div>
	<div class="span12">
		<ul class="nav nav-pills">
			<li><a href="/Checkout/Multi-Shipment-Checkout/">Ship Items to Multiple Addresses</a></li>
		</ul>
		<div class="row">
			<div class="span6">
                <cart:CartAddressView ID="BillingAddressInfo" runat="server" IsBillingAddress="true" />
			</div>
			<div class="span6">
                <cart:CartAddressView ID="ShippingAddressInfo" runat="server" IsBillingAddress="false" />
			</div>
		</div>
		<hr />
	</div>
</div>
<div>
    <cart:ApplyCoupons ID="ApplyCouponsID" runat="server" />
</div>

<cart:LineItems ID="LineItemsID" runat="server" Editable="false" />

<div class="row C_Shipping-Selections" id="ShippingRegion">
	<div class="span12">
		<div class="well">
            <h4>
			    Choose Shipping Method for Your Items
		    </h4>
        </div>
		<asp:ListView ID="shippingOptions" runat="server" ItemPlaceholderID="itemPlaceHolder" GroupPlaceholderID="groupPlaceHolder" GroupItemCount="3">
			<EmptyDataTemplate>
                <asp:Literal ID="litMessage" runat="server" Text="No Shipping Methods Setup"/>
            </EmptyDataTemplate>
			<LayoutTemplate>
				<div class="row">
					<asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
				</div>
			</LayoutTemplate>
			<GroupTemplate>
				<asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
			</GroupTemplate>
			<ItemTemplate>
				<div class="span4">
					<label class="radio"> 
						<med:GlobalRadioButton GroupName="ChooseShipping" runat="server" ID="rdoChooseShipping" AutoPostBack="true" OnCheckedChanged="ChooseShipping_OnChange"  />
						<%# Eval("ShippingName") %>
					</label> 
					<p>
						<%# Eval("Description") %>
					</p>
					<input type="hidden" id="hiddenShippingId" runat="server" value='<%# Eval("ShippingMethodId") %>' />
				</div>
			</ItemTemplate>
		</asp:ListView>
		<hr />
	</div>
</div>

<checkout:PaymentOptions ID="PaymentOptionsID" runat="server" />


<cart:OrderSubtotal ID="OrderSubtotalID" runat="server" />

<div class="row C_Complete-Order">
	<div class="span8">
		&nbsp;
	</div>
	<div class="span2">
		<p>
			<asp:LinkButton ID="CancelButton" runat="server" CssClass="btn btn-primary" OnClick="Cancel_Click" UseSubmitBehavior="false" Text="Cancel"></asp:LinkButton>
		</p>
	</div>
	<div class="span2">
		<p>
			<asp:LinkButton ID="CheckoutButton" runat="server" CssClass="btn btn-primary" Text="Place Order" UseSubmitBehavior="true" OnClick="Order_Click"></asp:LinkButton>
		</p>
	</div>
</div>

<cart:AddressControl ID="Addresses" runat="server"></cart:AddressControl>
