using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
    public class ContenuMenuDTOIn
    {
        public ContenuMenuDTOIn()
        { }
        public int IdContenuMenu { get; set; }
        public int? IdMenu { get; set; }
        public int? IdPlat { get; set; }
        public DateTime? DateJour { get; set; }
    }

    public class ContenuMenuDTOOut
    {
        public ContenuMenuDTOOut()
        { }  
        public int? IdMenu { get; set; }
        public int? IdPlat { get; set; }
        public DateTime? DateJour { get; set; }
    }

    


}
