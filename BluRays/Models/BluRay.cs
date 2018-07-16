using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BluRays.Models
{
    public class BluRay
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Rating { get; set; }
        public string Genre { get; set; }
        public string Director { get; set; }
        public string Writer { get; set; }
        public int ReleaseYear { get; set; }
        public int Runtime { get; set; }
        public string ImageName { get; set; }
    }
}
