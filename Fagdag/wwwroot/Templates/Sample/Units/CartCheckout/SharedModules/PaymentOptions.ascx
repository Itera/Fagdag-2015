<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentOptions.ascx.cs"
    Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.CartCheckout.SharedModules.PaymentOptions" %>
<div class="row C_Order-Payment-Options">
    <div class="span12">
        <div class="well">
            <h4>
                Payment Options
            </h4>
        </div>
        <div class="row C_Order-Payment-Options">
            <div class="span8">
                &nbsp;
            </div>
            <div class="span4">
                <br />
                <ul id="tab" class="nav nav-tabs">
                    <asp:Repeater runat="server" ID="PaymentOptionList">
                        <ItemTemplate>
                            <li class="payment-control" id='<%# "tab" + GetControlIDFromPayment(Container.DataItem)%>'><a href="#<%# GetControlIDFromPayment(Container.DataItem)%>" data-toggle="tab">
                                <%# ((Mediachase.Commerce.Orders.PaymentMethod) Container.DataItem).Name.ToString() %>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <asp:PlaceHolder runat="server" ID="PaymentContent" />
                </div>
            </div>
        </div>
        <hr />
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var activeControlId = '<%=ActiveControlId%>';

        $('\'' + '.payment-control#tab' + activeControlId + '\'').addClass('active');
        
    })
</script>
