using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StructureMap;

namespace Kona.App.Infrastructure {
    public class KonaControllerFactory:DefaultControllerFactory {
        protected override IController GetControllerInstance(Type controllerType) {
            IController result = null;
            if (controllerType != null) {
                try {
                    result = ObjectFactory.GetInstance(controllerType) as Controller;

                } catch (StructureMapException) {
                    System.Diagnostics.Debug.WriteLine(ObjectFactory.WhatDoIHave());
                    throw;
                }
            }
            return result;
        }
    }
}
