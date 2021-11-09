using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entreprise_National
{
    class Employes
    {
        /* ********** Propriétés ********** */
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public DateTime DateEmbauche { get; set; }
        public string Fonction { get; set; } /* poste dans l'entreprise */ 
        public double Salaire { get; set; } /* en K euros brut annuel */ 
        public string Service { get; set; } /* dans lequel se situe l’employé (Comptabilité, Commercial,…)*/                
        

        /* ******** Constructeur ******** */
      

        public Employes(string nom, string prenom, DateTime dateEmbauche, string fonction, double salaire, string service)
        {
            Nom = nom;
            Prenom = prenom;
            DateEmbauche = dateEmbauche;
            Fonction = fonction;
            Salaire = salaire;
            Service = service;
        }

        /********** Fonction / Methode **********/

        public override string ToString()

        {    string reponse =
            "**** Information sur les employés ****" +
                "\n  Nom :" + this.Nom +
                "\n Prenom : " + this.Prenom +
                "\n dateEmboche : " + this.DateEmbauche.ToString("dd/MM/yyyy") +  // on formate la date avant l'affichage
                "\n Fonction " + this.Fonction +
                "\n Salaire " +  this.Salaire + 
                "\n Service " + this.Service+" ";
            return reponse;
        }

        /**********/

        public int NbAnneesAnciennete() /* fonction calcule du nombre d'année d'ancienneté */ 
        {
                  TimeSpan ecart = DateTime.Today - DateEmbauche; /* dateTime.Today et dateTime.Now c'est pareil */
            //Nombre d'années dans l'entreprise
            return ((int)ecart.TotalDays / 365); /* on retourne l'ecart entre aujourdhui et notre date / par 365 jours */ 
        }

        /**********/

         public double PrimeSalaire() /* fonction de calcule de la prime */ 
        {
            return this.Salaire * 0.05; /* le salaire + la prime de 5% */ 
        }
        
        /**********/

           public double PrimeAnciennete() /* fonction de calcule de la prime d'ancienneté */ 
        {
            return this.Salaire * 0.02 * this.NbAnneesAnciennete(); /* x le resultat de la fonction anneeAnciennete */ 
        }

        /**********/
        
          public double Prime() /* fonction qui fait le total des primes */ 
        {
            return Math.Round(this.PrimeSalaire()+this.PrimeAnciennete(),2);/* on arrondi 2 chiffres après la virgule */  // on arrondi 2 chiffres après la virgule
        }

        /**********/

        /// <summary>
        /// Méthode théorique : en réalité la méthode serait déplacer en dehors de la classe Employes
        /// </summary>
        public void OrdreDeTransfert()
        {
            DateTime dateVersement = new DateTime(DateTime.Now.Year, 11, 30); // DateTime.Now.Year donne l'année du jour en cours
            if (DateTime.Now==dateVersement)  // peut être modifié par une comparaison de mois et jour uniquement
            {
                Console.WriteLine("Ordre de transfert de " + this.Prime() + "pour la salarié " + this.Nom);
            }
        }

        /**********/
        
         public static int ClassementNom(Employes a, Employes b) /* fonction classement par ordre alphabetique */ 
        {
            if (a.Nom.CompareTo(b.Nom) > 0) 
            {
                return 1;
            }else if(a.Nom.CompareTo(b.Nom) < 0)
            {
                return -1;
            }else if(a.Prenom.CompareTo(b.Prenom) > 0) // les noms sont égaux, on compare les prenoms
            {
                return 1;
            }else if (a.Prenom.CompareTo(b.Prenom) < 0)
            {
                return -1;
            }
            else
            {
                return 0; // noms et prenoms egaux
            }
        }

        /**********/

         public static int ClassementService(Employes a, Employes b)
        {
            if (a.Service.CompareTo(b.Service) > 0)
            {
                return 1;
            }
            else if (a.Service.CompareTo(b.Service) < 0)
            {
                return -1;
            }
            return ClassementNom(a, b); // si les services sont égaux, on renvoi la comparaison par Nom
        }

        /***********/

           public double MasseSalariale() /* le salaire + les primes */
        {
            return this.Salaire + this.Prime();
        }



    }

}
