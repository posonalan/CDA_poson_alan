using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class EtatCommandeDTOIn
    {
        public EtatCommandeDTOIn()
        { }
        public string LibelleEtatCommande { get; set; }
    }
    public partial class EtatCommandeDTOOut
    {
        public EtatCommandeDTOOut()
        { }

        public int IdEtatCommande { get; set; }
        public string LibelleEtatCommande { get; set; }
    }
}
