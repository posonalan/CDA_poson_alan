using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class TVADTOIn
    {
        public TVADTOIn()
        { }
        public int? TauxTva { get; set; }
    }
    public partial class TVADTOOut
    {
        public TVADTOOut()
        { }
        public int IdTva { get; set; }
        public int? TauxTva { get; set; }
    }
}
