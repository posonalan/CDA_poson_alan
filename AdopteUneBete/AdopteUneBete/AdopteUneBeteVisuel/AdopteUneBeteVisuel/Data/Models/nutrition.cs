using System;
using System.Collections.Generic;

#nullable disable

namespace AdopteUneBeteVisuel.Data.Models
{
    public partial class nutrition
    {
        public int Id_nutrition { get; set; }
        public int? Id_Race { get; set; }
        public int? Id_alimentation { get; set; }

        public virtual race Race { get; set; }
        public virtual alimentation Alimentation { get; set; }
    }
}
