<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiShipmentOrderSubTotal.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.MultiShipmentOrderSubTotal" %>

<%@ Import Namespace="Mediachase.Commerce.Orders" %>

<div class="row C_Order-Summary-Calculation">
    <div class="span5">
        <div class="well">
            <h4>
                Summary
            </h4>
        </div>
        <div class="row C_SubTotal-Items text-right">

            <div class="span3">
                <h5>
                    Sub Total For Your Items
                </h5>
            </div>
            <div class="span2">
                <strong>
                    <asp:Literal ID="OrderSubTotalLineItems" runat="server" />
                </strong>
            </div>
        </div>
        <div class="row C_Separator">
            <div class="span5">
                <hr>
            </div>
        </div>

        <div class="row C_Shipping-Tax text-right">
            <div class="span3">
                <h5>
                    Shipping &amp; Tax
                </h5>
            </div>
            <div class="span2">
                &nbsp;
            </div>
        </div>
        <div class="row C_Estimated-Shipping-Tax text-right">
            <div class="span3">
                Estimated Shipping Costs
            </div>
            <div class="span2">
                <strong>
                    <asp:Literal ID="shippingTotal" runat="server" />
                </strong>
            </div>
        </div>
        <div class="row C_Separator">
            <div class="span5">
                <hr>
            </div>
        </div>
        <div class="row C_Shipping-Discounts-Title text-right">
			<div class="span3">
				<h5>
                    Additional Shipping Discounts
				</h5>
			</div>
			<div class="span2">
				&nbsp;
			</div>
		</div>
        <div class="row C_Shipping-Discounts text-right">
			<div class="span3">
                <p class="discount-text">
					<asp:Literal ID="ShippingDiscountsMessage" runat="server" />
				</p>
			</div>
			<div class="span2">
                <strong>
                    <asp:Literal ID="shippingDiscount" runat="server" />
				</strong>
            </div>
        </div>
        <div class="row C_Separator">
			<div class="span5">
				<hr /> 
			</div>
		</div>
    </div>
</div>