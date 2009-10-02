using System;
using System.Collections;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;

namespace Kona.Model
{
    public interface IStoreRepository
    {
        IQueryable<Product> GetFeaturedProducts();
        IQueryable<Product> GetProducts();
        IQueryable<Product> GetProducts(int categoryID);
        Product GetProduct(string sku);
        IQueryable<Category> GetCategories();
    }
}