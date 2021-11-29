using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Accessoire
    {
        public Accessoire()
        {
            Consoleaccessoires = new HashSet<Consoleaccessoire>();
            Profiles = new HashSet<Profile>();
        }

        public int IdAccessoire { get; set; }
        public string LibelleAccessoire { get; set; }
        public int IdMarque { get; set; }

        public virtual Marque IdMarqueNavigation { get; set; }
        public virtual ICollection<Consoleaccessoire> Consoleaccessoires { get; set; }
        public virtual ICollection<Profile> Profiles { get; set; }
    }
}
