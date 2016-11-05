<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressControl.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.AddressControl" %>

<script type="text/javascript">
    function UseAddressBook(isBilling, shipmentId) {
        $('#' + '<%=addressType.ClientID %>').val(isBilling ? 'billing' : 'shipping');
        if (!isBilling && shipmentId) {
            $('#' + '<%=shipmentId.ClientID %>').val(shipmentId);
        }
        $('#select-existing-address').modal('show').css({
            width: '840px',
            'padding-left': '10px',
            'margin-top': function () {
                return -($(this).height() / 2);
            },
            'margin-left': function () {
                return -($(this).width() / 2);
            }
        });
    }

    function NewAddress(isBilling) {
        $('#' + '<%=addressType.ClientID %>').val(isBilling ? 'billing' : 'shipping');
        $('#create-new-address').modal('show').css(
            {
                width: '840px',
                'max-height': '840px',
                'padding-left': '10px',
                'margin-top': function() {
                    return -($(this).height() / 2);
                },
                'margin-left': function() {
                    return -($(this).width() / 2);
                }
            });
    }

    function CancelAddress() {
        $('#create-new-address').modal('hide');
        $('#select-existing-address').modal('hide');
    }
</script>

<asp:HiddenField ID="shipmentId" runat="server" />
<asp:HiddenField ID="addressType" runat="server" />
<asp:TextBox ID="addressSelectType" runat="server" CssClass="hide" />

<div id="select-existing-address" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <h4>
        Select the Address to Use
    </h4>
    <table class="table table-striped table-bordered table-condensed">
        <thead>
            <tr>
                <th>Address Name</th>
                <th>Address</th>
            </tr>
        </thead>
        <asp:ListView ID="addressBook" runat="server" ItemPlaceholderID="itemPlaceHolder">
            <EmptyDataTemplate>
                <tbody>
                    <tr>
                        <td colspan="2">
                            You don't have any addresses saved currently.
                        </td>
                    </tr>
                </tbody>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <tbody>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                </tbody>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:LinkButton ID="useAddress" runat="server" CommandArgument='<%# Eval("AddressId") %>' CommandName="UseAddress" Text='<%# HttpUtility.HtmlEncode(Eval("Name")) %>' />
                    </td>
                    <td> 
                        <address>
                            <asp:Literal ID="address" runat="server" />
                        </address>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </table>
    <p>
        <a class="btn btn-small btn-info" onclick="CancelAddress();">
            <i class="icon-remove-sign icon-white"></i>
            Cancel
        </a> 
    </p>
</div> 
<div id="create-new-address"  class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <h3>
        Add/Edit Address
    </h3>
    <p>
        You are editing an Existing Address or You are Creating a New Address
    </p>
    <hr />
    <fieldset>
        <div class="control-group">
            <label class="control-label">Address Name</label> 
            <div class="controls controls-row">
                <asp:TextBox ID="Name" runat="server" CssClass="span4" placeholder="Address Name" MaxLength="50" />
                <asp:RequiredFieldValidator ID="AddressNameRequireField" ControlToValidate="Name" Text="The field is required!" runat="server"  ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/>
            </div>
        </div>
    <hr />
        <div class="control-group">
            <label class="control-label">Contact Information</label> 
            <div class="controls controls-row">
                <asp:TextBox ID="FirstName" runat="server" CssClass="span4" placeholder="First Name" MaxLength="64" />
                <asp:RequiredFieldValidator ID="FirstNameRequiredField" ControlToValidate="FirstName" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/>
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="LastName" runat="server" CssClass="span4" placeholder="Last Name" MaxLength="64" />
                <asp:RequiredFieldValidator ID="LastNameRequiredField" ControlToValidate="LastName" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/>
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="Email" runat="server" CssClass="span4" placeholder="e-mail Address" MaxLength="64" />
                <asp:RequiredFieldValidator ID="EmailRequiredField" ControlToValidate="Email" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" Display="Dynamic" CssClass="requiredfield"/>
                <asp:RegularExpressionValidator ID="ValidateEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email" Text="Input incorrect email address!" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/>
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="Phone" runat="server" CssClass="span4" placeholder="Phone Number" MaxLength="32" />
                <asp:RequiredFieldValidator ID="PhoneRequiredField" ControlToValidate="Phone" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/>
            </div>
        </div>
    <hr />
        <div class="control-group">
            <label class="control-label">Address</label> 
            <div class="controls controls-row">
                <asp:TextBox ID="CompanyName" runat="server" CssClass="span6" placeholder="Company Name" MaxLength="80" />
                <asp:RequiredFieldValidator ID="CompanyNameRequiredField" ControlToValidate="CompanyName" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/>
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="StreetAddress" runat="server" CssClass="span6" placeholder="Street Address" MaxLength="80" />
                <asp:RequiredFieldValidator ID="StreetAddressRequiredField" ControlToValidate="StreetAddress" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield"  Display="Dynamic"/>
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="Apartment" runat="server" CssClass="span6" placeholder="Apt, Suite, Bldg." MaxLength="80" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Apartment" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield"  Display="Dynamic"/>
            </div>
        </div>
    <hr />
        <div class="control-group">
            <label class="control-label">Address Location</label> 
            <div class="controls controls-row">
                <asp:TextBox ID="City" runat="server" CssClass="span4" placeholder="City" MaxLength="64" />
                <asp:RequiredFieldValidator ID="CityRequiredField" ControlToValidate="City" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/><br />
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="State" runat="server" CssClass="span4" placeholder="State" MaxLength="64" />
                <asp:RequiredFieldValidator ID="StateRequiredField" ControlToValidate="State" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/><br />
            </div>
            <div class="controls controls-row">
                <asp:TextBox ID="Zip" runat="server" CssClass="span4" placeholder="Postal Code" MaxLength="20" />
                <asp:RequiredFieldValidator ID="ZipRequiredField" ControlToValidate="Zip" Text="The field is required!" runat="server" ValidationGroup="CreateAddress" SetFocusOnError="true" CssClass="requiredfield" Display="Dynamic"/><br />
                <hr />
                <label class="control-label">Country</label> 
                <asp:DropDownList ID="Country" runat="server" DataTextField="Name" DataMember="Country" DataValueField="Code" />
            </div>
        </div>
        <div class="control-group" id="saveAddressBook">
            <asp:CheckBox type="checkbox" ID="AddAddressToContact" runat="server" AutoPostBack="false"/> 
            <label>Save Address to Address Book</label> 
        </div>
    </fieldset>
    <hr />
    <p>
        <asp:LinkButton CssClass="btn btn-small btn-info" OnClick="SaveAddress" runat="server" ID="SaveAddressButton" UseSubmitBehavior="true" ValidationGroup="CreateAddress">
            <i class="icon-ok-sign icon-white"></i>Save
        </asp:LinkButton>
        <a class="btn btn-small btn-info" onclick="CancelAddress();">
            <i class="icon-remove-sign icon-white"></i>Cancel
        </a>
    </p>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var allowSaveAddressBook = '<%=AllowSaveAddressBook%>';
        if (allowSaveAddressBook.toLowerCase() === "false") {
            $('#saveAddressBook').remove();
        }
    })
</script>
