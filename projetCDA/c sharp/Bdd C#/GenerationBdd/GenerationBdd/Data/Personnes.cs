using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenerationBdd.Data
{
    public class Personnes
    {
        public int Id { get; set; }
        /* [MaxLength(50)] */ /* si nous souhaitons forcé un maximal de longueur */ 
        public string Prenom { get; set; }
        /* [MaxLength(50)] */ 
        public string Nom { get; set; }
        public int Age { get; set; }
    }
}
