using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Animaux
    {
        public Animaux()
        {
            MilieuVies = new HashSet<MilieuVie>();
        }

        public int IdAnimaux { get; set; }
        public string LibelleAnimal { get; set; }
        public string TypeAnimal { get; set; }
        public int IdHabitat { get; set; }
        public int IdAlimentations { get; set; }

        public virtual Alimentation IdAlimentationsNavigation { get; set; }
        public virtual Habitat IdHabitatNavigation { get; set; }
        public virtual ICollection<MilieuVie> MilieuVies { get; set; }
    }
}
