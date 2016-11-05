<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagingMenu.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.Navigation.PagingMenu" %>
<ul>
    <li <%# PageIndex > 1 ? "" : "class=\"disabled\"" %>>
        <asp:HyperLink runat="server" NavigateUrl="<%# GetPreviousPageUrl() %>"
            Enabled="<%# PageIndex > 1 %>">
            ←
        </asp:HyperLink>
    </li>
    <li class="disabled"><a href="#">
        <%# FirstItemIndex + 1 %>
        -
        <%# Math.Min(FirstItemIndex + (PageSize < TotalItems ? PageSize : TotalItems), TotalItems) %>
        of
        <%# TotalItems %></a></li>
    <li>
        <asp:HyperLink runat="server" NavigateUrl="<%# GetViewAllUrl(TotalItems) %>">View All (<%# TotalItems %>)</asp:HyperLink>
    </li>
    <li <%# PageIndex < MaxPageIndex ? "" : "class=\"disabled\"" %>>
        <asp:HyperLink runat="server" NavigateUrl="<%# GetNextPageUrl() %>"
            Enabled="<%#  PageIndex < MaxPageIndex %>">
            →
        </asp:HyperLink>
    </li>
</ul>