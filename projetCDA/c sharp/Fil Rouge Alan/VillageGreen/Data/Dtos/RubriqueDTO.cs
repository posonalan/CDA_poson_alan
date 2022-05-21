using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class RubriqueDTOIn
    {
        public RubriqueDTOIn()
        { }
        public string LibelleRubrique { get; set; }
        public int? IdRubriqueMere { get; set; }
    }
    public partial class RubriqueDTOOut
    {
        public RubriqueDTOOut()
        { }
        public int IdRubrique { get; set; }
        public string LibelleRubrique { get; set; }
        public int? IdRubriqueMere { get; set; }
    }
}
