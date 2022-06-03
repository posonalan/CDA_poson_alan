using System;
using System.Collections.Generic;

#nullable disable

namespace AdopteUneBeteVisuel.Data.Models
{
    public partial class alimentation
    {
        public alimentation()
        {
            ListNutritions = new HashSet<nutrition>();
        }

        public int Id_alimentation { get; set; }
        public string libelle { get; set; }

        public virtual ICollection<nutrition> ListNutritions { get; set; }
    }
}
