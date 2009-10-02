using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kona.Model {

   
    public class Category {

        public Category() : this("") { }

        public Category(string name) {
            Name = name;
            SubCategories = new List<Category>();
        }


        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int ParentID { get; set; }
        public bool IsDefault { get; set; }
        public IList<Category> SubCategories { get; set; }
        #region object overrides
        public override bool Equals(object obj) {
            if (obj is Category) {
                Category compareTo = (Category)obj;
                return compareTo.Name.Equals(this.Name, StringComparison.InvariantCultureIgnoreCase);
            } else {
                return base.Equals(obj);
            }
        }

        public override string ToString() {
            return this.Name;
        }
        public override int GetHashCode() {
            return this.Name.GetHashCode();
        }
        #endregion

    }
}
