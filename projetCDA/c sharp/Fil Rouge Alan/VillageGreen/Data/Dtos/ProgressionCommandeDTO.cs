using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class ProgressionCommandeDTOIn
    {
        public ProgressionCommandeDTOIn()
        { }
        public int? IdCommande { get; set; }
        public int? IdEtatCommande { get; set; }
        public DateTime DateEtatCommande { get; set; }
    }
    public partial class ProgressionCommandeDTOOut
    {
        public ProgressionCommandeDTOOut()
        { }
        public int IdProgressionsCommande { get; set; }
        public int? IdCommande { get; set; }
        public int? IdEtatCommande { get; set; }
        public DateTime DateEtatCommande { get; set; }
    }
}
