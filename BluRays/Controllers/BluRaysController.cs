using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace BluRays.Controllers
{
    public class BluRaysController : Controller
    {
        /// <summary>
        /// The request to display an empty search page
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            return View();
        }
    }
}