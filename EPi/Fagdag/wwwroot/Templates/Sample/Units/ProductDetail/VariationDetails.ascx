﻿<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="VariationDetails.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.VariationDetails" %>
<h4>Description/Features</h4>
<br />
<% if (CurrentData.Property["Info_Description"] != null) { %>
<p>
    <episerver:property runat="server" propertyname="Info_Description" />
</p>
<% } %>
<ul class="unstyled">
    <% if (CurrentData.Property["Info_ModelNumber"] != null) { %>
        <li>Model: 
            <EPiServer:property runat="server" propertyname="Info_ModelNumber" />
        </li>
    <% } %>
    <li>SKU:
        <EPiServer:property runat="server" propertyname="Code" />
    </li>
</ul>
<hr />
<% if (CurrentData.Property["Info_Features"] != null) { %>
<div class="accordion" id="accordion2">
    <div class="accordion-group">
        <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Additional Details and Product Information <b class="caret"></b></a>
        </div>
        <div id="collapseOne" class="accordion-body collapse">
            <div class="accordion-inner">
                <EPiServer:property runat="server" propertyname="Info_Features" />
            </div>
        </div>
    </div>
</div>
<hr />
<% } %>
<strong>Pre-Cart Discounts Available </strong>
<p class="discount-text">
    - All Items Except Action Figures Get 20% Discount<br>
    - Purchase a Red Item and Get an Additional 10 Dollars Off<br>
</p>
