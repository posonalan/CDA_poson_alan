using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public class ApprovisionnementDTOIn
    {

        /* le In cest tout le contenue */ 
        public ApprovisionnementDTOIn()
        { }
        public int IdApprovisionnement { get; set; }
        public int? IdProduit { get; set; }
        public int? IdFournisseur { get; set; }
        public string RefFournisseur { get; set; }

    }
    /* le out cest le contenu - l'id de la class */

    public class ApprovisionnementDTOOut
    {

        /* le In cest tout le contenue */
        public ApprovisionnementDTOOut()
        { }
        public int IdApprovisionnement { get; set; }
        public int? IdProduit { get; set; }
        public int? IdFournisseur { get; set; }
        public string RefFournisseur { get; set; }

    }

}
