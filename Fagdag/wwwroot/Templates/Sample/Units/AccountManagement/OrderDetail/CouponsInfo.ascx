﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CouponsInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.CouponsInfo" %>

<div class="row C_Coupon-Discount-Center">
    <div class="span9">
        <asp:ListView ID="lvDiscount" runat="server" DataKeyNames="DiscountId" ItemPlaceholderID="itemPlaceHolder">
            <LayoutTemplate>
                <div class="well">
                    <h4>
                        Coupons and Promotional Codes</h4> 
                </div>
                <ul>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li><%# Eval("DiscountCode") %>: <%# Eval("DisplayMessage") %></li>
            </ItemTemplate>
        </asp:ListView>
    </div>
</div>