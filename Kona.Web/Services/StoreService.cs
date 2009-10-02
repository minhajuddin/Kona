using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Kona.Model;
using Kona.ViewModels;

namespace Kona.App.Services {
    public class StoreService {
        
        IStoreRepository _repo;
        public StoreService(IStoreRepository repo){
            _repo = repo;
        }

        public ProductListViewModel GetCategoryModel(int categoryID) {
            var result = new ProductListViewModel();

            //add the featured product
            result.FeaturedProducts = _repo.GetProducts(categoryID);

            //categories
            result.Categories = _repo.GetCategories();
            result.SelectedCategory = _repo.GetCategories().SingleOrDefault(x => x.ID == categoryID);

            //organize them
            result.Categories.ToList().ForEach(x => x.SubCategories = result.Categories.Where(y => y.ParentID == x.ID).ToList());


            return result;


        }
        public ProductListViewModel GetHomeModel() {
            var result = new ProductListViewModel();

            //add the featured product
            result.FeaturedProducts = _repo.GetFeaturedProducts();

            //categories
            result.Categories = _repo.GetCategories();
            
            //organize them
            result.Categories.ToList().ForEach(x => x.SubCategories = result.Categories.Where(y => y.ParentID == x.ID).ToList());


            return result;


        }

        public DetailsViewModel GetDetails(string sku) {
            var result = new DetailsViewModel();
            //categories
            result.Categories = _repo.GetCategories();

            //organize them
            result.Categories.ToList().ForEach(x => x.SubCategories = result.Categories.Where(y => y.ParentID == x.ID).ToList());

            result.SelectedProduct = _repo.GetProduct(sku);

            return result;

        }
    }
}
