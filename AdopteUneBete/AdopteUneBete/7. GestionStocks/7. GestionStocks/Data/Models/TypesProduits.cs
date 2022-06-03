using System;
using System.Collections.Generic;

#nullable disable

namespace _7._GestionStocks.Data.Models
{
    public partial class TypesProduits
    {
        public TypesProduits()
        {
            ListCategories = new HashSet<Categories>();
        }

        public int IdTypeProduit { get; set; }
        public string LibelleTypeProduit { get; set; }

        public virtual ICollection<Categories> ListCategories { get; set; }
    }
}
