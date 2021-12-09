using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Console
    {
        public Console()
        {
            Consoleaccessoires = new HashSet<Consoleaccessoire>();
            Consolejeus = new HashSet<Consolejeu>();
            Profiles = new HashSet<Profile>();
        }

        public int IdConsole { get; set; }
        public string LibelleConsole { get; set; }
        public int IdMarque { get; set; }

        public virtual Marque IdMarqueNavigation { get; set; }
        public virtual ICollection<Consoleaccessoire> Consoleaccessoires { get; set; }
        public virtual ICollection<Consolejeu> Consolejeus { get; set; }
        public virtual ICollection<Profile> Profiles { get; set; }
    }
}
