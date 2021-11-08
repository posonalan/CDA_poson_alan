using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Compte
{



    class Comptes
    {/* ********** Propriétaire ********** */

        public double Solde { get; private set; }
        public int Code { get; private set; }
        public Clients Proprietaire { get; set; }

        public static  int Compteur { get; set; } = 0;
        public string Operation { get; set; }

        /* ******** Constructeur ******** */
        public Comptes()
        {
        }

        public Comptes( Clients proprietaire)
        {
            Code = ++Compteur;
            this.Proprietaire = proprietaire;
            this.Solde = 0; // on définit la valeur par défaut
        }

        public override string ToString()
        {
            return " \n Solde : " + this.Solde + " " + this.Code + "\n" + this.Proprietaire.ToString();
        }

        /// <summary>
        /// Permet de créditer le compte du montant passé en paramètre
        /// </summary>
        /// <param name="somme">Montant à créditer</param>
        public void Crediter(double montant)
        {
            //Solde = Solde + montant;
            this.Solde += montant;
        }
        /// <summary>
        /// Permet de créditer le compte du montant passé en paramètre et débite le compte passé en paramètre
        /// </summary>
        /// <param name="somme">Montant à créditer</param>
        /// <param name="compte">Compte à débiter</param>
        /// <returns>Renvoi vrai si le traitement s'est bien passé</returns>
        public bool Credite(double montant, Comptes compteADebiter)
        {
            this.Crediter(montant);  // équivalent à  this.Solde += somme;
            compteADebiter.Debiter(montant);
            return true;
        }
        /// <summary>
        /// Permet de débité le compte du montant passé en paramètre
        /// </summary>
        /// <param name="montant">montant a débité</param>
        public void Debiter(double montant)
        {
            //Solde = Solde - montant;
            this.Solde -= montant;
        }
        /// <summary>
        /// Permet de créditer le compte du montant passé en paramètre et débite le compte passé en paramètre
        /// </summary>
        /// <param name="montant">Montant a debité</param>
        /// <param name="compte">Compte a credité</param>
        public void Debiter(double montant, Comptes compte)
        {
            this.Debiter(montant);
            compte.Crediter(montant);
        }


        public void Afficher()
        {
            Console.WriteLine(this);
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

        public static void afficherNbrDeCompte()  // méthode static parce qu'elle appele une propriété static
        {
            Console.WriteLine("nombre de compte crées: " + Compteur);
        }

        //static string CompteurObjet(compteur)
    }

}


