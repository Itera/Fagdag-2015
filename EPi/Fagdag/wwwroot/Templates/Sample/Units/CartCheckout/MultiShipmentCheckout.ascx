<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiShipmentCheckout.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.MultiShipmentCheckout" %>
<%@ Register Src="SharedModules/OrderSubtotalSimpleView.ascx" TagName="OrderSubtotal" TagPrefix="cart" %>
<%@ Register Src="SharedModules/PaymentOptions.ascx" TagName="PaymentOptions" TagPrefix="checkout" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/ApplyCoupons.ascx" TagName="ApplyCoupons" TagPrefix="cart" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/ErrorModalModule.ascx" TagPrefix="cart" TagName="ErrorModalModule" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/SplitShipmentControl.ascx" TagPrefix="cart" TagName="SplitShipmentControl" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/CartAddressView.ascx" TagPrefix="cart" TagName="CartAddressView" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/AddressControl.ascx" TagPrefix="cart" TagName="AddressControl" %>

<div class="row C_Billing-Shipping-Addresses">
    <div class="span6">
        <cart:ErrorModalModule runat="server" id="ErrorModalModule" />
    </div>
    <div class="span12">
        <ul class="nav nav-pills">
            <li class="active"><a href="/Checkout/Single-Shipment-Checkout/">Ship Items to One Address</a> </li>
        </ul>
        <div class="row">
            <div class="span6">
                <cart:CartAddressView ID="BillingAddressInfo" runat="server" IsBillingAddress="true"></cart:CartAddressView>
            </div>
            <div class="span6 ">
                <div class="well">
                    <cart:ApplyCoupons ID="ApplyCouponsID" runat="server"></cart:ApplyCoupons>
                </div>
            </div>
        </div>
        <hr />
    </div>
</div>

<asp:ListView runat="server" ID="lvSplitShipment">
    <LayoutTemplate>
        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
    </LayoutTemplate>
    <ItemTemplate>
        <fieldset>
            <legend>
                <strong>Split Shipment Part <%# Container.DataItemIndex + 1 %></strong>
            </legend>
            <cart:SplitShipmentControl runat="server" ID="SplitShipmentControlID" SplitShipment="<%# (Mediachase.Commerce.Orders.Shipment)Container.DataItem %>" />
        </fieldset>
    </ItemTemplate>
</asp:ListView>

<checkout:PaymentOptions ID="PaymentOptionsID" runat="server"></checkout:PaymentOptions>

<cart:OrderSubtotal ID="OrderSubtotal1" runat="server"></cart:OrderSubtotal>
<div class="row C_Complete-Order">
    <div class="span8">
        &nbsp;
    </div>
    <div class="span2">
        <p>
            <asp:LinkButton ID="CancelButton" runat="server" CssClass="btn btn-primary" OnClick="Cancel_Click" UseSubmitBehavior="false" Text="Cancel" />
        </p>
    </div>
    <div class="span2">
        <p>
            <asp:LinkButton ID="goToCheckout" runat="server" CssClass="btn btn-primary" Text="Place Order" UseSubmitBehavior="true" OnClick="Order_Click"></asp:LinkButton>
        </p>
    </div>
</div>

<cart:AddressControl ID="Addresses" runat="server"></cart:AddressControl>