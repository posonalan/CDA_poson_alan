using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class HistoriqueTVADTOIn
    {
        public HistoriqueTVADTOIn()
        { }
        public int? IdProduit { get; set; }
        public int? IdTva { get; set; }
        public DateTime DateTva { get; set; }
    }
    public partial class HistoriqueTVADTOOut
    {
        public HistoriqueTVADTOOut()
        { }
        public int IdHistoriqueTva { get; set; }
        public int? IdProduit { get; set; }
        public int? IdTva { get; set; }
        public DateTime DateTva { get; set; }
    }
}
