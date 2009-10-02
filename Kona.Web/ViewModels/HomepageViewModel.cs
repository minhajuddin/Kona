using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Kona.Model;

namespace Kona.ViewModels {
    public class HomepageViewModel {

        public IEnumerable<Category> ParentCategories {
            get {
                return Categories.Where(x => x.ParentID == 0);
            }
        }
        public IEnumerable<Category> Categories { get; set; }
        public IEnumerable<Product> FeaturedProducts { get; set; }
        public IEnumerable<Product> Recent { get; set; }
        public IEnumerable<Product> Favorite { get; set; }
        public Category HomeCategory {
            get {
                return Categories.SingleOrDefault(x => x.IsDefault);
            }
        }
    }
}
