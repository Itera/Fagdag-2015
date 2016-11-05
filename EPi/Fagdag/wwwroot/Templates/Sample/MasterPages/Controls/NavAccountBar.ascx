<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="NavAccountBar.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.MasterPages.Controls.NavAccountBar" EnableViewState="false" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<nav class="account-bar">
            <asp:LoginView ID="LoginView" runat="server" EnableViewState="false">
                <AnonymousTemplate>
                        Log In
                        <span class="caret"></span>
                </AnonymousTemplate>
                <LoggedInTemplate>
                        <%=WebStringHelper.EncodeForWebString(Mediachase.Commerce.Customers.CustomerContext.Current.CurrentContactName) %>
                        <span class="caret"></span>
                </LoggedInTemplate>
            </asp:LoginView>
</nav>
