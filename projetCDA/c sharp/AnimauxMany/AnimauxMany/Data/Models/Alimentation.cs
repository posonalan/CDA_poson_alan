using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Alimentation
    {
        public Alimentation()
        {
            Animaux = new HashSet<Animaux>();
        }

        public int IdAlimentations { get; set; }
        public string LibelleAliment { get; set; }

        public virtual ICollection<Animaux> Animaux { get; set; }
    }
}
