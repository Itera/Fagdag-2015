<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YourAddresses.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.YourAddresses" %>
<%@ Import Namespace="Mediachase.Commerce.Customers" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>

<div class="row C_Your-Account-Control">
    <div class="span3">
        <cmsnav:sidenav id="SideNav" runat="server" />
    </div>

    <div class="span9">
        <h3> Available Addresses
        </h3>
        <p>
            <a class="btn btn-small btn-info" href="/Self-Service/Edit-Address/"><i class="icon-plus icon-white"></i>Add New</a>
        </p>
        <asp:ListView ID="addresses" runat="server" ItemPlaceholderID="itemPlaceHolder" DataKeyNames="AddressId">
            <EmptyDataTemplate>
                <p>You don't have any addresses saved currently.</p>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>Address Book Name </th>
                            <th>Date Updated</th>
                            <th>Address</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="name" runat="server" NavigateUrl='<%# "~/Self-Service/Edit-Address/?AddressId=" + Server.UrlEncode(Eval("AddressId").ToString()) %>' Text='<%# HttpUtility.HtmlEncode(Eval("Name")) %>'>
                        </asp:HyperLink>
                    </td>
                    <td>
                        <%# Convert.ToDateTime(Eval("Modified")).ToShortDateString() %>
                    </td>
                    <td>
                        <%# HttpUtility.HtmlEncode(((CustomerAddress)Container.DataItem).GetAddressString()) %>
                    </td>
                    <td>
                        <%# GetDefaults((CustomerAddress)Container.DataItem)%>
                    </td>
                    <td>
                        <asp:HyperLink ID="edit" runat="server" NavigateUrl='<%# "~/Self-Service/Edit-Address/?AddressId=" + Server.UrlEncode(Eval("AddressId").ToString()) %>' CssClass="btn btn-small btn-info">
                            <i class="icon-edit icon-white"></i> Edit
                        </asp:HyperLink>
                        <br />
                        <br />
                        <asp:Button ID="delete" runat="server" CssClass="btn btn-small btn-info" CommandName="deleteAddress" CommandArgument='<%# DataBinder.Eval((Mediachase.Commerce.Customers.CustomerAddress)Container.DataItem,"AddressId") %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</div>
