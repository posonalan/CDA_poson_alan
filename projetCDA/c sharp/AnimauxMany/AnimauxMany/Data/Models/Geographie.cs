using System;
using System.Collections.Generic;

#nullable disable

namespace AnimauxMany.Data.Models
{
    public partial class Geographie
    {
        public Geographie()
        {
            Milieuvies = new HashSet<Milieuvie>();
        }

        public int IdGeographie { get; set; }
        public string LibelleGeographie { get; set; }

        public virtual ICollection<Milieuvie> Milieuvies { get; set; }
    }
}
