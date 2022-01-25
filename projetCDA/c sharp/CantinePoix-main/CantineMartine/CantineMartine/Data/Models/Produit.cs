using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Produit
    {
        public Produit()
        {
            Contenuplats = new HashSet<Contenuplat>();
        }

        public int IdProduit { get; set; }
        public string LibelleProduit { get; set; }
        public int? QuantiteProduit { get; set; }
        public int IdCategorieProduit { get; set; }

        public virtual Categoriesproduit CategProduit { get; set; }
        public virtual ICollection<Contenuplat> Contenuplats { get; set; }

    }
}
