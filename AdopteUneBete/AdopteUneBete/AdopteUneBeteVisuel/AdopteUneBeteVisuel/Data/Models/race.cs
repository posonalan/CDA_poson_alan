using System;
using System.Collections.Generic;

#nullable disable

namespace AdopteUneBeteVisuel.Data.Models
{
    public partial class race
    {
        public race()
        {
            ListAnimaux = new HashSet<animaux>();
            ListNutritions = new HashSet<nutrition>();
        }

        public int Id_Race { get; set; }
        public string libelle { get; set; }
        public int Id_Espece { get; set; }

        public virtual espece Espece { get; set; }
        public virtual ICollection<animaux> ListAnimaux { get; set; }
        public virtual ICollection<nutrition> ListNutritions { get; set; }
    }
}
