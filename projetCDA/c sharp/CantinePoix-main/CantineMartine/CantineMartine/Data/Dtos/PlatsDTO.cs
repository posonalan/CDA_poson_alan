using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
    public class PlatsDTOIn
    {
        public string LibellePlat { get; set; }
        public int IdCategoriePlat { get; set; }
    }

    public class PlatsDTOOut
    {
        public int IdPlat { get; set; }
        public string LibellePlat { get; set; }
        public int IdCategoriePlat { get; set; }
        public string LibelleCategoriePlat { get; set; }
    }
}
