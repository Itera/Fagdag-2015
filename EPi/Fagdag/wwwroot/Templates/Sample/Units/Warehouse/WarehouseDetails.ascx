<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WarehouseDetails.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.Warehouse.WarehouseDetails" %>

<div class="row C_Warehouse-Details">
    <div class="span9">
        <h3><%= Translate("/Sample/Warehouse/AvailableProducts")%> 
        </h3>


        <div>
            <asp:Literal runat="server" ID="noOrderMsg" Visible="false" Text="No Orders Yet" />
            <asp:Repeater EnableViewState="False" runat="server" ID="rptWarehouseInventoryList">
                <HeaderTemplate>
                    <h4>
                        <%# GetInventoryList() %>
                    </h4>
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                            <tr>                            
                                <th>Entry Name</th>
                                <th>In Stock</th>
                                <th>Reserved</th>
                                <th>Preorder Qty</th>
                                <th>Backorder Qty</th>
                                <th>Preorder Available</th>
                                <th>Backorder Available</th>
                                <th>Warehouse Code</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>                   
                        <td>
                            <%# GetCatalogEntryName(((Mediachase.Commerce.Inventory.IWarehouseInventory) Container.DataItem).CatalogKey.CatalogEntryCode) %>
                        </td>
                        <td>
                            <%# Eval("InstockQuantity") %>
                        </td>
                        <td>
                            <%# Eval("ReservedQuantity") %>
                        </td>
                        <td>
                            <%# Eval("PreorderQuantity") %>
                        </td>
                        <td>
                            <%# Eval("PreorderQuantity") %>
                        </td>
                        <td>
                            <%# Eval("PreorderAvailabilityDate") %>
                        </td>
                        <td>
                            <%# Eval("BackorderAvailabilityDate") %>
                        </td>
                        <td>
                            <%# Eval("WarehouseCode") %>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div style="text-align: right">
                Page:
                <asp:DropDownList Style="width: 70px; margin-top: 3px;" runat="server" ID="PagerID" AutoPostBack="true" OnSelectedIndexChanged="Pager_OnSelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
    </div>
</div>
