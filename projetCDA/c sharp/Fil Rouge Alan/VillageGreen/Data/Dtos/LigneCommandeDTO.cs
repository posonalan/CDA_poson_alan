using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class LigneCommandeDTOIn
    {
        public LigneCommandeDTOIn()
        { }
        public int? IdProduit { get; set; }
        public int? IdCommande { get; set; }
        public int? QuantiteProduit { get; set; }

    }
    public partial class LigneCommandeDTOOut
    {
        public LigneCommandeDTOOut()
        { }

        public int IdLigneCommande { get; set; }
        public int? IdProduit { get; set; }
        public int? IdCommande { get; set; }
        public int? QuantiteProduit { get; set; }

    }
}
