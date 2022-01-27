using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Compte
{
    class Clients
    {

        /* ********** Propriétaire ********** */
        public string Cin { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public int Telephone { get; set; }

     


        /* ******** Constructeur ******** */
        public Clients()
        {

        }
      
        public Clients(string cin, string nom, string prenom)
        {
            Cin = cin;
            Nom = nom;
            Prenom = prenom;
       
        }
        public Clients(string cin, string nom, string prenom, int telephone)
        {
            Cin = cin;
            Nom = nom;
            Prenom = prenom;
            Telephone = telephone;
        }
     




        public override string ToString()
        {
            return " Matricule :" + this.Cin + " \n Nom : " + this.Nom + "\n Prenom : " + Prenom + "\n Telephone : " + Telephone + " \n";
        }

        //public void Rouler(int KilometrePlus)
        //{
        //    NbKilometre = NbKilometre + KilometrePlus;
        //}


    }
}
