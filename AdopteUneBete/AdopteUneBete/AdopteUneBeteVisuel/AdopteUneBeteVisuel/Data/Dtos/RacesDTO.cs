using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Dtos
{
    public class RacesDTOIn
    {
        public string libelle { get; set; }
        public int Id_Espece { get; set; }
    }

    public class RacesDTOOut
    {
        public RacesDTOOut()
        {
            ListAnimaux = new HashSet<AnimauxDTOIn>();
            ListNutritions = new HashSet<NutritionsDTOAlimentations>();
        }

        public int Id_Race { get; set; }
        public string libelle { get; set; }
        public int Id_Espece { get; set; }

        public virtual EspecesDTOIn Espece { get; set; }
        public virtual ICollection<AnimauxDTOIn> ListAnimaux { get; set; }
        public virtual ICollection<NutritionsDTOAlimentations> ListNutritions { get; set; }
    }
}
