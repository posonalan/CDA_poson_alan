using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Dtos
{
    public class EspecesDTOIn
    {
        public string libelle { get; set; }
    }

    public class EspecesDTOOut
    {
        public EspecesDTOOut()
        {
            ListRaces = new HashSet<RacesDTOIn>();
        }

        public int Id_Espece { get; set; }
        public string libelle { get; set; }

        public virtual ICollection<RacesDTOIn> ListRaces { get; set; }
    }
}
