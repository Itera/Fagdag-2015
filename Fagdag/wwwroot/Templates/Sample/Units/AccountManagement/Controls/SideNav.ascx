<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideNav.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.Controls.SideNav" %>

<div class="well" style="padding: 8px 0;">
	<ul class="nav nav-list">
		<li class="nav-header"> Main Options:</li>
		<li><a href="/self-service/account-info/"><i class="icon-user"></i> Your Account</a></li>
		<li><a href="/self-service/your-orders/"><i class="icon-th-list"></i> Your Orders</a></li>
		<li><a href="/self-service/your-addresses/"><i class="icon-th-large"></i> Your Addresses</a></li>  
		<li><a href="/self-service/your-wish-list/"><i class="icon-th-list"></i> Your Wish List</a></li>
		<li><a href="/self-service/change-password/"><i class="icon-th-large"></i> Change Password</a></li>
		<li class="nav-header"> More Options:</li>
		<li><a href="#"><i class="icon-file"></i> FAQs</a></li>
		<li><a href="#"><i class="icon-headphones"></i> Customer Service</a></li>
		<li><a href="#"><i class="icon-leaf"></i> Help</a></li>
	</ul>
</div>
