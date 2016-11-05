<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingMethodInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.ShippingMethodInfo" %>

<div class="span12">
    <div class="well">
        <h4>Shipping Method
        </h4>
        <br />
        <strong>1 package via: </strong>
        <br />
              <asp:Literal ID="ShippingMethod" runat="server" />
        <br />
    </div>
</div>
