using _7._GestionStocks.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Dtos
{
    public class CategoriesDTOIn
    {
        public string LibelleCategorie { get; set; }
        public int IdTypeProduit { get; set; }
    }

    public class CategoriesDTOOut
    {
        public CategoriesDTOOut()
        {
            ListArticles = new HashSet<ArticlesDTOIn>();
        }

        public int IdCategorie { get; set; }
        public string LibelleCategorie { get; set; }
        public int IdTypeProduit { get; set; }

        public virtual TypesProduitsDTOIn TypesProduits { get; set; }
        public virtual ICollection<ArticlesDTOIn> ListArticles { get; set; }
    }
}
