using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
    public class ContenuplatsDTOIn
    {
        public int? IdProduit { get; set; }
        public int? IdPlat { get; set; }
        public int? Quantite { get; set; }
    }
    public class ContenuplatsDTOOut
    {
        public int IdContenuPlat { get; set; }
        public int? IdProduit { get; set; }
        public int? IdPlat { get; set; }
        public int? Quantite { get; set; }

        public virtual Plat IdPlatNavigation { get; set; }
        public virtual Produit IdProduitNavigation { get; set; }
    }
}
