using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Contenuplat
    {
        public int IdContenuPlat { get; set; }
        public int? IdProduit { get; set; }
        public int? IdPlat { get; set; }
        public int? Quantite { get; set; }

        public virtual Plat IdPlatNavigation { get; set; }
        public virtual Produit IdProduitNavigation { get; set; }
    }
}
