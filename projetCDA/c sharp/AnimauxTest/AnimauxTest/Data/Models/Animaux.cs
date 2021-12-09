using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxTest.Data.Models
{
    public partial class Animaux
    {
        public int IdAnimaux { get; set; }
        public string LibelleAnimal { get; set; }
        public string TypeAnimal { get; set; }
        public int IdHabitat { get; set; }
        public int IdAlimentations { get; set; }
        public int IdGeographie { get; set; }

        public virtual Alimentation IdAlimentationsNavigation { get; set; }
        public virtual Geographie IdGeographieNavigation { get; set; }
        public virtual Habitat IdHabitatNavigation { get; set; }
    }
}
