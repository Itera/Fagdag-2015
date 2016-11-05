<%@ Control Language="C#" AutoEventWireup="True" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.OrderSubtotalSimpleView" CodeBehind="OrderSubtotalSimpleView.ascx.cs" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>
<div class="row C_Order-Summary-Calculation">
	<div class="span12">
		<div class="well">
			<h4>
                Cart/Order Summary
			</h4>
		</div>
		<div class="row C_SubTotal-Items text-right">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span4">
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
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
		<div class="row C_Order-Level-Discounts-Title text-right">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span4">
				<h5>
                    Additional Order Level Discounts
				</h5>
			</div>
			<div class="span2">
				&nbsp;
			</div>
		</div>
		<div class="row C_order-Level-Discounts text-right">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span4">
				<p class="discount-text">
					<asp:Literal ID="OrderDiscountsMessage" runat="server" />
				</p>
			</div>
			<div class="span2">
                <strong>
                    <asp:Literal ID="OrderDiscount" runat="server" />
				</strong>
            </div>
		</div>
		<div class="row C_Separator">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
		<div class="row C_SubTotal-For-Cart-Order text-right">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span4">
				<h5>
                    Sub Total For Your Cart/Order
				</h5>
			</div>
			<div class="span2">
				<h5>
					<asp:Literal ID="OrderSubTotal" runat="server" />
                </h5>
            </div>
		</div>
        <div class="row C_Separator">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
		<div class="row C_Estimate-Tax-Shipping text-right" id="taxAndShipping" runat="server">
			<div class="span8">
				&nbsp; 
			</div>
			<div class="span4 text-left">
				<div class="well form-search">
                    Estimated Tax &amp; Shipping (For Cart)
					<br />
                    <asp:TextBox ID="EstimatorZip" runat="server" CssClass="small input-text" placeholder="Enter Zip Code" />
                    <asp:Button ID="estimateTaxShipping" runat="server" CssClass="btn" Text="Calculate" />
				</div>
			</div>
		</div>
		<div class="row C_Separator" id="taxSeperator" runat="server">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
		<div class="row C_Shipping-Tax text-right">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span4">
				<h5>
                    Shipping &amp; Tax
				</h5>
			</div>
			<div class="span2">
				&nbsp;
			</div>
		</div>
		<div class="row C_Estimated-Shipping-Tax text-right">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span4">
                Estimated Shipping Costs
			</div>
			<div class="span2">
				<strong>
                    <asp:Literal ID="shippingTotal" runat="server" />
				</strong>
            </div>
        </div>
        <div class="row C_Estimated-Tax text-right">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span4">
                Estimated Tax to Be Collected
			</div>
			<div class="span2">
                <strong>
                    <asp:Literal ID="TaxTotal" runat="server" />
				</strong>
            </div>
        </div>
        <div class="row C_Separator">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
        <div class="row C_Shipping-Discounts-Title text-right">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span4">
				<h5>
                    Additional Shipping Discounts
				</h5>
			</div>
			<div class="span2">
				&nbsp;
			</div>
		</div>
        <div class="row C_Shipping-Discounts text-right">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span4">
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
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
		<div class="row C_Total-for-Order text-right">
			<div class="span6">
				&nbsp; 
			</div>
			<div class="span4">
				<h4>
                    Total For Cart
				</h4>
			</div>
			<div class="span2">
				<h4>
					<asp:Literal ID="OrderTotal" runat="server" />
                </h4>
            </div>
        </div>
       <div class="row C_Separator">
			<div class="span6">
				&nbsp;
			</div>
			<div class="span6">
				<hr /> 
			</div>
		</div>
	</div>
</div>
