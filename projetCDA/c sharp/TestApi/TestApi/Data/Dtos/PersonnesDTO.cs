using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestApi.Data.Dtos
{
   /* Cette classe servira à envoyer les données à l’extérieur sans mentionner l’id qui reste de la logique interne. */
    public class PersonnesDTO
    {
        public string Nom { get; set; }
        public string Prenom { get; set; }

        internal void Dump()
        {
            throw new NotImplementedException();
        }
    }





}
