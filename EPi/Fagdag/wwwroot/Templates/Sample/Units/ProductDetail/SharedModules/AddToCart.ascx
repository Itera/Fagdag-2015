<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.SharedModules.AddToCart" %>


<asp:TextBox ID="txtQuantity" CssClass="span1 text-right" runat="server" Text="1" MaxLength="9"></asp:TextBox>
<asp:RegularExpressionValidator ID="valRange" runat="server" ErrorMessage="Must enter a valid number" ControlToValidate ="txtQuantity" ValidationExpression = "\d+"></asp:RegularExpressionValidator>
<div class="btn-group">
        <asp:LinkButton ID="btnBuy" runat="server" OnClick="BuyButton_Click" Text="Add To Cart" CssClass="btn btn-success">
        <i class="icon-shopping-cart icon-white"></i>
        Add to Cart
    </asp:LinkButton>  
        
    <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
    <ul class="dropdown-menu">
        <li><asp:LinkButton  ID="btnWishList" OnClick="WishListButton_Click" runat="server"><i class="icon-cog"></i>Add to Wish List</asp:LinkButton></li>
        <li><a href="#"><i class="icon-cog"></i>Post to Facebook</a></li>
        <li><a href="#"><i class="icon-cog"></i>Post to Twitter</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-gift"></i>Create Custom Gift Card</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-envelope"></i>eMail Share</a></li>
    </ul>
</div>
<div class="alert alert-error" style="margin-top:10px; display: none" ID="divErrorMsg" runat="server">
    <span><asp:Literal ID="ErrorMessage" runat="server"></asp:Literal></span>
</div>