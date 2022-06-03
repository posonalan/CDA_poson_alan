using System;
using System.Collections.Generic;

#nullable disable

namespace _7._GestionStocks.Data.Models
{
    public partial class Categories
    {
        public Categories()
        {
            ListArticles = new HashSet<Articles>();
        }

        public int IdCategorie { get; set; }
        public string LibelleCategorie { get; set; }
        public int IdTypeProduit { get; set; }

        public virtual TypesProduits TypesProduits { get; set; }
        public virtual ICollection<Articles> ListArticles { get; set; }
    }
}
