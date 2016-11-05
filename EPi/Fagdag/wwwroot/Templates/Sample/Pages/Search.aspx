<%@ Page Language="c#" MasterPageFile="../MasterPages/StarterDemoDefault.Master" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Pages.Search" CodeBehind="Search.aspx.cs" %>

<%@ Import Namespace="Mediachase.Commerce.Catalog.Objects" %>
<%@ Import Namespace="Mediachase.Commerce.Website.Helpers" %>
<%@ Import Namespace="EPiServer.Commerce.Sample.Helpers" %>
<%@ Import Namespace="EPiServer.Commerce.Extensions" %>
<%@ Import Namespace="EPiServer.Globalization" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<%@ Register Src="~/Templates/Sample/Units/CategoryDisplay/SharedModules/CommonButtons.ascx" TagName="CommonButtons" TagPrefix="catalog" %>
<%@ Register Src="~/Templates/Sample/Units/CategoryDisplay/SharedModules/CommonPricingInfo.ascx" TagName="CommonPricingInfo" TagPrefix="catalog" %>
<%@ Register Src="~/Templates/Sample/Units/Navigation/PagingMenu.ascx" TagName="PagingMenu" TagPrefix="catalog" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="content" runat="server">
    <div class="row C_Page-header">
        <div class="span12">
            <h1>
                Keyword Search Example
            </h1>
            <h4>
                Enter a Keyword Search which will search across all of the catalogs you have loaded right now. Be sure and try to use slight mispellings or related words to test out the fuzzy search and replacement values.
            </h4>
            <hr>
        </div>
    </div>
    <div class="row C_Keyword-Search">
        <div class="span12">
            <h3>Search By Keyword(s)
            </h3>
            <div class="well">
                <div class="controls">
                    <asp:Panel ID="SearchPanel" DefaultButton="searchButton" runat="server" CssClass="form-search">
                        <asp:TextBox ID="search" placeholder="Enter Keyword(s)" CssClass="search-query span2" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;Type &nbsp;
                        <asp:DropDownList ID="ClassType" runat="server" CssClass="search-query span2" >
                            <asp:ListItem Selected="True" Value="All">All</asp:ListItem>
                            <asp:ListItem Value="Product">Only Products</asp:ListItem>
                            <asp:ListItem Value="Variation">Only Items</asp:ListItem>
                            <asp:ListItem Value="Bundle">Only Bundles</asp:ListItem>
                            <asp:ListItem Value="Package">Packages</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:Button ID="searchButton" CssClass="btn btn-info" runat="server" Text="Search" OnClick="Search_Click" />
                   </asp:Panel>
                </div>
            </div>
            <hr />
            <asp:PlaceHolder Visible="False" ID="SearchResultSummaryPlaceHolder" runat="server">
            <div class="row">
            <div class="span8 grayHead">
                <h2>Search Result</h2>
                <p>You search for&nbsp;<i><%: search.Text %></i> resulted in&nbsp;<asp:Literal ID="NumberOfHits" runat="server" />&nbsp;hits.</p>
            </div>
            </div>
            </asp:PlaceHolder>
            <hr/>
            <div class="pagination pagination-right" style="margin-top: 0;">
                    <asp:DataPager QueryStringField="p" ID="pagerTop" PageSize="20" runat="server" PagedControlID="searchResults">
                        <Fields>
                            <asp:TemplatePagerField>
                                <PagerTemplate>
                                    <catalog:PagingMenu runat="server" FirstItemIndex='<%# Container.StartRowIndex %>' PageSize='<%# Container.PageSize %>' TotalItems='<%# Container.TotalRowCount %>' />
                                </PagerTemplate>
                            </asp:TemplatePagerField>
                        </Fields>
                    </asp:DataPager>
                </div>
            <hr/>
            <asp:ListView ID="searchResults" runat="server" ItemPlaceholderID="itemPlaceHolder" DataKeyNames="CatalogEntryId">
                <LayoutTemplate>
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                            <tr>
                                <th>
                                    Image
                                </th>
                                <th>
                                    Name/Description
                                </th>
                                <th>
                                    Price
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="width: 20%;">
                            <asp:HyperLink runat="server" CssClass="thumbnail" Style="min-height: 250px;" NavigateUrl='<%# ((Entry)Container.DataItem).GetProductLink(ContentLanguage.PreferredCulture.Name)%>'>
                            <img Style="max-height: 200px;" src= "<%# AssetHelper.GetAssetUrl((Entry)(Container.DataItem))%>" /></a>
                            </asp:HyperLink>
                        </td>
                        <td style="width: 60%;">
                            <h4><asp:HyperLink runat="server" NavigateUrl='<%# ((Entry)Container.DataItem).GetProductLink(ContentLanguage.PreferredCulture.Name)%>'>
                            <%# StoreHelper.GetEntryDisplayName((Entry)Container.DataItem)%>
                            </asp:HyperLink></h4>
                            <p>
                                <%# ((Entry)(Container.DataItem)).ItemAttributes["Info_Description"].ToString()%>
                            </p>
                            <br />
                            SKU: <strong> <%# ((Entry)(Container.DataItem)).ID%></strong>
                            <br />
                            Inventory:<strong>
                                <%# ((Entry)(Container.DataItem)).Inventory != null
                                  ? ((Entry)(Container.DataItem)).Inventory.InStockQuantity.ToString("f0")
                                  : ""%>
                                Available</strong>
                            <br />
                            This Item Generally Ships Within 3 Days.
                        </td>
                        <td style="width: 20%;">
                            <catalog:CommonPricingInfo runat="server" ID="PricingInfo" />
                            <hr />
                            <div class="btn-group">            
                                <a class="btn btn-info" href="<%# ((Entry)Container.DataItem).GetProductLink(ContentLanguage.PreferredCulture.Name)%>"><i class="icon-shopping-cart icon-white"></i>View Detail</a>
                                <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <catalog:CommonButtons runat="server" ID="CommonButtons" />
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <hr />
            <div class="pagination pagination-right">
                <asp:DataPager QueryStringField="p" ID="pagerBottom" PageSize="20" runat="server" PagedControlID="searchResults">
                    <Fields>
                        <asp:TemplatePagerField>
                            <PagerTemplate>
                                <catalog:PagingMenu runat="server" FirstItemIndex='<%# Container.StartRowIndex %>' PageSize='<%# Container.PageSize %>' TotalItems='<%# Container.TotalRowCount %>' />
                            </PagerTemplate>
                        </asp:TemplatePagerField>
                    </Fields>
                </asp:DataPager>
            </div>
            <hr />
        </div>
    </div>
</asp:Content>
