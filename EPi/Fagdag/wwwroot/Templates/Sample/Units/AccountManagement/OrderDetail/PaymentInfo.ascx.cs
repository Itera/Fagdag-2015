using Mediachase.Commerce.Orders;
using System;

namespace EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement.OrderDetail
{
    public partial class PaymentInfo : UserControlBase
    {
        public PaymentCollection PaymentInfos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            rptPayments.DataSource = PaymentInfos;
            rptPayments.DataBind();
        }

        protected string Header
        {
            get
            {
                if (PaymentInfos == null)
                {
                    return "No Payment Information";
                }
                return "Method(s): ";
            }
        }
    }
}