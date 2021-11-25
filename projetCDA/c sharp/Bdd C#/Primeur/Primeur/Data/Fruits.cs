using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Primeur.Data
{
    public class Fruits
    {
        [Key]
        public  string Nom { get; set; }
        public string Variete { get; set; }
        public int Quantite { get; set; }



    }
}
