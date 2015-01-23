<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.Navigation.TopMenu" %>
<EPiServer:MenuList PageLink="<%# EPiServer.Core.PageReference.StartPage %>" ID="MenuListCtrl" runat="server">
    <HeaderTemplate>
        <!-- TopMenu START -->
        <div class="MenuHeader">
            <div class="navbar">
                <div class="navbar-inner">
                    <div class="container" style="width: auto;">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a>
                        <div class="nav-collapse">
                            <ul class="nav">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <EPiServer:Property PropertyName="PageLink" ID="TopMenuPropPageLink1" runat="server" />
        </li>
    </ItemTemplate>
    <SelectedTemplate>
        <li class="active">
            <EPiServer:Property PropertyName="PageLink" ID="TopMenuPropPageLink2" runat="server" />
        </li>
    </SelectedTemplate>
    
    <FooterTemplate>
        </ul>
        
        <!-- TopMenu END -->
    </FooterTemplate>
</EPiServer:MenuList>
<div class="navbar-search pull-right">
         <asp:Panel ID="Panel1" DefaultButton="SearchButton" runat="server">
                <asp:TextBox CssClass="search-query" placeholder="Search" ID="SearchKeywords" runat="server" />
                <asp:Button CssClass="btn btn-info" OnClick="PerformSearch" ID="SearchButton" Text="Search"  runat="server" />
        </asp:Panel>
</div>
