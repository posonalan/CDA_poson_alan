using _7._GestionStocks.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Dtos
{
    public class ArticlesDTOIn
    {
        public string LibelleArticle { get; set; }
        public int? QuantiteStockee { get; set; }
        public int IdCategorie { get; set; }
    }

    public class ArticlesDTOOut
    {
        public int IdArticle { get; set; }
        public string LibelleArticle { get; set; }
        public int? QuantiteStockee { get; set; }
        public int IdCategorie { get; set; }
        public virtual CategoriesDTOIn Categorie { get; set; }
    }
}
