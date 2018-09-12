using BluRays.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BluRays.DALs
{
    public interface IBluRayDAL
    {
        IList<BluRay> GetBluRays();
        IList<string> GetGenres();
        BluRay GetBluRay(int id);
        IList<BluRay> GetBluRaysBetween(string title, 
            string genre, int? minLength, int? maxLength);

    }
}
