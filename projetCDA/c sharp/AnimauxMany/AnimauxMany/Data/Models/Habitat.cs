using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Habitat
    {
        public Habitat()
        {
            Animaux = new HashSet<Animaux>();
        }

        public int IdHabitat { get; set; }
        public string LibelleHabitat { get; set; }

        public virtual ICollection<Animaux> Animaux { get; set; }
    }
}
