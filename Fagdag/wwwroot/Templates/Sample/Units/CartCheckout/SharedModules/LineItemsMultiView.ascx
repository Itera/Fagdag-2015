<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LineItemsMultiView.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.LineItemsMultiView" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>
<%@ Import Namespace="EPiServer.Commerce.Sample" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<asp:ListView Visible="true" ID="lvCartItems" EnableViewState="true" runat="server" ItemPlaceholderID="itemPlaceHolder" DataKeyNames="LineItemId,Quantity" >
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
                        <div class="span4 text-left">
                            <strong><asp:Literal runat="server" Text="Product Name" /></strong> 
 
                        </div>
                        <div class="span2">
                            <strong><asp:Literal ID="Literal1" runat="server" Text="List Price" /></strong> 
                        </div>
                        <div class="span2">
                            <strong><asp:Literal ID="Literal2" runat="server" Text="Your Price" /></strong> 
 
                        </div>
                        <div class="span1">
                            <strong><asp:Literal ID="Literal3" runat="server" Text="Quantity" /></strong> 
 
                        </div>
                        <div class="span3">
                            <strong><asp:Literal ID="Literal4" runat="server" Text="Total" /></strong>
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
                    <div class="span4 text-left">
                        <h6>
                            <a href="<%# ((LineItem)Container.DataItem).GetEntryLink()%>" target="_blank"><%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).DisplayName) %></a>
                        </h6>
                    </div>
                    <div class="span2">
                        <strike>
                            <asp:Literal id="ListPrice" runat="server"></asp:Literal>
                        </strike>
                    </div>
                    <div class="span2">
                        <asp:Literal id="YourPrice" runat="server"></asp:Literal>
                    </div>
                    <div class="span1">
                         <%# ((decimal)Eval("Quantity")).ToString("f0") %> <br />
                         <asp:Literal id="WarehouseName" runat="server" />
                    </div>
                    <div class="span3">
                        <strong>
                            <asp:Literal id="ExtendedPrice" runat="server" />
                        </strong> 
                    </div>
                </div>
                <div ID="divItemLevelDiscount" runat="server" class="row C_Line-Item-Discounts-Savings">
                    <div class="span2">
                        &nbsp;
                    </div>
                    <div class="span6 text-right">
                        <hr />
                        <strong> Item Level Discounts Applied </strong> 
                        <p class="discount-text">
                            <asp:Literal ID="itemDiscounts" runat="server" />
                        </p>
                    </div>
                    <div class="span3">
                        <hr />
                        YOU SAVE :  
                        <strong>
                            <asp:Literal id="DiscountAmount" runat="server" />
                        </strong>
                    </div>
                </div>
            </div>
        </div>
        <hr />
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
                        <asp:Literal id="YourPrice" runat="server"></asp:Literal>
                    </div>
                    <div class="span1">
                        <asp:TextBox style="text-align:right" Width="30"  ID="Quantity" runat="server" Text='<%# ((decimal)Eval("Quantity")).ToString("f0") %>' />
                        <asp:RangeValidator ID="valRange" runat="server" ErrorMessage="Must enter a valid number" MinimumValue="1" MaximumValue="100" ControlToValidate="Quantity" Display="Dynamic" EnableClientScript="true" Type="Integer"></asp:RangeValidator>
                    </div>
                    <div class="span2">
                        <strong>
                            <asp:Literal id="ExtendedPrice" runat="server" />
                        </strong> 
                    </div>
                </div>
                <div ID="divItemLevelDiscount" runat="server" class="row C_Line-Item-Discounts-Savings">
                    <div class="span2">
                        &nbsp;
                    </div>
                    <div class="span6 text-right">
                        <hr />
                        <strong> Item Level Discounts Applied </strong> 
                        <p class="discount-text">
                            <asp:Literal ID="itemDiscounts" runat="server" />
                        </p>
                    </div>
                    <div class="span3">
                        <hr />
                        YOU SAVE :  
                        <strong>
                            <asp:Literal id="DiscountAmount" runat="server" />
                        </strong>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </EditItemTemplate>
</asp:ListView>
