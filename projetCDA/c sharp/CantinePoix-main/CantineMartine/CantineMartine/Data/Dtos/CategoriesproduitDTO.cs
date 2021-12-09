using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
    public class CategoriesproduitDTOIn
    {
        public int IdCategorieProduit { get; set; }
        public string LibelleCategorieProduit { get; set; }
    }

    public class CategoriesproduitDTOOut
    {
       public string LibelleCategorieProduit { get; set; }
    }
}
