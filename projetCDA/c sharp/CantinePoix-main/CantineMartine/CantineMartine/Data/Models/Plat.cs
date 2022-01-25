using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Plat
    {
        public Plat()
        {
            Contenumenus = new HashSet<Contenumenu>();
            Contenuplats = new HashSet<Contenuplat>();
        }

        public int IdPlat { get; set; }
        public string LibellePlat { get; set; }
        public int IdCategoriePlat { get; set; }

        public virtual Categoriesplat CategoriePlat { get; set; }
        public virtual ICollection<Contenumenu> Contenumenus { get; set; }
        public virtual ICollection<Contenuplat> Contenuplats { get; set; }
    }
}
