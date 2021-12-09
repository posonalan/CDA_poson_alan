using System;
using System.Collections.Generic;

#nullable disable

namespace CantineMartine.Data.Models
{
    public partial class Contenumenu
    {
        public int IdContenuMenu { get; set; }
        public int? IdMenu { get; set; }
        public int? IdPlat { get; set; }
        public DateTime? DateJour { get; set; }

        public virtual Menu IdMenuNavigation { get; set; }
        public virtual Plat IdPlatNavigation { get; set; }
    }
}
