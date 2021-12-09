using AnimauxMany.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Dtos
{
    public class GeographieDTOOut
    {
        public GeographieDTOOut()
        {
        }
        public string LibelleGeographie { get; set; }
        public virtual ICollection<MilieuVieDTOAnimaux> MilieuVies { get; set; }

    }



}
