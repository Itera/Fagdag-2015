<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangeAccountInfo.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.ChangeAccountInfo" %>

<div class="row C_Account-Control">
	<div class="span3">


<div class="well" style="padding: 8px 0;">
	<ul class="nav nav-list">
		<li class="nav-header"> Main Options</li>
		<li class="active"><a href="/self-service/account-info/"><i class="icon-user"></i> Your Account</a></li>
		<li><a href="/self-service/your-orders/"><i class="icon-th-list"></i> Your Orders</a></li>
		<li><a href="/self-service/your-addresses/"><i class="icon-th-large"></i> Your Addresses</a></li>
		<li><a href="/self-service/change-password/"><i class="icon-th-large"></i> Change Password</a></li>
		<li class="nav-header"> More Options</li>
		<li><a href="#"><i class="icon-file"></i> FAQs</a></li>
		<li><a href="#"><i class="icon-headphones"></i> Customer Service</a></li>
		<li><a href="#"><i class="icon-leaf"></i> Help</a></li>
	</ul>
</div>

	</div>
	<div class="span9">
		<h3>
			Edit Account Information
		</h3>
		<p>
			You are editing Your Account Information
		</p>
		<hr />
		<fieldset>
			<legend>User Name, Roles and Password</legend> 
			<div class="control-group">
				<label class="control-label">Your User Name.</label> 
				<div class="controls docs-input-sizes">
					<h5>
						casekraker/chris@mediachase.com
					</h5>
					<hr />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Your Roles/Privileges.</label> 
				<div class="controls">
					<h5>
						- Everyone
					</h5>
					<h5>
						- Registered
					</h5>
				</div>
			</div>
		</fieldset>
		<hr />
		<fieldset>
			<legend>Contact Information and Preferences</legend> 
			<div class="control-group">
				<label class="control-label">Contact Information</label> 
				<div class="controls">
					<input type="text" placeholder="First Name" class="span6" />
					<input type="text" placeholder="Middle Name" class="span6" />
					<input type="text" placeholder="Last Name" class="span6" />
					<input type="text" placeholder="e-mail Address" class="span4" />
					<span class="help-inline">Please correct the error</span> 
					<hr />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Shopping Preferences</label> 
				<div class="controls">
					<h6>
						Preferred Language
					</h6>
					<select>
						<option value="30"> English </option>
						<option value="90"> French </option>
					</select>
					<h6>
						Preferred Currency
					</h6>
					<select>
						<option value="30"> US Dollars </option>
						<option value="90"> Lira </option>
					</select>
				</div>
			</div>
		</fieldset>
		<hr />
		<p>
			<a class="btn btn-small btn-info" href="#">Save</a> <a class="btn btn-small btn-info" href="#"> Cancel</a>
		</p>
	</div>
</div>