<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplyCoupons.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.ApplyCoupons" %>
<%@ Register Src="~/Templates/Sample/Units/CartCheckout/SharedModules/ErrorModalModule.ascx" TagPrefix="cart" TagName="ErrorModalModule" %>

<div class="row C_Coupon-Discount-Center">
    <div class="span6">
            <h4>
                Coupons and Promotional Codes
            </h4>
            <i>Got a Coupon Code? Enter it and We Will Apply that to your cart as well.</i>
            <br />
            <asp:TextBox MaxLength="20" runat="server" ID="DiscountCouponCode"></asp:TextBox>
            &nbsp;
        <asp:Button CssClass="small black nice button" UseSubmitBehavior="true" runat="server" ID="ApplyCouponButton" Width="65px" OnClick="ApplyCouponButton_Click" Text="Apply" />
            <cart:ErrorModalModule runat="server" id="ErrorModalModule" />
            <asp:ListView ID="lvDiscount" runat="server" DataKeyNames="DiscountId" ItemPlaceholderID="itemPlaceHolder" OnItemCommand="lvDiscount_ItemCommand">
                <LayoutTemplate>
                    <h4>
                        Coupons have been applied:
                    </h4>
                    <ul>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li><%# Eval("DiscountCode") %> <asp:LinkButton ID="removeDiscount" runat="server" Text="Remove" CommandName="DeleteCoupon" CommandArgument='<%# Eval("DiscountCode")%>' /></li>                    
                </ItemTemplate>
            </asp:ListView>
    </div>
</div>
