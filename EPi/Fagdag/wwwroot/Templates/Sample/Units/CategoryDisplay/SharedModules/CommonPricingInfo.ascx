<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonPricingInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CategoryDisplay.SharedModules.CommonPricingInfo" %>
<ul class="unstyled">
    <li>List Price:
        <asp:Literal ID="ListPrice" runat="server" Text="Not available" /></li>
    <li>Discount Pricing:
        <asp:Literal ID="DiscountPricing" runat="server" Text="Not available" /></li>
    <li>You Save:  <strong>
        <asp:Literal ID="DiscountAmount" runat="server" Text="Not available" /></strong></li>
</ul>