using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Categoriesplat
    {
        public Categoriesplat()
        {
            Plats = new HashSet<Plat>();
        }

        public int IdCategoriePlat { get; set; }
        public string LibelleCategoriePlat { get; set; }

        public virtual ICollection<Plat> Plats { get; set; }
    }
}
