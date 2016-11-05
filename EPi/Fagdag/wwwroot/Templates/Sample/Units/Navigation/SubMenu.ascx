<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubMenu.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.Navigation.SubMenu" %>
<EPiServer:PageTree EvaluateHasChildren="true" PageLinkProperty="TeamPage" ID="PageTreeCtrl" runat="server">
    <HeaderTemplate>
        <!-- SubMenu START -->
        <div class="well" style="padding: 8px 0;">
            <ul class="nav nav-list">
                <li class="nav-header">
                    <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink1" runat="server" />
                </li>
    </HeaderTemplate>
    <IndentTemplate>
        <ul class="unstyled">
    </IndentTemplate>
    <ItemHeaderTemplate>
        <li>
    </ItemHeaderTemplate>
    <ItemTemplate>
        <i class="icon-user"></i>
        <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink2" runat="server" />
        <asp:PlaceHolder ID="SubMenuPlaceHolderCtrl1" runat="server" Visible="<%# Container.HasChildren %>">[+]</asp:PlaceHolder>
    </ItemTemplate>
    <ExpandedItemTemplate>
        <i class="icon-user"></i>
        <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink3" runat="server" />
        [-]
    </ExpandedItemTemplate>
    <SelectedItemTemplate>
        <i class="icon-user"></i>
        <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink4" runat="server" />
        <asp:PlaceHolder ID="SubMenuPlaceHolderCtrl2" runat="server" Visible="<%# Container.HasChildren %>">[-]</asp:PlaceHolder>
    </SelectedItemTemplate>
    <TopTemplate>
        <i class="icon-user"></i>
        <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink4" runat="server" />
    </TopTemplate>
    <SelectedTopTemplate>
        <i class="icon-user"></i>
        <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink5" runat="server" />
    </SelectedTopTemplate>
    <ExpandedTopTemplate>
        <i class="icon-user"></i>
        <EPiServer:Property PropertyName="PageLink" ID="SubMenuPropPageLink6" runat="server" />
    </ExpandedTopTemplate>
    <ItemFooterTemplate>
        </li>
    </ItemFooterTemplate>
    <UnindentTemplate>
        </ul>
    </UnindentTemplate>
    <FooterTemplate>
        </ul> </div>
        <!-- SubMenu END -->
    </FooterTemplate>
</EPiServer:PageTree>
