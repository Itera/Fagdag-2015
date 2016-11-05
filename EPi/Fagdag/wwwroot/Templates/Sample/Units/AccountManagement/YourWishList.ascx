<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YourWishList.ascx.cs"
    Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.YourWishList" %>
<%@ Import Namespace="EPiServer.Commerce.Sample" %>
<%@ Import Namespace="Mediachase.Commerce.Orders" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>
<div class="row C_Your-Account-Control">
    <div class="span3">
        <CMSNav:SideNav ID="SideNav" runat="server" />
    </div>
    <div class="span9">
        <asp:Literal ID="lblEmptyData" runat="server" Visible="false" Text="There are no items in Wish List." />
        <asp:Repeater ID="CartItemsList" runat="server">
            <HeaderTemplate>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>
                                Product Name
                            </th>
                            <th>
                                Unit Price
                            </th>
                            <th>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <a href="<%# ((LineItem)Container.DataItem).GetEntryLink()%>" target="_blank">
                            <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).DisplayName) %></a>
                    </td>
                    <td style="text-align: right">
                        <asp:Literal ID="YourPrice" runat="server"></asp:Literal><br />
                        <strike>
                            <asp:Literal ID="ListPrice" runat="server"></asp:Literal></strike>
                    </td>
                    <td width="140px">
                        <div class="btn-group btn-small">
                            <a class="btn btn-info btn-small" data-toggle="modal" href='<%# "#mymodal" + Container.ItemIndex%>'>
                                <i class="icon-list-alt icon-white"></i>
                                View Info</a> <a class="btn btn-info dropdown-toggle"
                                    data-toggle="dropdown" href="#"><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <asp:LinkButton runat="server" ID="AddCartLink" CommandName="AddToCart" CommandArgument='<%# ((LineItem)Container.DataItem).LineItemId%>'
                                        CausesValidation="false"><i class="icon-shopping-cart"></i> Add to Cart</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="RemoveLink" CommandName="Remove" CommandArgument='<%# ((LineItem)Container.DataItem).LineItemId%>'
                                        CausesValidation="false"><i class="icon-remove"></i> Remove</asp:LinkButton></li>
                                <li><a href="#"><i class="icon-cog"></i>
                                    Post to Facebook</a></li>
                                <li><a href="#"><i class="icon-cog"></i>
                                    Post to Twitter</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="icon-gift"></i>
                                    Create Custom Gift Card</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="icon-envelope"></i>
                                    eMail Share</a></li>
                            </ul>
                        </div>
                        <div id='<%# "mymodal" + Container.ItemIndex%>' class="modal hide fade">
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
                                Brand:
                                <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetProductMetaFieldValueFromLineItem("Facet_Brand"))%>
                                <br />
                                Model#:
                                <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetProductMetaFieldValueFromLineItem("Info_ModelNumber"))%>
                                <br />
                                SKU:
                                <%# ((LineItem)Container.DataItem).CatalogEntryId %>
                                -
                                <%# ((LineItem)Container.DataItem).ParentCatalogEntryId %>
                                -
                                <%# ((LineItem)Container.DataItem).Catalog %>
                                <br />
                                Size:
                                <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetSkuMetaFieldValueFromLineItem("Facet_Size"))%>
                                <br />
                                Color:
                                <%# WebStringHelper.EncodeForWebString(((LineItem)Container.DataItem).GetSkuMetaFieldValueFromLineItem("Facet_Color"))%>
                                <br />
                            </div>
                            <div class="modal-footer">
                                <a href="#" class="btn" data-dismiss="modal">
                                    Close</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody> </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
