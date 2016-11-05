<%@ Control Language="C#" AutoEventWireup="True" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.OrderSubtotalSimpleInfo" CodeBehind="OrderSubtotalSimpleInfo.ascx.cs" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>

<div class="span9">
    <div class="row C_Order-Summary-Calculation">
        <div>
            <div class="well" style="width:832px">
                <h4>
                    Cart/Order Summary
                </h4>
            </div>
            <div class="row C_SubTotal-Items text-right">
                <div class="span3">
                    &nbsp;
                </div>
                <div class="span4">
                    <h5>
                        Sub Total For Your Cart/Order
                    </h5>
                </div>
                <div class="span2">
                    <strong>
                        <asp:Literal ID="SubTotal" runat="server" /></strong>
                    </strong>
                    (exc. Tax)
                </div>
            </div>
            <div class="row C_Separator">
                <div class="span3">
                    &nbsp;
                </div>
                <div class="span6">
                    <hr>
                </div>
            </div>
            <div class="row C_Order-Level-Discounts-Title text-right">
                <div class="span3">
                    &nbsp;
                </div>
                <div class="span4">
                    <h5>
                        Shipping &amp; Handling
                    </h5>
                </div>
                <div class="span2">
                    <strong>
                        <asp:Literal ID="ShippingTotal" runat="server" /></strong>
                    (exc. Tax and Discounts)
                </div>
            </div>
            <div class="row C_Separator">
                <div class="span3">
                    &nbsp; 
                </div>
                <div class="span6">
                    <hr>
                </div>
            </div>
            <div class="row C_Shipping-Discounts-Title text-right">
			<div class="span3">
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
			<div class="span3">
				&nbsp;
			</div>
			<div class="span4">
                <p class="discount-text">
					<asp:Literal ID="ShippingDiscountsMessage" runat="server" />
				</p>
			</div>
			<div class="span2">
                <strong>
                    <asp:Literal ID="ShippingDiscount" runat="server" />
				</strong>
            </div>
        </div>
            <div class="row C_Separator">
                <div class="span3">
                    &nbsp; 
                </div>
                <div class="span6">
                    <hr>
                </div>
            </div>
            <div class="row C_Shipping-Tax text-right">
                <div class="span3">
                    &nbsp; 
                </div>
                <div class="span4">
                    <h5>
                        Taxes
                    </h5>
                </div>
                <div class="span2">
                    <strong>
                        <asp:Literal ID="Taxes" runat="server" />
                    </strong>
                </div>
            </div>

            <div class="row C_Separator">
                <div class="span3">
                    &nbsp; 
                </div>
                <div class="span6">
                    <hr>
                </div>
            </div>
             <div class="row C_SubTotal-Items text-right">
                <div class="span3">
                    &nbsp; 
                </div>
                <div class="span4">
                    <h4>
                        Total
                    </h4>
                </div>
                <div class="span2">
                    <h4>
                        <asp:Literal ID="Total" runat="server" />
                    </h4>
                </div>
            </div>
            <div class="row C_Separator">
                <div class="span3">
                    &nbsp; 
                </div>
                <div class="span6">
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>
