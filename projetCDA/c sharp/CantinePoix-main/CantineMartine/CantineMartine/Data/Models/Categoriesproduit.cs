using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Categoriesproduit
    {
        public Categoriesproduit()
        {
            Produits = new HashSet<Produit>();
        }

        public int IdCategorieProduit { get; set; }
        public string LibelleCategorieProduit { get; set; }

        public virtual ICollection<Produit> Produits { get; set; }
    }
}
