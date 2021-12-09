using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Primeur.Data
{
    public class Legumes
    {
        [Key]
        public int Id { get; set; }
        [MaxLength(50)]
        public string Nom { get; set; }
        [MaxLength(50)]
        public string Variete { get; set; }
        [MaxLength(50)]
        public int Quantite { get; set; }
    }
}
