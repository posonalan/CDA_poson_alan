using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
    public class CategoriesPlatsDTOIn
    {
        public int IdCategoriePlat { get; set; }
        public string LibelleCategoriePlat { get; set; }
    }

    public class CategoriesPlatsDTOOut
    {
        public CategoriesPlatsDTOOut()
        {
            Plats = new HashSet<Plat>();
        }

        public int IdCategoriePlat { get; set; }
        public string LibelleCategoriePlat { get; set; }

        public virtual ICollection<Plat> Plats { get; set; }
    }
}
