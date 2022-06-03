using _7._GestionStocks.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Dtos
{
    public class TypesProduitsDTOIn
    {
        public string LibelleTypeProduit { get; set; }
    }

    public class TypesProduitsDTOOut
    {
        public TypesProduitsDTOOut()
        {
            ListCategories = new HashSet<CategoriesDTOIn>();
        }

        public string LibelleTypeProduit { get; set; }

        public virtual ICollection<CategoriesDTOIn> ListCategories { get; set; }
    }
}
