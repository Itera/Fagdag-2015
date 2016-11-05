<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LineItemsSimpleView.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.LineItemsSimpleView" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>
<%@ Import Namespace="EPiServer.Commerce.Sample" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<asp:ListView Visible="true" ID="lvCartItems" EnableViewState="true" runat="server" ItemPlaceholderID="itemPlaceHolder" DataKeyNames="LineItemId,Quantity">
    <EmptyDataTemplate>
        <div class="row">
            <div class="span12">
                <h4>
                    You have no items in your shopping cart.
                </h4>
            </div>
        </div>
    </EmptyDataTemplate>
    <LayoutTemplate>
        <div class="C_Shipment">
            <div class="row C_Order-Items-List">
                <div class="span12">
                    <div class="well">
                        <h4>
                            Items In Your Cart/Being Ordered
                        </h4>
                    </div>
                    <div class="row C_Line-Items-Header text-right">
                        <asp:Panel runat="server" ID="InfoHeading">
                            <div class="span2">
                                &nbsp;
                            </div>
                            <div class="span3 text-left">
                                <strong>
                                    Product Name</strong>

                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="NameHeading">
                            <div class="span5 text-left">
                                <strong>
                                    <asp:Literal ID="Literal5" runat="server" Text="Product Name" /></strong>
                            </div>
                        </asp:Panel>
                        <div class="span1">
                            <strong>
                                <asp:Literal ID="Literal1" runat="server" Text="List Price" /></strong>
                        </div>
                        <div class="span2">
                            <strong>
                                <asp:Literal ID="Literal2" runat="server" Text="Your Price" /></strong>

                        </div>
                        <div class="span2">
                            <strong>
                                <asp:Literal ID="Literal3" runat="server" Text="Quantity" /></strong>
                        </div>
                        <div class="span2">
                            <strong>
                                <asp:Literal ID="Literal4" runat="server" Text="Total" /></strong>
                        </div>
                    </div>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </LayoutTemplate>
    <ItemTemplate>
        <div class="row C_Line-Item">
            <div class="span12">
                <div class="row C_Line-Item-Pricing text-right">
                    <asp:Panel runat="server" ID="InfoPanel">
                        <div class="span2 C_Actions text-left">
                            <div class="btn-group">
                                <a data-toggle="modal" href='<%# "#mymodal" + Container.DataItemIndex%>' class="btn btn-success">
                                    <i class="icon-info-sign icon-white"></i>
                                    View Info
                                </a>

                                <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <asp:LinkButton runat="server" ID="UpdateCart" ToolTip='' CommandName="Edit" CausesValidation="false"><i class="icon-edit"></i> Edit</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton runat="server" ID="RemoveItem" ToolTip='' CommandName="Delete" CausesValidation="false"><i class="icon-trash"></i> Remove</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton runat="server" ID="WishList" ToolTip='' CommandName="Wishlist" CausesValidation="false"><i class="icon-cog"></i> Add to Wish List</asp:LinkButton></li>
                                </ul>
                            </div>
                        </div>

                        <div class="span3 text-left">
                            <h6>
                                <a href="<%# ((LineItem)Container.DataItem).GetEntryLink()%>" target="_blank"><%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).DisplayName) %></a>
                            </h6>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="NamePanel">
                        <div class="span5 text-left">
                            <h6>
                                <a href="<%# ((LineItem)Container.DataItem).GetEntryLink()%>" target="_blank"><%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).DisplayName) %></a>
                            </h6>
                        </div>

                    </asp:Panel>
                    <div class="span1">
                        <strike>
                            <asp:Literal id="ListPrice" runat="server"></asp:Literal>
                        </strike>
                    </div>
                    <div class="span2">
                        <asp:Literal ID="YourPrice" runat="server"></asp:Literal>
                    </div>
                    <div class="span2">
                        <%# ((decimal)Eval("Quantity")).ToString("f0") %>
                        <br />
                        <asp:Literal ID="WarehouseName" runat="server"></asp:Literal>
                    </div>
                    <div class="span2">
                        <strong>
                            <asp:Literal ID="ExtendedPrice" runat="server"></asp:Literal>
                        </strong>
                    </div>
                </div>
                <div id="divItemLevelDiscount" runat="server" class="row C_Line-Item-Discounts-Savings">
                    <div class="span2">
                        &nbsp;
                    </div>
                    <div class="span6 text-right">
                        <hr />
                        <strong>Item Level Discounts Applied </strong>
                        <p class="discount-text">
                            <asp:Literal ID="itemDiscounts" runat="server" />
                        </p>
                    </div>
                    <div class="span3">
                        <hr />
                        YOU SAVE : 
                        <strong>
                            <asp:Literal ID="DiscountAmount" runat="server" />
                        </strong>
                    </div>
                </div>
            </div>
        </div>
        <div id='<%# "mymodal" + Container.DataItemIndex%>' class="modal hide fade">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">&times;</a>
                <h3>
                    Item Details
                </h3>
            </div>
            <div class="modal-body">
                <h4>
                    <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).DisplayName) %>
                </h4>
                <hr />
                <div class="thumbnail">
                    <a href="#">
                        <img src='<%# GetItemImage((LineItem)Container.DataItem)  %>' alt="dx" />
                    </a>
                </div>
                Brand:  <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetProductMetaFieldValueFromLineItem("Facet_Brand"))%>
                <br />
                Model: <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetProductMetaFieldValueFromLineItem("Info_ModelNumber"))%>
                <br />
                SKU:  <%# Eval("CatalogEntryId").ToString() %>
                <br />
                Size:  <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetSkuMetaFieldValueFromLineItem("Facet_Size"))%>
                <br />
                Color:  <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetSkuMetaFieldValueFromLineItem("Facet_Color"))%>
                <br />
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">Close</a>
            </div>
        </div>
        <hr>
    </ItemTemplate>
    <EditItemTemplate>
        <div class="row C_Line-Item">
            <div class="span12">
                <div class="row C_Line-Item-Pricing text-right">
                    <div class="span2 C_Actions text-left">
                        <asp:LinkButton ID="UpdateCart" runat="server" CommandName="Update" CausesValidation="false" CssClass="btn btn-success">
                            <i class="icon-ok icon-white"></i> Update
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="linkCancel" CommandName="Cancel" CausesValidation="false" CssClass="btn"><i class="icon-remove"></i> Cancel</asp:LinkButton></li>
                        
                    </div>
                    <div class="span3 text-left">
                        <h6>
                            <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).DisplayName) %>
                        </h6>
                    </div>
                    <div class="span2">
                        <strike>
                            <asp:Literal id="ListPrice" runat="server"></asp:Literal>
                        </strike>
                    </div>
                    <div class="span2">
                        <asp:Literal ID="YourPrice" runat="server"></asp:Literal>
                    </div>
                    <div class="span1">
                        <asp:TextBox Style="text-align: right" Width="30" ID="Quantity" runat="server" Text='<%# ((decimal)Eval("Quantity")).ToString("f0") %>'></asp:TextBox>
                        <asp:RangeValidator ID="valRange" runat="server" ErrorMessage="<%$ Resources:EPiServer, Sample.Validation.InvalidNumberMessage %>" MinimumValue="1" MaximumValue="100" ControlToValidate="Quantity" Display="Dynamic" EnableClientScript="true" Type="Integer"></asp:RangeValidator>
                    </div>
                    <div class="span2">
                        <strong>
                            <asp:Literal ID="ExtendedPrice" runat="server" />
                        </strong>
                    </div>
                </div>
                <div id="divItemLevelDiscount" runat="server" class="row C_Line-Item-Discounts-Savings">
                    <div class="span2">
                        &nbsp;
                    </div>
                    <div class="span6 text-right">
                        <hr />
                        <strong>Item Level Discounts Applied </strong>
                        <p class="discount-text">
                            <asp:Literal ID="itemDiscounts" runat="server" />
                        </p>
                    </div>
                    <div class="span3">
                        <hr />
                        YOU SAVE : 
                        <strong>
                            <asp:Literal ID="DiscountAmount" runat="server" />
                        </strong>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </EditItemTemplate>
</asp:ListView>
