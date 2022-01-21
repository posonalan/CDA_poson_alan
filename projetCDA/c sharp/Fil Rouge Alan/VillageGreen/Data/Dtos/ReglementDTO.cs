using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class ReglementDTOIn
    {
        public ReglementDTOIn()
        { }
        public string TypePaiement { get; set; }
    }
    public partial class ReglementDTOOut
    {
        public ReglementDTOOut()
        { }
        public int IdReglement { get; set; }
        public string TypePaiement { get; set; }
    }
}
