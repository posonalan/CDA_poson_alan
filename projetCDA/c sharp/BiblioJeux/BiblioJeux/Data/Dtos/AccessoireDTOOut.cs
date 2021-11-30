using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BiblioJeux.Data.Dtos
{
    public class AccessoireDTOOut
    {
        public AccessoireDTOOut()
        {
        }
        // les données de la table sans les id et sans les clés etrangères
        public string LibelleAccessoire { get; set; }
    }
}
