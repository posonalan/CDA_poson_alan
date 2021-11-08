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
        private static int Compteur = 1;
        public string Operation { get; set; }

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

        //public Comptes(double solde, string code, Clients proprietaire)
        //{
        //    Proprietaire = proprietaire;
        //    solde = 0.00;
        //    code = "euros";
        //}


        public override string ToString()
        {
            return " \n Solde : " + this.Solde + " " + this.Code + "\n" + this.Proprietaire.ToString();
        }


        public void Crediter(double montant)
        {
            Solde = Solde + montant;
        }
        public string CrediteCompte(double montant, string code)
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

        public void Transfere(double montant, string operation )
        {
            if (operation == "-")
            {
                Solde = Solde - montant;
            }
            else if (operation == "+")
            {
                Solde = Solde + montant;
            }
        }
        //static string CompteurObjet(compteur)
    }

}


