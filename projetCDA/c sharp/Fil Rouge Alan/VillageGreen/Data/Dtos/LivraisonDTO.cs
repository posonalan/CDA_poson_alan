using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class LivraisonDTOIn
    {
        public LivraisonDTOIn()
        { }
        public int? IdCommande { get; set; }
        public int? IdAdresse { get; set; }
        public DateTime? DateLivraison { get; set; }
        public int? QuantiteLivraison { get; set; }

    }
    public partial class LivraisonDTOOut
    {
        public LivraisonDTOOut()
        { }
        public int IdLivraison { get; set; }
        public int? IdCommande { get; set; }
        public int? IdAdresse { get; set; }
        public DateTime? DateLivraison { get; set; }
        public int? QuantiteLivraison { get; set; }

    }
}
