using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Mediachase.Commerce.Customers;
using Mediachase.BusinessFoundation.Data;
using Mediachase.Commerce.Security;

namespace EPiServer.Commerce.Sample.Templates.Sample.Units.AccountManagement
{
	public partial class ChangePassword : System.Web.UI.UserControl
	{

	    protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void savePassword_Click(object sender, EventArgs e)
        {
            if (!Membership.ValidateUser(SecurityContext.Current.CurrentUser.UserName, CurrentPassword.Text))
            {
                passwordError.Text = "Old Password is not valid, please fix and try again";
                return;
            }

            try
            {
                SecurityContext.Current.CurrentUser.ChangePassword(CurrentPassword.Text, NewPassword.Text);
                PasswordSuccessful.Text = "Password changed successfully!";
                return;
            }
            catch (Exception ex)
            {
                passwordError.Text = ex.Message;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Context.RedirectFast("/self-service/account-info/");
        }
	}
}