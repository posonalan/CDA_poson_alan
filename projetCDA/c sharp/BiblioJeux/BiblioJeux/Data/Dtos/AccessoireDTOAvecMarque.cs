using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BiblioJeux.Data.Dtos
{
    public class AccessoireDTOAvecMarque
    {
        public AccessoireDTOAvecMarque()
            {

            }
        // les colonnes de la table sans les id

        public string LibelleAccessoire { get; set; }
        public int IdMarque { get; set; }

        // ajouter les données attachées
        // ATTENTION il faut retourner un DTOOut

        public virtual MarqueDTOOut Marque { get; set; }

    }
}
