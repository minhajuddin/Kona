using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using StructureMap;
using StructureMap.Configuration.DSL;
using StructureMap.Configuration;
using StructureMap.Attributes;
using StructureMap.Pipeline;
using Kona.Model;
using Kona.App.Repositories;

namespace Commerce.MVC.Web {
    public static class Bootstrapper {

        public static void ConfigureStructureMap() {
            StructureMapConfiguration.AddRegistry(new StoreRegistry());
        }
    }

    public class StoreRegistry : Registry {
        protected override void configure() {
            
            ForRequestedType<IStoreRepository>()
                .TheDefaultIsConcreteType<LinqRepository>();
            

           
        }
    }
}
