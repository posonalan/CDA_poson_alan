using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Animaux
    {
        public Animaux()
        {
            Milieuvies = new HashSet<Milieuvie>();
        }

        public int IdAnimaux { get; set; }
        public string LibelleAnimal { get; set; }
        public string TypeAnimal { get; set; }
        public int IdHabitat { get; set; }
        public int IdAlimentations { get; set; }

        public virtual Alimentation IdAlimentationsNavigation { get; set; }
        public virtual Habitat IdHabitatNavigation { get; set; }
        public virtual ICollection<Milieuvie> Milieuvies { get; set; }
    }
}
