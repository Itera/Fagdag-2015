<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="RelatedProducts.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.SharedModules.RelatedProducts" %>
<%@ Register Src="SimpleProductInfo.ascx" TagName="SimpleProductInfo" TagPrefix="product" %>

<asp:Repeater runat="server" ID="RelatedProductsRepeater">
    <HeaderTemplate>
        <ul class="thumbnails">
    </HeaderTemplate>
    <ItemTemplate>
        <li class="span2">
            <product:SimpleProductInfo runat="server" CurrentData="<%# Container.DataItem as EPiServer.Commerce.Catalog.ContentTypes.EntryContentBase %>" />
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>

