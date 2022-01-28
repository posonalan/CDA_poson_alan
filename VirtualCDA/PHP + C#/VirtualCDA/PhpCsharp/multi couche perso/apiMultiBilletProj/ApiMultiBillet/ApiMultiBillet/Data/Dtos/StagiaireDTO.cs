using ApiMultiBillet.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Data.Dtos
{
    public class StagiaireDTO
    {
        public int IdStagiaire { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public int IdBillet { get; set; }
        public virtual BilleterieDTO ListeBillet { get; set; }
    }
}
