<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductWarehouseInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.ProductDetail.SharedModules.ProductWarehouseInfo" %>
<%@ Import Namespace="EPiServer.Commerce.Sample" %>
<%@ Import Namespace="EPiServer.Commerce.Sample.Helpers" %>

<script type="text/javascript">
    function SelectWarehouse(inStockQuantity, warehouseCode, warehouseName) {
        $('#litInStock').html(inStockQuantity);
        $('#litInStorePickUp').html('Store:');
        $('#litWarehouseCode').html(warehouseName);
        $('#checkstoresmodal').modal('hide');
        $('#<%=hidWarehouseCode.ClientID%>').val(warehouseCode);
    }
</script>

<asp:HiddenField runat="server" ID="hidWarehouseCode"/>

<li>In Stock: <strong>
    <label id="litInStock" style="display: inline; font-weight: bold"><%= GetDefaultWarehouseInventory().InStockQuantity %></label>

    units</strong></li>
<li>
    <label id="litInStorePickUp" style="display: inline;"></label>
    <label id="litWarehouseCode" style="display: inline; font-weight: bold"><%= WarehouseHelper.GetWarehouse(Constants.DefaultWarehouseCode) != null ? WarehouseHelper.GetWarehouse(Constants.DefaultWarehouseCode).Name : string.Empty  %></label>
    <br />
    <a data-toggle="modal" href='#checkstoresmodal'>
        <strong>
            Check Stores
        </strong>
    </a>
</li>
<li>Item Generally Ship Within <strong> 3 </strong> Days </li>
<div id='checkstoresmodal' class="modal hide fade">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <h3>
            Warehouse Information
        </h3>
    </div>
    <div class="modal-body">
        <asp:Repeater EnableViewState="False" runat="server" ID="rptWarehouseList" OnItemDataBound="rptWarehouseList_ItemDataBound">
            <HeaderTemplate>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th style="text-align: center">Availability</th>
                            <th style="text-align: center">Reserved</th>
                            <th style="text-align: center">In Stock</th>
                            <th style="text-align: center">Pick up</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <a href="#" data-toggle="collapse" data-target="<%# String.Format("#warehousedetail{0}", Eval("WarehouseCode")) %>">
                            <asp:Literal runat="server" ID="WarehouseName"></asp:Literal>
                        </a>
                        <div id="<%# String.Format("warehousedetail{0}", Eval("WarehouseCode"))%>" class="collapse">
                            <asp:Literal runat="server" ID="WarehouseContactInfo"></asp:Literal>
                            <br />
                            Address:
                            <asp:HyperLink ID="WarehouseAddress" runat="server" Target="_blank"></asp:HyperLink>
                        </div>
                    </td>
                    <td style="text-align: center">
                        <asp:Literal runat="server" ID="WarehouseIsAvailable"></asp:Literal>
                    </td>
                    <td style="text-align: center">
                        <%# Eval("ReservedQuantity") %> units
                    </td>
                    <td style="text-align: center">
                        <%# Eval("InStockQuantity") %> units
                    </td>
                    <td style="text-align: center">
                        <asp:HyperLink ID="PickUpButton" runat="server" CssClass="btn btn-info span2">
                                Pick
                        </asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                    </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Literal ID="Notification" runat="server"></asp:Literal>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
    </div>
</div>
