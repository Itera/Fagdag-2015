<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditAddress.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.EditAddress" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>

<div class="row C_Your-Account-Control">
	<div class="span3">
    <CMSNav:SideNav ID="SideNav" runat="server" />
	</div>

	<div class="span9">
		<h3>
			Add/Edit Address
		</h3>
		<p>
			You are editing an existing address or you are creating a new address 
		</p>
		<hr />
		<fieldset>
			<div class="control-group">
				<label class="control-label">Address Name</label> 
				<div class="controls">
					<asp:TextBox ID="addressName" runat="server" CssClass="Span8" placeholder="Address Name" MaxLength="50"></asp:TextBox>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Contact Information</label> 
				<div class="controls">
                    <asp:TextBox ID="firstName" runat="server" CssClass="span4" placeholder="First Name" MaxLength="64"></asp:TextBox>
                    <small class="error">
                        <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ControlToValidate="firstName" CssClass="requiredfield">This is a required field.</asp:RequiredFieldValidator>
                    </small><br />
                    <asp:TextBox ID="lastName" runat="server" CssClass="span4" placeholder="Last Name" MaxLength="64"></asp:TextBox>
                    <small class="error">
                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ControlToValidate="lastName" CssClass="requiredfield">This is a required field.</asp:RequiredFieldValidator>
                    </small><br />
                    <asp:TextBox ID="emailAddress" runat="server" CssClass="span4" placeholder="e-mail Address" MaxLength="64"></asp:TextBox>
                    <small class="error">
                        <asp:RequiredFieldValidator ID="EmailRequiredField" ControlToValidate="emailAddress" Text="The field is required!" runat="server" EnableViewState="false" SetFocusOnError="true" Display="Dynamic" CssClass="requiredfield"/>
                        <asp:RegularExpressionValidator ID="ValidateEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="emailAddress" Text="Input incorrect email address format!" EnableViewState="false" SetFocusOnError="true" CssClass="requiredfield"/>
                    </small>
                    <asp:TextBox ID="phoneNumber" runat="server" CssClass="span4" placeholder="Phone Number (optional)" MaxLength="32"></asp:TextBox>
                    <small class="error"></small>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Address</label> 
				<div class="controls docs-input-sizes">
                    <asp:TextBox ID="companyName" runat="server" CssClass="large input-text span6" placeholder="Company Name (Optional)" MaxLength="64"></asp:TextBox>
                    <asp:TextBox ID="address1" runat="server" CssClass="large input-text span6" placeholder="Street Address" MaxLength="80"></asp:TextBox>
                    <small class="error">
                        <asp:RequiredFieldValidator ID="reqAddress1" runat="server" ControlToValidate="address1" CssClass="requiredfield">This is a required field.</asp:RequiredFieldValidator>
                    </small>
                    <asp:TextBox ID="address2" runat="server" CssClass="large input-text span6" placeholder="Apt, Suite, Bldg. (Optional)" MaxLength="80"></asp:TextBox>
					<hr />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Address Location</label> 
				<div class="controls">
                    <asp:TextBox ID="city" runat="server" CssClass="large input-text span4" placeholder="City" MaxLength="64"></asp:TextBox>
                    <small class="error">
                    <asp:RequiredFieldValidator ID="reqCity" runat="server" ControlToValidate="city" CssClass="requiredfield">This is a required field.</asp:RequiredFieldValidator>
                    </small>
                    <asp:DropDownList ID="state" runat="server" CssClass="large input-text" DataTextField="Name" DataValueField="Name">
                    </asp:DropDownList>
                    <asp:TextBox ID="zipcode" runat="server" CssClass="large input-text span2" placeholder="Postal Code" MaxLength="20"></asp:TextBox>
                    <small class="error">
                        <asp:RequiredFieldValidator ID="reqZipcode" runat="server" ControlToValidate="zipcode" CssClass="requiredfield">This is a required field.</asp:RequiredFieldValidator>
                    </small>
                    <asp:TextBox ID="region" runat="server" CssClass="large input-text span2" placeholder="Region" MaxLength="64"></asp:TextBox>
					<hr />
                    <asp:DropDownList ID="country" runat="server" CssClass="large input-text" DataTextField="Name" DataValueField="Code" OnSelectedIndexChanged="country_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
				</div>
				<hr/>
			</div>
			<div class="control-group">
				<div class="controls">
                    <asp:CheckBox ID="defaultShipping" runat="server" />
                        Click to Make this Your Default SHIPPING Address
                    <br />
                    <asp:CheckBox ID="defaultBilling" runat="server" />
                        Click to Make this Your Default BILLING Address
				</div>
			</div>
		</fieldset>
		<hr />
		<p>
            <asp:Button ID="save" OnClick="save_Click" runat="server" CssClass="btn btn-small btn-info" Text="Save" />
            <asp:Button ID="cancel" OnClick="cancel_Click" runat="server" CssClass="btn btn-small btn-info" Text="Cancel" CausesValidation="false" />
		</p>
	</div>
</div>