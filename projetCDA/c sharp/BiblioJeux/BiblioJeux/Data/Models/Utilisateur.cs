using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Utilisateur
    {
        public Utilisateur()
        {
            Profiles = new HashSet<Profile>();
        }

        public int IdUtilisateur { get; set; }
        public string PseudoUtilisateur { get; set; }
        public string MotDePasseUtilisateur { get; set; }
        public string EmailUtilisateur { get; set; }
        public string Statue { get; set; }
        public string PhotoCollection { get; set; }

        public virtual ICollection<Profile> Profiles { get; set; }
    }
}
