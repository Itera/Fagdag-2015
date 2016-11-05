<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderDetailsSingleShipment.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetailsSingleShipment" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/LineItemsSimpleInfo.ascx" TagPrefix="Sample" TagName="LineItemsSimpleInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/OrderSubtotalSimpleInfo.ascx" TagPrefix="Sample" TagName="OrderSubtotalSimpleInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/OrderAddressInfo.ascx" TagPrefix="Sample" TagName="OrderAddressInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/PaymentInfo.ascx" TagPrefix="Sample" TagName="PaymentInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/ShippingMethodInfo.ascx" TagPrefix="Sample" TagName="ShippingMethodInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/CouponsInfo.ascx" TagPrefix="Sample" TagName="CouponsInfo" %>


<div class="row C_Your-Account-Control">
    <div class="span3">
        <CMSNav:sidenav id="SideNav" runat="server" />
    </div>
    <div class="span9">
        <asp:Label ID="InvalidOrder" Visible="false" runat="server">
            The order ID is invalid.
        </asp:Label>
        <asp:PlaceHolder ID="OrderDetailContent" runat="server">
            <div class="row">
                <div class="span6" style="width: 419px">
                    <div class="well">
                        <p>
                            <strong>Bill To:</strong>
                            <Sample:OrderAddressInfo runat="server" id="BillAddressInfo" />
                        </p>
                    </div>
                </div>
                <div class="span6" style="width: 419px">
                    <div class="well">
                        <p>
                            <strong>Ship To:</strong>
                            <Sample:OrderAddressInfo runat="server" id="ShipAddressInfo" />
                        </p>
                    </div>
                </div>
            </div>
            <Sample:CouponsInfo runat="server" id="CouponsInfoID" />
            <Sample:LineItemsSimpleInfo runat="server" id="LineItemsSimpleInfoID" />
             <div class="row-fluid">
                 <Sample:ShippingMethodInfo runat="server" id="ShippingMethodInfoID" />
            </div>
            <div class="row-fluid">
                <Sample:PaymentInfo runat="server" id="PaymentInfoID" />
            </div>

            <Sample:OrderSubtotalSimpleInfo runat="server" id="OrderSubtotalSimpleInfoID" />
            <div class="">
                <div class="span2">
                    <a class="btn btn-small btn-info" href="/self-service/your-orders/">Back</a>
                </div>
                <br />
            </div>

        </asp:PlaceHolder>
    </div>
</div>
