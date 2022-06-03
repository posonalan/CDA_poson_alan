using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Dtos
{
    public class NutritionsDTOIn
    {
        public int? Id_Race { get; set; }
        public int? Id_alimentation { get; set; }
    }

    public class NutritionsDTOOut
    {
        public int Id_nutrition { get; set; }
        public int? Id_Race { get; set; }
        public int? Id_alimentation { get; set; }

        public virtual RacesDTOIn Race { get; set; }
        public virtual AlimentationsDTOIn Alimentation { get; set; }
    }
    public class NutritionsDTORaces
    {
        public virtual RacesDTOIn Race { get; set; }
    }

    public class NutritionsDTOAlimentations
    {
        public virtual AlimentationsDTOIn Alimentation { get; set; }
    }
}
