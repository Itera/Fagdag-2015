<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YourAccount.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.YourAccount" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>
<%@ Import Namespace="EPiServer.Core.Html" %>
<%@ Import Namespace="Mediachase.Commerce.Customers" %>
<div class="row C_Your-Account-Control">
	<div class="span3">
    <CMSNav:SideNav ID="SideNav" runat="server" />
	</div>

	<div class="span9">
		<h3>
			Your Current Account Information 
		</h3>
		<hr />
		<p>
			Name: <strong> <%= WebStringHelper.EncodeForWebString(Mediachase.Commerce.Customers.CustomerContext.Current.CurrentContactName) %></strong> 
		</p>
		<p>
			Number of Orders You Have Placed With Us : <strong><asp:Literal ID="litNumberofOrders" runat="server"></asp:Literal></strong>
		</p>
		<p>
			Date of Last Order : <strong><asp:Literal ID="litLastOrderDate" runat="server"></asp:Literal></strong> 
		</p>
		<p>
			Date Your Account Was Set Up : <strong><%=Mediachase.Commerce.Customers.CustomerContext.Current.CurrentContact.Created%> </strong>
		</p>
		<p style="display: none">
			<a class="btn btn-small btn-info" href="/self-service/change-account-info/"><i class="icon-cog icon-white"></i> Change</a> 
		</p>
		<hr />
		<div class="row">
			<div class="span6">
				<h3>
					Your Default Shipping Address 
				</h3>
				<hr />
				<asp:ListView ID="shippingAddress" runat="server" ItemPlaceholderID="itemPlaceHolder" DataKeyNames="AddressId">
                    <EmptyDataTemplate>
                        <p>You don't have a default shipping address set.</p>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
		                <table class="table table-striped table-bordered table-condensed">
			            <thead>
				        <tr>
					        <th>Address</th>
                            <th>Change</th>
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
                            <%# HttpUtility.HtmlEncode(((CustomerAddress)Container.DataItem).GetAddressString()) %>
                        </td>
                        <td>
                            <asp:HyperLink ID="edit" runat="server" NavigateUrl='<%# "~/Self-Service/Edit-Address/?AddressId=" + Server.UrlEncode(Eval("AddressId").ToString()) %>' Text="Change" CssClass="btn btn-small btn-info"><i class="icon-edit icon-white"></i>
                            </asp:HyperLink>
                        </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <hr />
				    <h3>
					    Your Default Billing Address 
				    </h3>
				<hr />
                <asp:ListView ID="billingAddress" runat="server" ItemPlaceholderID="PlaceHolder1" DataKeyNames="AddressId">
                    <EmptyDataTemplate>
                        <p>You don't have a default billing address set.</p>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
		                <table class="table table-striped table-bordered table-condensed">
			            <thead>
				        <tr>
					        <th>Address</th>
                            <th>Change</th>
					        <th></th>
				        </tr>
			            </thead>
			            <tbody>
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
			            </tbody>
		                </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                        <td>
                            <%# HttpUtility.HtmlEncode(((CustomerAddress)Container.DataItem).GetAddressString()) %>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Self-Service/Edit-Address/?AddressId=" + Server.UrlEncode(Eval("AddressId").ToString()) %>' Text="Change" CssClass="btn btn-small btn-info"><i class="icon-edit icon-white"></i>
                            </asp:HyperLink>
                        </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <hr />
			</div>
		</div>
	</div>
</div>
