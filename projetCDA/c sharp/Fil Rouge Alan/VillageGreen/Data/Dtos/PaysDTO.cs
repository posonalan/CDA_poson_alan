using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class PaysDTOIn
    {
        public PaysDTOIn()
        { }
        public string NomPays { get; set; }

    }
    public partial class PaysDTOOut
    {
        public PaysDTOOut()
        { }
        public int IdPays { get; set; }
        public string NomPays { get; set; }

    }
}
