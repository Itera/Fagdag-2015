<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderDetailsMultiShipment.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetailsMultiShipment" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/OrderSubtotalSimpleInfo.ascx" TagPrefix="Sample" TagName="OrderSubtotalSimpleInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/OrderAddressInfo.ascx" TagPrefix="Sample" TagName="OrderAddressInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/PaymentInfo.ascx" TagPrefix="Sample" TagName="PaymentInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/CouponsInfo.ascx" TagPrefix="Sample" TagName="CouponsInfo" %>
<%@ Register Src="~/Templates/Sample/Units/AccountManagement/OrderDetail/MultiShipmentDetails.ascx" TagPrefix="Shippment" TagName="MultiShipmentDetails" %><%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/SplitShipmentControl.ascx" TagPrefix="cart" TagName="SplitShipmentControl" %>


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
            </div>

            <asp:ListView runat="server" ID="lvSplitShipment">
                <LayoutTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                     <fieldset>
                        <legend>
                          Shipment <%# Container.DataItemIndex + 1 %>
                        </legend>
                        <Shippment:MultiShipmentDetails runat="server" ID="SplitShipmentControlID" SplitShipment="<%# (Mediachase.Commerce.Orders.Shipment)Container.DataItem %>" />
                    </fieldset>
                </ItemTemplate>
            </asp:ListView>

            <Sample:CouponsInfo runat="server" id="CouponsInfoID" />
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
