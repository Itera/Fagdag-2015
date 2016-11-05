<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartSimpleModule.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.CartSimpleModule" %>
<%@ Register Src="SharedModules/EntryQuantityControl.ascx" TagName="EntryQuantityControl" TagPrefix="cart" %>
<%@ Register Src="SharedModules/LineItemsSimpleView.ascx" TagName="LineItems" TagPrefix="cart" %>
<%@ Register Src="SharedModules/OrderSubtotalSimpleView.ascx" TagName="OrderSubtotal" TagPrefix="cart" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/ApplyCoupons.ascx" TagName="ApplyCoupons" TagPrefix="cart" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>

<cart:ApplyCoupons ID="ApplyCouponsID" runat="server"></cart:ApplyCoupons>
<cart:LineItems ID="LineItemsID" runat="server" Editable="true"></cart:LineItems>
<div id="cartDetails" runat="server">
	<cart:OrderSubtotal ID="OrderSubtotalID" runat="server"></cart:OrderSubtotal>

	<div class="row C_Proceed-to-Checkout">
		<div class="span8">
			&nbsp;
		</div>
		<div class="span2">
			<p>
				<asp:LinkButton ID="ContinueButton" runat="server" CssClass="btn btn-primary" OnClick="ContinueButton_Click" Text="Continue Shopping" />
			</p>
		</div>
		<div class="span2">
			<p>
				<asp:LinkButton ID="goToCheckout" runat="server" CssClass="btn btn-primary" Text="Proceed to Checkout" UseSubmitBehavior="true" OnClick="CheckoutButton_Click" />
			</p>
		</div>
	</div>
</div>
