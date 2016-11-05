<%@ Control Language="C#" CodeBehind="DepartmentNodeWithEntries.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CategoryDisplay.DepartmentNodeWithEntries" %>
<%@ Import Namespace="EPiServer.Commerce.Catalog.ContentTypes" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<%@ Register Src="SharedModules/CategoryTopMenu.ascx" TagName="CategoryTopMenu" TagPrefix="catalog" %>
<%@ Register Src="SharedModules/CommonButtons.ascx" TagName="CommonButtons" TagPrefix="catalog" %>
<%@ Register Src="SharedModules/CommonPricingInfo.ascx" TagName="CommonPricingInfo" TagPrefix="catalog" %>
<%@ Register Src="../Navigation/PagingMenu.ascx" TagName="PagingMenu" TagPrefix="catalog" %>
<script type="text/javascript">
    $(function () {
        setViewMode = function(viewName) {
            //reset style 
            $('#gridContent').removeClass('listview');
            $('#gridContent > li').removeAttr('class');
            $('#gridContent h4').addClass("truncate");
            $('#gridContent ul.unstyled li').addClass("truncate");

            //set custom view mode
            if (viewName == 'ListView') {
                $('#gridContent .truncate').removeClass('truncate');
                $('#gridContent').addClass('listview');
                $('#gridContent > li').addClass('span12');
            } else if (viewName == 'SmallGrid') {
                $('#gridContent > li').addClass('span2');
            } else {
                $('#gridContent > li').addClass('span3');
            }
        };

        // Change view 
        $('#viewlist a').click(function(event) {
            event.preventDefault();
            var currentMode = $(this).attr('mode');

            $('#viewlist a').each(function() {
                if ($(this).attr('mode') != currentMode) {
                    $(this).parent().removeClass('active');
                } else {
                    $(this).parent().addClass('active');
                }
            });

            setViewMode(currentMode);
        });

        setViewMode('LargeGrid');
    });
</script>

<div class="row C_Business-Control4">
    <div class="span12">
        <catalog:CategoryTopMenu ID="CategoryTopMenuID" runat="server" />
        <h1>You Are Shopping in the
            <EPiServer:Property PropertyName="DisplayName" runat="server" />
            Department </h1>
        <hr />
        <div class="row">
            <div class="span8">
                <ul id="viewlist" class="nav nav-pills">
                    <li class="active"><a href="#" mode="LargeGrid"><i class="icon-th"></i>Large Grid</a></li>
                    <li><a href="#" mode="SmallGrid"><i class="icon-th"></i>Small Grid</a></li>
                    <li><a href="#" mode="ListView"><i class="icon-th-list"></i>List View</a></li>
                </ul>
            </div>
            <div class="span4">
                <div class="pagination pagination-right" style="margin-top: 0;">
                    <asp:DataPager QueryStringField="p" ID="pagerTop" PageSize="20" runat="server" PagedControlID="EntriesList">
                        <Fields>
                            <asp:TemplatePagerField>
                                <PagerTemplate>
                                    <catalog:PagingMenu runat="server" FirstItemIndex='<%# Container.StartRowIndex %>' PageSize='<%# Container.PageSize %>' TotalItems='<%# Container.TotalRowCount %>' />
                                </PagerTemplate>
                            </asp:TemplatePagerField>
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </div>
        <asp:ListView Visible="true" ID="entriesList" EnableViewState="false" runat="server" ItemPlaceholderID="itemPlaceHolder">
            <EmptyDataTemplate>
                <h3>There are no results.</h3>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <ul id="gridContent" class="thumbnails">
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </ul>
                <hr />
            </LayoutTemplate>
            <ItemTemplate>
                <li class="span3">
                    <div class="clearfix thumbnail">
                        <asp:HyperLink runat="server" NavigateUrl='<%# GetUrl((EntryContentBase) Container.DataItem) %>'>
                            <asp:Image runat="server" ID="Image1" AlternateText="dx Asset" />
                        </asp:HyperLink>
                        <div class="caption">
                            <h4>
                                <asp:HyperLink runat="server" NavigateUrl='<%# GetUrl((EntryContentBase) Container.DataItem) %>'>
                                            <%#  WebStringHelper.EncodeForWebString(((EntryContentBase) Container.DataItem).DisplayName) %>
                                </asp:HyperLink>
                            </h4>
                            <hr />
                            <ul class="unstyled">
                                <li>Brand:
                                    <%# WebStringHelper.EncodeForWebString(GetFacetBrand((EntryContentBase) Container.DataItem)) %></li>
                                <li>In Stock:
                                    <asp:Literal ID="InStock" runat="server"></asp:Literal></li>
                                <li>SKU:
                                    <%# ((EntryContentBase) Container.DataItem).Code %></li>
                                <li>Model:
                                    <%# WebStringHelper.EncodeForWebString(GetModelNumber((EntryContentBase) Container.DataItem)) %></li>
                                <li>Customer Reviews: ****</li>
                            </ul>
                            <hr />
                            <catalog:CommonPricingInfo runat="server" ID="PricingInfo" />
                            <hr />
                            <asp:PlaceHolder runat="server" Visible="False" ID="PromotionsHolder">
                                <strong>Promotions:</strong><br />
                                <asp:Literal ID="Promotions" runat="server" />
                                <hr />
                            </asp:PlaceHolder>
                            <div class="btn-group" style="display: inline-block;">
                                <a class="btn btn-info" href="<%# GetUrl((EntryContentBase) Container.DataItem) %>"><i class="icon-shopping-cart icon-white"></i>View Detail</a>
                                <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <catalog:CommonButtons runat="server" ID="CommonButtons" />
                            </div>
                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
        <div class="pagination pagination-right">
            <asp:DataPager QueryStringField="p" ID="pagerBottom" PageSize="20" runat="server" PagedControlID="EntriesList">
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
