using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BiblioJeux.Data.Dtos
{
    public class JeuDTOOut
    {

        public JeuDTOOut()
        {
        }
        // les données de la table sans les id et sans les clés etrangères

        public string LibelleJeu { get; set; }

    }
}
