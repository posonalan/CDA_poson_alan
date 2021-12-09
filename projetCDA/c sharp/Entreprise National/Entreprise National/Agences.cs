using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entreprise_National
{
    class Agences
    {
        public string Nom { get; set; }
        public string Adresse { get; set; }
        public int CodePostal { get; set; }
        public string Ville { get; set; }
        public bool Restaurant { get; set; }
        public  Agences Agence { get; set; }

   
    public Agences(string nom, string adresse, int codePostal, string ville, bool restaurant,  Agences agence )
    {
        Nom = nom;
        Adresse = adresse;
        CodePostal = codePostal;
        Ville = ville;
        Restaurant = restaurant; 


    }

        public override string ToString()

        {
            string reponse =
           "**** Information sur les employés ****" +
               "\n  Nom :" + this.Nom +
               "\n Adresse : " + this.Adresse +
               "\n CodePostal : " + this.CodePostal +
               "\n Ville " + this.Ville +
                "\n Restaurant " + this.Restaurant +
               " ";
            return reponse;
        }

        public bool ModeRestauration(bool restaurant)
        {
            if ( !restaurant)
            {
               Console.WriteLine( " Tu as le droit aux tikets restaurant");
                return true;
            }
            else
            {
                Console.WriteLine( " tu n'a pas le droit au ticket restaurant");
                return false; 
            }
        }



       





    }

}
