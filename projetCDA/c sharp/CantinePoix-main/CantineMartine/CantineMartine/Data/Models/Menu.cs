using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Menu
    {
        public Menu()
        {
            Contenumenus = new HashSet<Contenumenu>();
        }

        public int IdMenu { get; set; }
        public int? NumeroSemaine { get; set; }

        public virtual ICollection<Contenumenu> Contenumenus { get; set; }
    }
}
