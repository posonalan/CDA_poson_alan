using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Marque
    {
        public Marque()
        {
            Accessoires = new HashSet<Accessoire>();
            Consoles = new HashSet<Console>();
            Jeus = new HashSet<Jeu>();
        }

        public int IdMarque { get; set; }
        public string LibelleMarque { get; set; }

        public virtual ICollection<Accessoire> Accessoires { get; set; }
        public virtual ICollection<Console> Consoles { get; set; }
        public virtual ICollection<Jeu> Jeus { get; set; }
    }
}
