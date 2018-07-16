using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using BluRays.Models;
using BluRays.DALs;

namespace BluRays.Controllers
{
    public class HomeController : Controller
    {
        static BluRayDAL blurayDAL = new BluRayDAL();

        public IActionResult Index()
        {
            IList<BluRay> allBluRays = blurayDAL.GetBluRays();
            return View(allBluRays);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            BluRay bluRay = blurayDAL.GetBluRay(id);
            return View(bluRay);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
