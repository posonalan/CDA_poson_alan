using System;
using System.Collections.Generic;

#nullable disable

namespace ApiMultiBillet.Data.Models
{
    public partial class Stagiaire
    {
        public int IdStagiaire { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public int IdBillet { get; set; }

        public virtual Billeterie ListeBillet { get; set; }
    }
}
