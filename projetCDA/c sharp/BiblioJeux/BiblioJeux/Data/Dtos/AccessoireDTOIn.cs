using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BiblioJeux.Data.Dtos
{
    public class AccessoireDTOIn
    {
        public AccessoireDTOIn()
        {
          
        }
        // les données présentes dans la tables uniquement
        public int IdAccessoire { get; set; }
        public string LibelleAccessoire { get; set; }
        public int IdMarque { get; set; }

       
    }
}
