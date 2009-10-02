using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Kona.App.Services;
using Kona.Model;
using Kona.ViewModels;

namespace Kona.Controllers
{
    public class ProductController : Controller
    {

        StoreService _service;

        public ProductController(IStoreRepository repository) {
            _service = new StoreService(repository);
        }
        
        //
        // GET: /Product/

        public ActionResult Index(int? id)
        {
            ProductListViewModel model=null;
            //if an ID is sent in it's a category
            if (id.HasValue) {
                model = _service.GetCategoryModel((int)id);
            } else {
                RedirectToAction("Index", "Home");
            }
            return View(model);
        }

        //
        // GET: /Product/Details/5

        public ActionResult Details(string id)
        {

            var model = _service.GetDetails(id);
            return View(model);
        }

        //
        // GET: /Product/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Product/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Product/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Product/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
