using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class FournisseurDTOIn
    {
        public FournisseurDTOIn()
        { }
        public string NomFournisseur { get; set; }
    }
    public partial class FournisseurDTOOut
    {
        public FournisseurDTOOut()
        { }
        public int IdFournisseur { get; set; }
        public string NomFournisseur { get; set; }
    }
}
