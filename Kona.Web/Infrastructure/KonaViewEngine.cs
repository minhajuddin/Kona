using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kona.App.Infrastructure {
    public class KonaViewEngine : WebFormViewEngine {
        public KonaViewEngine()
        {
            ViewLocationFormats = new[] { 
                "~/App/Views/{1}/{0}.aspx",
                "~/App/Views/{1}/{0}.ascx",
                "~/App/Views/Shared/{0}.aspx",
                "~/App/Views/Shared/{0}.ascx",
            };

            MasterLocationFormats = new[] {
                "~/App/{0}.master",
                "~/App/Shared/{0}.master",
                "~/App/Views/{1}/{0}.master",
                "~/App/Views/Shared/{0}.master",
            };
            PartialViewLocationFormats = ViewLocationFormats;
        }

    }
}
