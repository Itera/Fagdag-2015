<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.ChangePassword" %>
<%@ Register TagPrefix="CMSNav" TagName="SideNav" Src="Controls/SideNav.ascx" %>

<div class="row C_Account-Control">
	<div class="span3">
    <CMSNav:SideNav ID="SideNav" runat="server" />
	</div>
	<div class="span9">
		<h3>
			Change Account Password 
            <asp:Label ID="PasswordSuccessful" EnableViewState="false" runat="server" ForeColor="ForestGreen" />
		</h3>
		<p>
			You are changing your account password. 
		</p>
		<hr />
		<fieldset>
			<div class="control-group">
				<label class="control-label">Enter Your Current Password.</label> 
				<div class="controls docs-input-sizes">
                	<asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="span4"></asp:TextBox>
					<asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
						ErrorMessage="This field is required"
						ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                    <asp:Label ID="passwordError" EnableViewState="false" runat="server" ForeColor="Red" />
					<hr />
					Enter Your New Password Twice for Confirmation.<br />
                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="span4"></asp:TextBox>
					<asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
						ErrorMessage="This field is required"
						ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="span4"></asp:TextBox>
					<asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
						ErrorMessage="This field is required"
						ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
						ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The new passwords don't match"
						ValidationGroup="ChangePassword1"></asp:CompareValidator>
				</div>
			</div>
		</fieldset>
		<hr />
		<p>
			<asp:Button ID="save" CssClass="btn btn-small btn-info" runat="server" Text="Save" OnClick="savePassword_Click"/>
            <asp:Button ID="cancel" CssClass="btn btn-small btn-info icon-remove-sign" runat="server" Text="Cancel" OnClick="cancel_Click" />
		</p>
	</div>
</div>