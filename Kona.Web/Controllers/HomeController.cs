using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kona.App.Services;
using Kona.Model;
using NHibernate;

namespace Kona.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        StoreService _service;
        ISession _session;

        public HomeController(ISession session,
            IStoreRepository repository) {
            _session = session;
            _service = new StoreService(repository);
        }

        public ActionResult Index()
        {

            var product = _session.Get<Product>("Backpack1");

            var model = _service.GetHomeModel();

            return View(model);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
