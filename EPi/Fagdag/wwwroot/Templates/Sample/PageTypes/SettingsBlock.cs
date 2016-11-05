using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EPiServer.Commerce.Sample.Templates.Sample.PageTypes
{
    [ContentType(
        GUID = "75EA193A-DDBF-4590-8E22-BF74ABE56906",
        AvailableInEditMode = false,        // Just for settings, not able to add from edit mode
        DisplayName = "Settings Data",
        Description = "Contains global settings data for this site.",
        GroupName = "CommerceSample",
        Order = 1)]
    public class SettingsBlock : BlockData
    {
        [Searchable(false)]
        [Display(
            Name = "CartPage",
            Description = "The page that displays the shopping cart.",
            GroupName = SystemTabNames.Content,
            Order = 10)]
        public virtual PageReference CartPage { get; set; }

        [Searchable(false)]
        [Display(
            Name = "WishListPage",
            Description = "The page that displays the wish list.",
            GroupName = SystemTabNames.Content,
            Order = 20)]
        public virtual PageReference WishListPage { get; set; }

        [Searchable(false)]
        [Display(
            Name = "CheckoutPage",
            Description = "The checkout page to complete your order.",
            GroupName = SystemTabNames.Content,
            Order = 30)]
        public virtual PageReference CheckoutPage { get; set; }

        [Searchable(false)]
        [Display(
            Name = "YourOrdersPage",
            Description = "The page that displays the order history.",
            GroupName = SystemTabNames.Content,
            Order = 40)]
        public virtual PageReference YourOrdersPage { get; set; }

        [Searchable(false)]
        [Display(
            Name = "MarketNotSupportedPage",
            Description = "The page that displays not available market.",
            GroupName = SystemTabNames.Content,
            Order = 40)]
        public virtual PageReference MarketNotSupportedPage { get; set; }
        
        [Display(
            Name = "Search Page",
            Description = "The page to Search.",
            GroupName = SystemTabNames.Content,
            Order = 50)]
        public virtual ContentReference SearchPage { get; set; }
    }
}