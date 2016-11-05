<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethod.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.PayByCreditCard" %>
<h4>
    Credit Card Information
</h4>
<br />
<br />
<asp:Textbox ID="CreditCardNumber" runat="server" CssClass="medium input-text" placeholder="Credit Card Number"></asp:Textbox>
<asp:Textbox ID="SecurityCode" runat="server" CssClass="medium input-text" placeholder="Security Code"></asp:Textbox><br />
<h5>Expires</h5>
<asp:DropDownList ID = "creditCardMonth" runat="server">
    <asp:ListItem Text="Month" Value="0"></asp:ListItem>
    <asp:ListItem Text="1" Value="1"></asp:ListItem>
    <asp:ListItem Text="2" Value="2"></asp:ListItem>
    <asp:ListItem Text="3" Value="3"></asp:ListItem>
    <asp:ListItem Text="4" Value="4"></asp:ListItem>
    <asp:ListItem Text="5" Value="5"></asp:ListItem>
    <asp:ListItem Text="6" Value="6"></asp:ListItem>
    <asp:ListItem Text="7" Value="7"></asp:ListItem>
    <asp:ListItem Text="8" Value="8"></asp:ListItem>
    <asp:ListItem Text="9" Value="9"></asp:ListItem>
    <asp:ListItem Text="10" Value="10"></asp:ListItem>
    <asp:ListItem Text="11" Value="11"></asp:ListItem>
    <asp:ListItem Text="12" Value="12"></asp:ListItem>
</asp:DropDownList>
<asp:DropDownList ID = "creditCardYear" runat="server">
</asp:DropDownList>


