using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data
{
   public partial class MenuLienContenuMenuDTO
    {

        public MenuLienContenuMenuDTO()
        {
        }
        public int IdContenuMenu { get; set; }
        public int? IdMenu { get; set; }
        public int? IdPlat { get; set; }
        public DateTime? DateJour { get; set; }

        public virtual Menu IdMenuNavigation { get; set; }
        public virtual Plat IdPlatNavigation { get; set; }
    }
}


