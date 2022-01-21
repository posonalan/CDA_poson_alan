using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Dtos
{
    public partial class CommandeDTOIn
    {
        public CommandeDTOIn()
        { }
        public string NumeroCommande { get; set; }
        public DateTime? DateCommande { get; set; }
        public int IdUser { get; set; }
        public int IdAdresse { get; set; }

    }

    public partial class CommandeDTOOut
    {
        public CommandeDTOOut()
        { }
        public int IdCommande { get; set; }
        public string NumeroCommande { get; set; }
        public DateTime? DateCommande { get; set; }
        public int IdUser { get; set; }
        public int IdAdresse { get; set; }
        public virtual Adresse Adresse { get; set; }
        public virtual Client Client { get; set; }
    }

}