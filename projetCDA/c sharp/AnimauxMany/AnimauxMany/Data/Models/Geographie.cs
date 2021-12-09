using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace AnimauxMany.Data.Models
{
    public partial class Geographie
    {
        public Geographie()
        {
            MilieuVies = new HashSet<MilieuVie>();
        }

        public int IdGeographie { get; set; }
        public string LibelleGeographie { get; set; }

        public virtual ICollection<MilieuVie> MilieuVies { get; set; }
    }
}
