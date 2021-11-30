using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class MilieuVie
    {

        public MilieuVie()
        {
            Animaux = new HashSet<Animaux>();
            Geographie = new HashSet<Geographie>();
        }

        public int IdMilieuVie { get; set; }
        public int? IdAnimaux { get; set; }
        public int? IdGeographie { get; set; }

        public virtual Animaux IdAnimauxNavigation { get; set; }
        public virtual Geographie IdGeographieNavigation { get; set; }
    }
}
