using System;
using EPiServer.Core; 

namespace EPiServer.Commerce.Sample
{
    public class AuthorizedPageBase<T> : TemplatePage<T> where T : PageData
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
                Response.Redirect("~/Self-Service/login/");
        }
    }
}