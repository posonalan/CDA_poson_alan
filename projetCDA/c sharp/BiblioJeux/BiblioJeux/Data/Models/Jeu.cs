using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Jeu
    {
        public Jeu()
        {
            Consolejeus = new HashSet<Consolejeu>();
            Profiles = new HashSet<Profile>();
        }

        public int IdJeu { get; set; }
        public string LibelleJeu { get; set; }
        public int IdMarque { get; set; }

        public virtual Marque IdMarqueNavigation { get; set; }
        public virtual ICollection<Consolejeu> Consolejeus { get; set; }
        public virtual ICollection<Profile> Profiles { get; set; }
    }
}
