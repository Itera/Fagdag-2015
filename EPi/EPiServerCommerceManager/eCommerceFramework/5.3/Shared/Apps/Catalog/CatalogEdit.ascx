<%@ Control Language="C#" AutoEventWireup="true" Inherits="Mediachase.Commerce.Manager.Catalog.CatalogEdit" Codebehind="CatalogEdit.ascx.cs" %>
<%@ Register Src="../Core/SaveControl.ascx" TagName="SaveControl" TagPrefix="ecf" %>
<%@ Register Src="../Core/Controls/EditViewControl.ascx" TagName="EditViewControl" TagPrefix="ecf" %>
<div class="editDiv">
    <ecf:EditViewControl AppId="Catalog" ViewId="Edit" id="ViewControl" runat="server" MDContext="<%# Mediachase.Commerce.Catalog.CatalogContext.MetaDataContext %>"></ecf:EditViewControl>
    <ecf:SaveControl id="EditSaveControl" CancelClientScript="CSManagementClient.ChangeView('Catalog','Catalog-List');" SavedClientScript="CSManagementClient.ChangeView('Catalog', 'Catalog-List');" runat="server"></ecf:SaveControl>
</div>