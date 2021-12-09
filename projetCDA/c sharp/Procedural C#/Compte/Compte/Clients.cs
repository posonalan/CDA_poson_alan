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

<<<<<<< HEAD
     
=======

>>>>>>> f14d4f4f0e75b88fd0976a95926c96019a758b04


        /* ******** Constructeur ******** */
        public Clients()
        {

        }
<<<<<<< HEAD
      
=======

>>>>>>> f14d4f4f0e75b88fd0976a95926c96019a758b04
        public Clients(string cin, string nom, string prenom)
        {
            Cin = cin;
            Nom = nom;
            Prenom = prenom;
<<<<<<< HEAD
       
=======

>>>>>>> f14d4f4f0e75b88fd0976a95926c96019a758b04
        }
        public Clients(string cin, string nom, string prenom, int telephone)
        {
            Cin = cin;
            Nom = nom;
            Prenom = prenom;
            Telephone = telephone;
        }
<<<<<<< HEAD
     




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
=======

        public override string ToString()
        {
            return " Matricule :" + this.Cin + " \n Nom : " + this.Nom + "\n Prenom : " + Prenom + "\n Telephone : " + Telephone + " ";
        }

        public void Afficher()
        {
            Console.WriteLine(this);            // équivalent à Console.WriteLine(this.ToString());
        }

    }
}
>>>>>>> f14d4f4f0e75b88fd0976a95926c96019a758b04
