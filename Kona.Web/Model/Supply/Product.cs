using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kona.Model {
    
    public enum InventoryStatus {
        InStock=1, 
        BackOrder=2,
        PreOrder=3,
        SpecialOrder=4,
        Discontinued=5,
        CurrentlyUnavailable=6
    }

    public enum DeliveryMethod
    {
        Shipped = 1,
        Download = 2
    }

    
    public class Product {



        public Product() {
        }        

        public static Product New(string sku, string name, decimal price) {
            var result = new Product();
            result.SKU = sku;
            result.Name = name;
            result.Price = price;
            return result;
        }

        public string SKU { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public decimal DiscountPercent { get; set; }
        public string Manufacturer { get; set; }
        public DeliveryMethod Delivery { get; set; }
        public decimal WeightInPounds { get; set; }
        public bool IsTaxable { get; set; }
        public InventoryStatus Inventory { get; set; }
        public bool AllowBackOrder { get; set; }
        public string EstimatedDelivery { get; set; }
        public string DefaultImage { get; set; }
        public decimal DiscountedPrice
        {
            get { return Price * (1.0M - DiscountPercent); } 
        }


        //TODO: These should be readonly
        public IQueryable<Image> Images { get; set; }
        public IQueryable<Product> Related { get; set; }
        public IQueryable<Product> CrossSells { get; set; }
        public IQueryable<Descriptor> Descriptors { get; set; }
        public IQueryable<Product> Recommended { get; set; }
        public IQueryable<Category> Categories { get; set; }
        public IQueryable<InventoryRecord> InventoryRecords { get; set; }
        
        #region Object overrides
        public override bool Equals(object obj) {
            if (obj is Product) {
                Product compareTo = (Product)obj;
                return compareTo.SKU == this.SKU;
            } else {
                return base.Equals(obj);
            }
        }

        public override string ToString() {
            return this.Name;
        }
        public override int GetHashCode() {
            return this.SKU.GetHashCode();
        }
        #endregion
    }
}
