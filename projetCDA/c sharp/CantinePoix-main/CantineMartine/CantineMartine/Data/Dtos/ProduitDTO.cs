using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Dtos
{
   
        public partial class ProduitDTOIn
        {
            public ProduitDTOIn()
            {

            }
            public int IdProduit { get; set; }
            public string LibelleProduit { get; set; }
            public int? QuantiteProduit { get; set; }
            public int IdCategorieProduit { get; set; }
        }
        public partial class ProduitDTOOut
        {
            public ProduitDTOOut()
            {

            }
            public string LibelleProduit { get; set; }
            public int? QuantiteProduit { get; set; }

            //public virtual Categoriesproduit IdCategorieProduitNavigation { get; set; }
        }

        public partial class ProduitDTOAvecLibelleCategorieProduit
        {
            public ProduitDTOAvecLibelleCategorieProduit()
            {

            }
            public int IdProduit { get; set; }
            public string LibelleProduit { get; set; }
            public int? QuantiteProduit { get; set; }
            public int IdCategorieProduit { get; set; }
            public string LibelleCategorieProduit { get; set; }

            public static int CompareToLibelleProduit(ProduitDTOAvecLibelleCategorieProduit P1, ProduitDTOAvecLibelleCategorieProduit P2)
            {

                if (P1.LibelleProduit.CompareTo(P2.LibelleProduit) == 1)
                {
                    return 1;
                }
                else if (P1.LibelleProduit.CompareTo(P2.LibelleProduit) == -1)
                {
                    return -1;
                }

                return 0;
            }
        }
    }
