<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.Security.Login" %>

<div class="row C_Security-Login">
	<div class="span6">
		<h3>
			New Customer? 
		</h3>
		<p>
			<strong>Create an account</strong> to take advantage of the features and benefits that make shopping faster and easier. 
		</p>
        <fieldset>
            <div class="control-group">
                <div class="controls">
                    <asp:Panel ID="RegisterPanel" DefaultButton="CreateNewId" runat="server">
                        <input type="text" id="FirstNameId" placeholder="Enter First Name" name="FirstName" class="span4" runat="server" maxlength="64"/>
                        <asp:RequiredFieldValidator ID="FirstNameValidatorId" runat="server" ErrorMessage="*" ControlToValidate="FirstNameId" ValidationGroup="CreateGroup" />

                        <input type="text" id="LastNameId" placeholder="Enter Last Name" name="LastName" class="span4" runat="server" maxlength="64"/>
                        <asp:RequiredFieldValidator ID="LastNameValidatorId" runat="server" ErrorMessage="*" ControlToValidate="LastNameId" ValidationGroup="CreateGroup" />
                        <hr />
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span>
                            <input type="text" id="EmailAddressNewId" autocomplete="off" placeholder="Enter Email Address" name="EmailAddress_New" class="span4" runat="server" />
                            <asp:RequiredFieldValidator ID="EmailAddressNewValidatorId" runat="server" ErrorMessage="*" ControlToValidate="EmailAddressNewId" ValidationGroup="CreateGroup" />
                            <asp:RegularExpressionValidator ID="EmailAddressNewRegExValidatorId" runat="server" ErrorMessage="*" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" ControlToValidate="EmailAddressNewId" ValidationGroup="CreateGroup" />
                        </div>
                        <input type="text" id="EmailAddressConfirmId" autocomplete="off" placeholder="Confirm Email Address" name="EmailAddressNew_Confirm" class="span4" runat="server" />
                        <asp:RequiredFieldValidator ID="ConfirmEmailValidatorId" runat="server" ErrorMessage="*" ControlToValidate="EmailAddressConfirmId" ValidationGroup="CreateGroup" />

                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="EmailAddressNewId"
                            Enabled="true" ControlToValidate="EmailAddressConfirmId" Display="Dynamic" ErrorMessage="Email addresses must match"
                            ValidationGroup="CreateGroup">
                        </asp:CompareValidator>
                        <hr />
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span>
                            <input type="password" id="Password_NewId" autocomplete="off" placeholder="Enter Password" name="Password1" class="span4" runat="server" />
                            <asp:RequiredFieldValidator ID="PasswordNewValidtorId" runat="server" ErrorMessage="*" ControlToValidate="Password_NewId" ValidationGroup="CreateGroup" />
                        </div>
                        <input type="password" id="PasswordConfirmId" autocomplete="off" placeholder="Confirm Password" name="Password2" class="span4" runat="server" />
                        <asp:RequiredFieldValidator ID="PasswordConfirmValidatorId" runat="server" ErrorMessage="*" ControlToValidate="PasswordConfirmId" ValidationGroup="CreateGroup" />

                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password_NewId"
                            Enabled="true" ControlToValidate="PasswordConfirmId" Display="Dynamic" ErrorMessage="Passwords must match"
                            ValidationGroup="CreateGroup">
                        </asp:CompareValidator>
                        <hr />
                        <input type="text" placeholder="Enter Zip Code" class="span2"> <label class="checkbox" />
                        <label class="checkbox">
                            <input type="checkbox" />Send me e-mail updates about the latest products and promotions. </label>
                        <p>
                            <asp:LinkButton ID="CreateNewId" CssClass="btn btn-small btn-info" OnClick="loginCreateNew_Click" runat="server" CausesValidation="true" ValidationGroup="CreateGroup"><i class="icon-lock icon-white"></i> Create an Account</asp:LinkButton>
                            <asp:Label ID="CreateFailureText" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                        </p>
                    </asp:Panel>
                </div>
            </div>
        </fieldset>
    </div>
    <div class="span6">
        <h3>
            Returning Customer 
        </h3>
        <p>
            Sign in to your account. 
        </p>
        <div class="well">
            <fieldset>
                <div class="control-group">
                    <asp:Panel runat="server" DefaultButton="SignInId">
					    <div class="controls">
						    <div class="input-prepend">
							    <span class="add-on"><i class="icon-envelope"></i></span> 
							    <input type="text" id="EmailAddress_ExistingId" autocomplete="off" placeholder="Enter Email Address" name="EmailAddress_Existing" class="span4" runat="server"/>
                                <asp:RequiredFieldValidator ID="ValidateExistingEmailId" runat="server" ErrorMessage="*" ControlToValidate="EmailAddress_ExistingId" ValidationGroup="ExistingGroup" />
						    </div>
						    <div class="input-prepend">
							    <span class="add-on"><i class="icon-lock"></i></span> 
							    <input type="password" id="Password_ExistingId" autocomplete="off" placeholder="Enter Password" name="Password" class="span4" runat="server"/> 
                                <asp:RequiredFieldValidator ID="ValidateExistingPasswordId" runat="server" ErrorMessage="*" ControlToValidate="Password_ExistingId" ValidationGroup="ExistingGroup"/>
						    </div>
						    <hr />
						    <label class="checkbox"> 
						    <input type="checkbox" name="RememberMe" /> Remember Me Next Time</label> 
						    <p>
							    <asp:LinkButton Id="SignInId" CssClass="btn btn-small btn-info" OnClick="loginExisting_Click" runat="server" CausesValidation="true" ValidationGroup="ExistingGroup"><i class="icon-lock icon-white"></i>Sign In</asp:LinkButton>
                                <asp:Label ID="SignInFailureText" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label> 
						    </p>
					    </div>
                    </asp:Panel>
				</div>
			</fieldset>
		</div>
		<hr />
		<div>
			<a href="#" data-toggle="collapse" data-target="#demo">Forgot Your Password?</a> 
			<div id="demo" class="collapse">
				<p>
					Enter your e-mail and we will send you a link to reset your password. 
				</p>
				<div class="input-prepend">
					<span class="add-on"><i class="icon-envelope"></i></span> 
					<input type="text" placeholder="Enter Email Address" class="span4"> 
				</div>
				<p>
					<a class="btn btn-small btn-info" href="#"><i class="icon-lock icon-white"></i> Reset password</a> 
				</p>
			</div>
		</div>
	</div>
</div>
