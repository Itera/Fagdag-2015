<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonModule.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.SharedModules.CommonModule" %>
<!-- Control For Sharing Bar-->
<%@ Register Src="ProductSocial/CommonProductSocial.ascx" TagName="ProductSocial" TagPrefix="product" %>
<!-- Controls in TABS-->
<%@ Register Src="RelatedProducts.ascx" TagName="ProductRelated" TagPrefix="product" %>

<div class="row C_Social-Bar">
    <div class="span12">
        <hr />
        <product:ProductSocial ID="ProductSocialID" runat="server" />
    </div>
</div>
<div class="row C_Product-Reviews-Upsells">
    <div class="span12">
        <hr />
        <div class="tabbable">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#1" data-toggle="tab">Related Products/Services</a></li>
                <li><a href="#2" data-toggle="tab">You May Also Like These Products</a></li>
                <li><a href="#3" data-toggle="tab">People Who Bought This Also Bought</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="1">
                    <product:ProductRelated runat="server" GroupName='<%# EPiServer.Commerce.Sample.Constants.DefaultGroupName %>' />
                </div>
                <div class="tab-pane" id="2">
                    <product:ProductRelated runat="server" GroupName='<%# EPiServer.Commerce.Sample.Constants.UpSellGroupName %>' />
                </div>
                <div class="tab-pane" id="3">
                    <product:ProductRelated runat="server" GroupName='<%# EPiServer.Commerce.Sample.Constants.CrossSellGroupName %>' />
                </div>
            </div>
        </div>
    </div>
</div>
