using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxTest.Data.Models
{
    public partial class Geographie
    {
        public Geographie()
        {
            Animauxes = new HashSet<Animaux>();
        }

        public int IdGeographie { get; set; }
        public string LibelleGeographie { get; set; }

        public virtual ICollection<Animaux> Animauxes { get; set; }
    }
}
