using System;
using System.Collections.Generic;

#nullable disable

namespace ApiMultiBillet.Data.Models
{
    public partial class Billeterie
    {
        public int IdBillet { get; set; }
        public string LibelleBillet { get; set; }

        public virtual Stagiaire Stagiaire { get; set; }
    }
}
