using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Consolejeu
    {
        public int IdConsoleJeu { get; set; }
        public int? IdJeu { get; set; }
        public int? IdConsole { get; set; }

        public virtual Console IdConsoleNavigation { get; set; }
        public virtual Jeu IdJeuNavigation { get; set; }
    }
}
