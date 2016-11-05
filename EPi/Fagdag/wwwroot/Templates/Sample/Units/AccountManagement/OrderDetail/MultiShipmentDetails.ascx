<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiShipmentDetails.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.MultiShipmentDetails" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/MultiShipmentOrderSubTotal.ascx" TagPrefix="cart" TagName="OrderSubtotalMultiView" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/OrderAddressInfo.ascx" TagPrefix="Sample" TagName="ShipAddressInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/ShippingMethodInfo.ascx" TagPrefix="Sample" TagName="ShippingMethodInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/LineItemsSimpleInfo.ascx" TagPrefix="Sample" TagName="LineItemsSimpleInfo" %>

<Sample:LineItemsSimpleInfo runat="server" id="LineItemsSimpleInfoID" />

<div class="row C_Billing-Shipping-Addresses">
    <div class="span9">
        <div class="row">
            <div class="span2">
                <div class="well">
                    <p>
                        <strong>Ship To:</strong>
                        <Sample:ShipAddressInfo runat="server" id="ShipAddressInfo" />
                    </p>
                </div>
            </div>
             <div class="span2">
                 <div class="row-fluid">
                    <Sample:ShippingMethodInfo runat="server" id="ShippingMethodInfoID" />
                 </div>
            </div>
            <div class="span5">
                <cart:OrderSubtotalMultiView runat="server" id="OrderSubtotalID" />
            </div>
        </div>
    </div>
</div>
