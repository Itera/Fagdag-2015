<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YourOrders.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.YourOrders" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>
<div class="row C_Your-Account-Control">
    <div class="span3">
        <CMSNav:SideNav ID="SideNav" runat="server" />
    </div>
    <div class="span9">
        <h3>Available Orders
        </h3>
        <asp:DropDownList runat="server" ID="ddlAvailableOrders" OnSelectedIndexChanged="ddlAvailableOrders_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Value="30" Text="Orders placed in the last 30 days" />
            <asp:ListItem Value="90" Text="Orders placed in the last 90 days" />
            <asp:ListItem Value="180" Text="Orders placed in the last 6 months" />
            <asp:ListItem Value="365" Text="Orders placed in the last 12 months" />
            <asp:ListItem Value="545" Text="Orders placed in the last 18 months" />
        </asp:DropDownList>

        <div>
            <asp:Literal runat="server" ID="noOrderMsg" Visible="false" Text="No Orders Yet" />
            <asp:Repeater EnableViewState="False" runat="server" ID="rptOrderList">
                <HeaderTemplate>
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                            <tr>
                                <th>Order Number</th>
                                <th>Orders Date</th>
                                <th>Billing Address</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href="/self-service/order-detail?po=<%# ((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).OrderGroupId %>"><%# ((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).TrackingNumber %> </a></td>
                        <td>
                            <%# ((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).Created.ToShortDateString() %>
                        </td>
                        <td>
                            <%# GetBillingAddressFullNameHtmlEncoded((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem) %>
                        </td>
                        <td style="text-align: right">
                            <%# new Mediachase.Commerce.Money(((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).Total, new Mediachase.Commerce.Currency(((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).BillingCurrency)).ToString()%>
                        </td>
                        <td>
                            <%# ((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).Status %>
                        </td>
                        <td>
                            <a class="btn btn-small btn-info" href="/self-service/order-detail?po=<%# ((Mediachase.Commerce.Orders.PurchaseOrder) Container.DataItem).OrderGroupId %>"><i class="icon-list-alt icon-white"></i> Details</a>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
