using System;
using System.Collections.Generic;

#nullable disable

namespace AdopteUneBeteVisuel.Data.Models
{
    public partial class espece
    {
        public espece()
        {
            ListRaces = new HashSet<race>();
        }

        public int Id_Espece { get; set; }
        public string libelle { get; set; }

        public virtual ICollection<race> ListRaces { get; set; }
    }
}
