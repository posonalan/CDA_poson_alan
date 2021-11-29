using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Profile
    {
        public int IdProfile { get; set; }
        public int? IdUtilisateur { get; set; }
        public int? IdJeu { get; set; }
        public int? IdAccessoire { get; set; }
        public int? IdConsole { get; set; }

        public virtual Accessoire IdAccessoireNavigation { get; set; }
        public virtual Console IdConsoleNavigation { get; set; }
        public virtual Jeu IdJeuNavigation { get; set; }
        public virtual Utilisateur IdUtilisateurNavigation { get; set; }
    }
}
