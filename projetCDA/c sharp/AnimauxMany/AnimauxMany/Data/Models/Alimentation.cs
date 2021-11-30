using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Alimentation
    {
        public Alimentation()
        {
            Animauxes = new HashSet<Animaux>();
        }

        public int IdAlimentations { get; set; }
        public string LibelleAliment { get; set; }

        public virtual ICollection<Animaux> Animauxes { get; set; }
    }
}
