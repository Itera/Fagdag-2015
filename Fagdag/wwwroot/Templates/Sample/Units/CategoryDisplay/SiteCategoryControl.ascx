﻿<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="SiteCategoryControl.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CategoryDisplay.SiteCategoryControl" %>
<%@ Register Src="SharedModules/CategoryTopMenu.ascx" TagName="CategoryTopMenu" TagPrefix="catalog" %>
<%@ Register Src="SharedModules/CommonNodeList.ascx" TagName="NodeList" TagPrefix="catalog" %>
<div class="row C_Page-header">
    <div class="span12">
        <%--<catalog:CategoryTopMenu ID="CategoryTopMenuID" runat="server" />--%>
        <%--<div class="hero-unit">--%>
            <h1><EPiServer:Property PropertyName="DisplayName" runat="server" /></h1>
            <EPiServer:Property PropertyName="Info_Description" runat="server" />
        <%--</div>--%>
    </div>
</div>
<catalog:NodeList ID="NodeListID" runat="server" CurrentData="<%# CurrentData %>" />