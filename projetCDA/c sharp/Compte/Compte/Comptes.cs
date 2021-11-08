using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Compte
{



    class Comptes
    {/* ********** Propriétaire ********** */

        public double Solde { get; set; }
        public string Code { get; set; }
        public Clients Proprietaire { get; set; }

        /* ******** Constructeur ******** */
        public Comptes()
        {
        }

        public Comptes(double solde, string code, Clients proprietaire)
        {

            Code = code;
            Solde = solde;
            Proprietaire = proprietaire;

        }

        public override string ToString()
        {
            return " \n Solde : " + this.Solde + " " + this.Code + "\n" + this.Proprietaire.ToString();
        }


        public void Crediter(double montant)
        {
            Solde = Solde + montant;
        }
        public string CrediteCompte(double montant, string code, Clients proprietaire)
        {
            Solde = Solde + montant;
            return " Le compte de " + this.Proprietaire + " a etait augmenter de " +
                montant + this.Code + "\n Votre solde est maintenent de " + this.Solde + this.Code + ".";
        }
        public void Debiter(double montant)
        {
            Solde = Solde - montant;
        }
        public string Decrire()
        {
            return " est de " + this.Solde +
           " " + this.Code;
        }
    }

}


