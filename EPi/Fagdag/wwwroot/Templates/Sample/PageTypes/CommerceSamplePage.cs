using EPiServer.Core;

namespace EPiServer.Commerce.Sample.Templates.Sample.PageTypes
{
    public abstract class CommerceSamplePage : PageData
    {
        public HomePage HomePage
        {
            get { return DataFactory.Instance.Get<HomePage>(ContentReference.StartPage); }
        }
    }
}