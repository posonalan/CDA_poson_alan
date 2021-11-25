using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace GestionAnimaux.Data.Models
{
    public class Aliment
    {
        [Key]
        public int IdAliment { get; set; }
        public string Nom { get; set; }


        internal void Dump()
        {
            throw new NotImplementedException();
        }
    }
}
