using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Habitat
    {
        public Habitat()
        {
            Animauxes = new HashSet<Animaux>();
        }

        public int IdHabitat { get; set; }
        public string LibelleHabitat { get; set; }

        public virtual ICollection<Animaux> Animauxes { get; set; }
    }
}
