using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
    public partial class MenuDTOIn
    {
        public MenuDTOIn()
        { }
        public int IdMenu { get; set; }
        public int? NumeroSemaine { get; set; }
    }

    public partial class MenuDTOOut
    {
        public MenuDTOOut()
        { }
        public int? NumeroSemaine { get; set; }

    }
}
