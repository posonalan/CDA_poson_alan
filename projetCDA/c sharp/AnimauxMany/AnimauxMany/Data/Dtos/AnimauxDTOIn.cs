using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Dtos
{
    public class AnimauxDTOIn
    {
        public AnimauxDTOIn()
        {
        }
        public int IdAnimaux { get; set; }
        public string LibelleAnimal { get; set; }
        public string TypeAnimal { get; set; }
        public int IdHabitat { get; set; }
        public int IdAlimentations { get; set; }
        public int IdGeographie { get; set; }
    }
}
