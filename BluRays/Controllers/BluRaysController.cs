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

        private IBluRayDAL dal;

        public BluRaysController(IBluRayDAL dal)
        {
            this.dal = dal;
        }

        /// <summary>
        /// The request to display an empty search page
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            // Get the genres and store them
            var genres = dal.GetGenres();

            // Select genres and make them selectable items
            var options = genres.Select(g => new SelectListItem() { Text = g, Value = g });

            ViewBag.Genres = options;

            return View();
        }


        public IActionResult SearchResult(string title, string genre, int? minLength, int? maxLength)
        {
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