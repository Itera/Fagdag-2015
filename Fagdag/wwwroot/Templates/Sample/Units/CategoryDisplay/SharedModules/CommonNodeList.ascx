<%@ Control Language="C#" CodeBehind="CommonNodeList.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CategoryDisplay.SharedModules.CommonNodeList" %>
<%@ Import Namespace="EPiServer.Commerce.Sample" %>
<%@ Import Namespace="EPiServer.Commerce.Catalog.ContentTypes" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<div class="row C_Business-Control4">
    <div class="span12">
        <ul class="thumbnails">
            <asp:Repeater EnableViewState="False" runat="server" ID="rptCategoryList">
                <ItemTemplate>
                    <li class="span3">
                        <div class="thumbnail">
                            <a href='<%# GetUrl((NodeContent)Container.DataItem) %>'>
                                <img src="<%# GetMediaUrl((NodeContent)Container.DataItem) %>" alt="dx Asset" />
                            </a>
                            <div class="caption">
                                <h2 class="truncate">
                                    <a href='<%# GetUrl((NodeContent)Container.DataItem) %>'>
                                        <%# WebStringHelper.EncodeForWebString(((NodeContent)Container.DataItem).Name) %>
                                    </a>
                                </h2>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>
