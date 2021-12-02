using AnimauxMany.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Dtos
{
    public class AnimauxDTOAvecLiens
    {
        public AnimauxDTOAvecLiens()
        {

        }
        public string LibelleAnimal { get; set; }
        public string TypeAnimal { get; set; }


        public virtual Alimentation IdAlimentationsNavigation { get; set; }
        public virtual Geographie IdGeographieNavigation { get; set; }
        public virtual Habitat IdHabitatNavigation { get; set; }
    }
}
