using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BluRays.DALs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

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
            var blurayDAL = new BluRayDAL();
            var genres = blurayDAL.GetGenres();

            var options = genres.Select(g => new SelectListItem() { Text = g, Value = g });
            ViewBag.Genres = options;

            return View();
        }


        public IActionResult SearchResult(string genre, int? minLength, int? maxLength)
        {


            return View();
        }
    }
}