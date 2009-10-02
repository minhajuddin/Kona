using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kona.App.Services;
using Kona.Model;

namespace Kona.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        StoreService _service;
        
        public HomeController(IStoreRepository repository) {
            _service = new StoreService(repository);
        }

        public ActionResult Index()
        {
            var model = _service.GetHomeModel();

            return View(model);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
