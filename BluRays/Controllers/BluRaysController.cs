using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BluRays.DALs;
using BluRays.Models;
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
            // Create a new Blu-ray DAL
            var blurayDAL = new BluRayDAL();

            // Get the genres and store them
            var genres = blurayDAL.GetGenres();

            // Select genres and make them selectable items
            var options = genres.Select(g => new SelectListItem() { Text = g, Value = g });

            ViewBag.Genres = options;

            return View();
        }


        public IActionResult SearchResult(string title, string genre, int? minLength, int? maxLength)
        {
            // Create a new Blu-ray DAL
            var dal = new BluRayDAL();

            // repeat request as information is not retained
            var genres = dal.GetGenres();

            // Select genres and make them selectable items
            var options = genres.Select(g => new SelectListItem() { Text = g, Value = g });

            ViewBag.Genres = options;

            // Account for null values by conditions
            if (minLength == null)
            {
                minLength = 0;
            }

            if (maxLength == null)
            {
                maxLength = 1000;
            }

            IList<BluRay> bluRays = dal.GetBluRaysBetween(title, genre, minLength, maxLength);

            return View(bluRays);
        }
    }
}