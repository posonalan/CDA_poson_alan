using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entreprise_National
{
    class Employes
    {
        /* ********** Propriétaire ********** */
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public DateTime DateEmboche { get; set; }
        public DateTime DateActuel = DateTime.Now;
        public int CompteJour ;
        public string Fonction { get; set; } /* poste dans l'entreprise */ 
        public double Salaire { get; set; } /* en K euros brut annuel */ 
        public string Service { get; set; } /* dans lequel se situe l’employé (Comptabilité, Commercial,…)*/                
        

        /* ******** Constructeur ******** */
        public Employes()
        {

        }
        public Employes(DateTime DateEmboche)
        {
            DateEmboche = DateEmboche; 
        }


        public Employes(string nom, string prenom, DateTime dateEmboche, string fonction, double salaire, string service)
        {
            Nom = nom;
            Prenom = prenom;
            DateEmboche = dateEmboche;
            Fonction = fonction;
            Salaire = salaire;
            Service = service;
        }

        public override string ToString()
        {
            return " Nom :" + this.Nom +
                "\n Prenom : " + this.Prenom +
                "\n dateEmboche : " + this.DateEmboche + 
                "\n Fonction " + this.Fonction +
                "\n Salaire " +  this.Salaire + 
                "\n Service " + this.Service+" ";
        }


        public void CompareDate()
        {
          
                TimeSpan CompteJour = DateActuel - DateEmboche;
           

        }
        


    }

}
