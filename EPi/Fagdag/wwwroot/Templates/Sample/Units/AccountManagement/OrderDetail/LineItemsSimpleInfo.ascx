<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LineItemsSimpleInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.LineItemsSimpleInfo" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>
<%@ Import Namespace="EPiServer.Commerce.Sample" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<asp:Repeater runat="server" ID="OrderShipment">
    <HeaderTemplate>
        <div class="C_Shipment">
            <div class="row C_Order-Items-List">
                <div class="span9">
                    <div class="well">
                        <h4>
                            List Items in order
                        </h4>
                    </div>
                    <div class="row C_Line-Items-Header text-right">

                        <div class="span4 text-left">
                            <strong>
                                Product Name
                            </strong>
                        </div>
                        <div class="span1">
                            <strong>
                                List Price
                            </strong>
                        </div>
                        <div class="span1">
                            <strong>
                                Discount
                            </strong>
                        </div>
                         <div class="span1">
                            <strong>
                                Your Price
                            </strong>
                        </div>
                        <div class="span1">
                            <strong>
                                Quantity
                            </strong>
                        </div>
                        <div class="span1">
                            <strong>
                                Total
                            </strong>
                        </div>
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="row C_Line-Item">
            <div class="span9">
                <hr />
                <div class="row C_Line-Item-Pricing text-right">
                    <div class="span4 text-left">
                        <h6>
                            <a href="<%# (Container.DataItem as LineItem).GetEntryLink() %>" target="_blank">
                                <strong>
                                    <%# WebStringHelper.EncodeForWebString((Container.DataItem as LineItem).DisplayName) %> 
                                </strong>
                            </a>
                        </h6>
                    </div>
                    <div class="span1">
                      <strike><asp:Literal runat="server" ID="ListPrice"></asp:Literal></strike>
                    </div>
                    <div class="span1">
                        <asp:Literal runat="server" ID="Discount"></asp:Literal>
                    </div>
                    <div class="span1">
                        <asp:Literal runat="server" ID="YourPrice"></asp:Literal>
                    </div>
                    <div class="span1">
                        <asp:Literal runat="server" ID="Quantity"></asp:Literal> <br/>
                        <asp:Literal id="WarehouseName" runat="server"></asp:Literal>
                    </div>
                    <div class="span1">
                        <strong>
                            <asp:Literal runat="server" ID="Total"></asp:Literal>
                        </strong>
                    </div>
                </div>                 
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
<hr />
<br />
