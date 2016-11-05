<%@ Control Language="C#" AutoEventWireup="True" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.OrderSubtotalMultiView" CodeBehind="OrderSubtotalMultiView.ascx.cs" %>
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
                    <asp:Literal ID="OrderSubTotalLineItems" runat="server"></asp:Literal>
                </strong>
            </div>
        </div>
        <div class="row C_Separator">
            <div class="span5">
                <hr>
            </div>
        </div>
       
        <div class="row C_Estimate-Tax-Shipping text-right" id="taxAndShipping" runat="server">

            <div class="span6 text-left">
                <div class="well form-search">
                    Estimated Tax &amp; Shipping (For Cart)
                    <br />
                    <asp:TextBox ID="EstimatorZip" runat="server" CssClass="small input-text" placeholder="Enter Zip Code" />
                    <asp:Button ID="estimateTaxShipping" runat="server" CssClass="btn" Text="Calculate" />
                </div>
            </div>
        </div>
        <div class="row C_Separator" id="taxSeperator" runat="server">
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
