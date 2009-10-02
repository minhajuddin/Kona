using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Kona.Model;
using Kona.Linq;

namespace Kona.App.Repositories {
    public class LinqRepository:IStoreRepository {

        DB _db;
        public LinqRepository() {
            _db = new DB();
        }
        IQueryable<Category> MapCategory(IQueryable<Kona.Linq.Model.Category> query) {
            return from c in query
                   select new Category {
                       ID=c.CategoryID,
                       Name=c.Name,
                       Description=c.Description,
                       IsDefault=c.IsDefault,
                       ParentID=c.ParentID ?? 0
                   };
         
        }
        IQueryable<Descriptor> MapDescriptor(IQueryable<Kona.Linq.Model.ProductDescriptor> query) {
            return from d in query
                   select new Descriptor {
                       Title=d.Title,
                       Body=d.Body
                   };
        }


        IQueryable<Product> MapProduct(IQueryable<Kona.Linq.Model.Product> query) {
            return from p in query
                   let descriptors=MapDescriptor(_db.ProductDescriptors.Where(x=>x.SKU==p.SKU))
                   select new Product {
                       SKU = p.SKU,
                       Name = p.ProductName,
                       Price = p.BasePrice,
                       Delivery = (DeliveryMethod)p.DeliveryMethodID,
                       Inventory = (InventoryStatus)p.InventoryStatusID,
                       EstimatedDelivery = p.EstimatedDelivery,
                       AllowBackOrder = p.AllowBackOrder,
                       WeightInPounds = p.WeightInPounds,
                       IsTaxable = p.IsTaxable,
                       DefaultImage=p.DefaultImageFile,
                       Descriptors = descriptors,
                       
                   };
        }
        public IQueryable<Product> GetProducts() {
            return MapProduct(_db.Products);
        }
        public Product GetProduct(string sku) {
            var query = _db.Products.Where(x => x.SKU == sku);

            //set the images etc
            var result = MapProduct(query).SingleOrDefault();


            var related = from p in _db.Products
                          join pr in _db.Products_Relateds on p.SKU equals pr.SKU
                          where pr.RelatedSKU == sku
                          select p;
            result.Related = MapProduct(related);
            return result;
        }
        public IQueryable<Product> GetProducts(int categoryID) {
            var query = from p in _db.Products
                        join cp in _db.Categories_Products on p.SKU equals cp.SKU
                        where cp.CategoryID == categoryID
                        select p;

            return MapProduct(query);
        }

        public IQueryable<Category> GetCategories() {
            return MapCategory(_db.Categories);
        }


        public IQueryable<Product> GetFeaturedProducts() {
            return GetProducts(33);
        }

    }
}
