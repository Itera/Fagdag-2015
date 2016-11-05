<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail.PaymentInfo" %>

<div class="span12">
    <div class="well">
        <h4>Payment information
        </h4>
        <br />
        <asp:Repeater runat="server" ID="rptPayments">
            <HeaderTemplate>
                <strong><%= Header %></strong>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <%# Eval("PaymentMethodName").ToString() %> (<%# Eval("Status") %>)
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> 
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
