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
        private IBluRayDAL dal;

        public HomeController(IBluRayDAL dal)
        {
            this.dal = dal;
        }

        public IActionResult Index()
        {
            IList<BluRay> allBluRays = dal.GetBluRays();
            return View(allBluRays);
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            BluRay bluRay = dal.GetBluRay(id);
            return View(bluRay);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
