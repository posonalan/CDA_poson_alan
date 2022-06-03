using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Dtos
{
    public class AlimentationsDTOIn
    {
        public string libelle { get; set; }
    }

    public class AlimentationsDTOOut
    {
        public AlimentationsDTOOut()
        {
            ListNutritions = new HashSet<NutritionsDTORaces>();
        }

        public int Id_alimentation { get; set; }
        public string libelle { get; set; }

        public virtual ICollection<NutritionsDTORaces> ListNutritions { get; set; }
    }
}
