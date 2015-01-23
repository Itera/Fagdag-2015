<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonButtons.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CategoryDisplay.SharedModules.CommonButtons" %>

<div>
<ul class="dropdown-menu">
    <li><asp:LinkButton  ID="btnAddToCart" OnClick="AddToCart_Click" runat="server"><i class="icon-cog"></i> Add to Cart</asp:LinkButton></li>
    <li><asp:LinkButton  ID="btnAddWishList" OnClick="AddWishList_Click" runat="server"><i class="icon-cog"></i> Add to Wish List</asp:LinkButton></li>
    <li><a href="#"><i class="icon-cog"></i> Post to Facebook</a></li>
    <li><a href="#"><i class="icon-cog"></i> Post to Twitter</a></li>
    <li class="divider"></li>
    <li><a href="#"><i class="icon-gift"></i> Create Custom Gift Card</a></li>
    <li class="divider"></li>
    <li><a href="#"><i class="icon-envelope"></i> eMail Share</a></li>
</ul>
</div>