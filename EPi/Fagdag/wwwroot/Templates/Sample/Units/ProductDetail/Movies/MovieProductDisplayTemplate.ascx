<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MovieProductDisplayTemplate.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.Movies.MovieProductDisplayTemplate" %>
<!-- Controls in Main Detail-->
<%@ Register Src="../SharedModules/ProductInfoPricing/CommonProductInfoPricing.ascx" TagName="ProductInfoPricing" TagPrefix="product" %>
<%@ Register Src="MovieProductItemSelector.ascx" TagName="ProductItemSelector" TagPrefix="product" %>
<%@ Register Src="../SharedModules/CommonModule.ascx" TagName="Common" TagPrefix="product" %>

<div class="row C_Page-Header">
    <div class="span12">
        <h1>
            <EPiServer:property runat="server" propertyname="DisplayName" />
        </h1>
        <h4>Short Copy to quickly Highlight the product from a marketing perspective or just drop this line completely. </h4>
        <hr />
    </div>
</div>
<div class="row C_Product-Detail">
    <div class="span3 C_Product-Images">
        <EPiServer:Property runat="server" ID="ProductImage" PropertyName="CommerceMediaCollection" CssClass="thumbnail"></EPiServer:Property>
        <hr />
    </div>
    <div class="span9">
        <div class="row">
            <div class="span6 C_Product-Detail">
                <product:ProductInfoPricing ID="ProductInfoPricingID" runat="server"></product:ProductInfoPricing>
            </div>
            <div class="span3 C_Product-ItemSelector">
                <product:ProductItemSelector ID="ProductItemSelectorID" runat="server"></product:ProductItemSelector>
            </div>
        </div>
    </div>
</div>
<product:Common ID="ProductCommonModule" runat="server"></product:Common>