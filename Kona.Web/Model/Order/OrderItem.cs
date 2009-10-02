using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kona.Model {
    public class OrderItem {

        Product _product;
        public Product Product {
            get {
                return _product;
            }
        }
        int _quantity;
        public int Quantity {
            get {
                return _quantity;
            }
        }
        DateTime _dateAdded;
        public DateTime DateAdded {
            get {
                return _dateAdded;
            }
        }

        public decimal LineTotal
        {
            get
            {
                return this.Quantity*(this.Product.DiscountedPrice);

            }
        }
        public decimal ItemsWeight
        {
            get
            {
                return this.Quantity * (this.Product.WeightInPounds);

            }
        }

        private OrderItem() { }
        public OrderItem(Product product):this(product,1){}
        public OrderItem(Product product, int quantity):this(product,quantity,DateTime.Now){}
        public OrderItem(Product product, int quantity, DateTime dateAdded)
        {
            _product = product;
            _quantity = quantity;
            _dateAdded = dateAdded;
        }

        public void AdjustQuantity(int newQuantity) {
            _quantity = newQuantity;
        }


        #region Object overrides
        public override bool Equals(object obj) {
            if (obj is OrderItem) {
                OrderItem compareTo = (OrderItem)obj;
                return compareTo.Product.SKU == this.Product.SKU;
            } else {
                return base.Equals(obj);
            }
        }

        public override string ToString() {
            return this.Product.Name+" ("+_quantity+")";
        }
        public override int GetHashCode() {
            return this.Product.SKU.GetHashCode();
        }
        #endregion
    }
}
