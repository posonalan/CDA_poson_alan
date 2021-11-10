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
         public Agences Agence { get; set; }
        public List<Enfants> ListeEnfants { get; set; } = new List<Enfants>(); /* la liste des enfants */ 

        /* ******** Constructeur ******** */
      

        public Employes(string nom, string prenom, DateTime dateEmbauche, string fonction, double salaire, string service, Agences agence, List<Enfants> listeEnfants)
        {
            Nom = nom;
            Prenom = prenom;
            DateEmbauche = dateEmbauche;
            Fonction = fonction;
            Salaire = salaire;
            Service = service;
            Agence = agence;
            ListeEnfants = listeEnfants;
        }

        /********** Fonction / Methode **********/


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
        
        /***********/

        /* fonction calcule cheque vacance */ 
        public bool ChequeVacance()
        {
            if (this.NbAnneesAnciennete() > 1) /* si la personne a plus ou egal de 1 ans d'anciennete elle a le droit au cheque vacance */ 
            {
               return "L'employe bénéficie de chèques vacances";
            }
            return "L'employe ne bénéficie pas de chèques vacances";

        }

        
        /***********/
        /* fonction pour ajouter un enfant dans la liste des enfants */ 
        public void AjouterEnfant(Enfants enfant)
        {
            this.ListeEnfants.Add(enfant);
        }

        /* fonction cheque de noel , permet de savoir combien de cheque et les sommes des cheques */ 
           public string ChequeNoel()
        {
            int[] tab = new int[3] { 0, 0, 0 }; // on stocke le nombre de chèque de chaque montant
            string reponse = "";  /* on prepare un string vide */
            foreach (var enfant in ListeEnfants)/* on recherche pour chaque enfants */
            {
                switch (enfant.ChequeNoel()) /* suivant les cheque des enfants */ 
                {
                    case 20: tab[0]++; break; /* a la case une on marque le nombre de billet de 20 euro */ 
                    case 30: tab[1]++; break; /* a la case deux on marque le nombre de billet de 30 euro */ 
                    case 50: tab[2]++; break; /* a la case trois on marque le nombre de billet de 50 euro */ 
                    default: break;
                }

            }
            if (tab.Sum() == 0)  // tab.Sum fait la somme de toutes les cases du tableau
            {
                return "Pas de droit aux chèques Noel"; /* reponse si pas de cheque  */ 
            }
            if (tab[0] > 0) reponse += tab[0] + " chèque de 20\n"; /* si a la position 1 la valeur est superiteur a 0 on met le compteur de billet a jours */ 
            if (tab[1] > 0) reponse += tab[1] + " chèque de 30\n";
            if (tab[2] > 0) reponse += tab[2] + " chèque de 50\n";
            return reponse; /* on affiche le resultat */ 
        }

        public string ChequeNoel2()
        {
            int[] tab = new int[3] { 0, 0, 0 }; // on stocke le nombre de chèque de chaque montant
            string reponse = "";

            // parcours des enfants pour connaitre les valeurs des cheques
            foreach (var enfant in ListeEnfants)
            {
                tab[(int)enfant.ChequeNoel2()]++;   // en fonction de la réponse de chequeNoel enfant, on incremente la case du tableau correspondante
                // enfant.ChequeNoel2() renvoi par exemple C20, caster en int donne 0 (car le 1er de l'enumeration)
            }


            if (tab.Sum() == 0)  // tab.Sum fait la somme de toutes les cases du tableau
            {
                return "Pas de droit aux chèques Noel";
            }
            // comme la partie vrai contient un return, le reste ne s'execute que s'il a droit aux cheques Noel
            for (var i = 0; i < tab.Length; i++)
            { // on parcours le tableau pour connaitre le nb de cheque à distribuer
                if (tab[i] > 0) reponse += tab[i] + " chèque de " + (Enum.GetName(typeof(ValeurChequeNoel), i)).Substring(1) + "\n";

                // pour recuperer la valeur du cheque on cherche à obtenir C20 et on enleve le C
                // Enum.GetName(typeof(ValeurChequeNoel), i) permet de récuperer le libellé associé à la valeur i
                // .Substring(1) permet d'enlever le C
            }

            return reponse;
        }



        /**********/

        /* affichage */ 
          public override string ToString()
        {

            string reponse =
            "****_INFORMATION_SUR_L'EMPLOYES_****" +
            "\n|Nom                : " + this.Nom +
            "\n|Prenom           : " + this.Prenom +
            "\n|Date Embauche    : " + this.DateEmbauche.ToString("dd/MM/yyyy") +  // on formate la date avant l'affichage
            "\n|Fonction         : " + this.Fonction +
            "\n|Salaire          : " + this.Salaire +
            "\n|Service          : " + this.Service +
            "\n|" + this.ChequeVacance() +
            "\n|" + this.ChequeNoel() +
            "\nsolution 2\n" +
            "\n|" + this.ChequeNoel2() +

            this.Agence;
            return reponse;
        }

       

        }

    }

}
