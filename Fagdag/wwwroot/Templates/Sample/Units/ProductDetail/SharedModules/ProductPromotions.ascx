<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPromotions.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.SharedModules.ProductPromotions" %>

<div>
  <asp:PlaceHolder runat="server" Visible="False" ID="PromotionsHolder">
        <strong>Promotions:</strong><br />
        <asp:Literal ID="Promotions" runat="server"></asp:Literal>
        <hr />                          
    </asp:PlaceHolder>
</div>