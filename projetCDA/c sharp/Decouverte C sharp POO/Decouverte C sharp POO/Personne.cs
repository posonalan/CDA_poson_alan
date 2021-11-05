using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Decouverte_C_sharp_POO
{
    class Personne
    {
        /********** Attributs **********/

        private string nom;
        private string prenom; 
        private int age;
        private string adresse;
        private string groupeSanguin;

        /********* Constructeur *********/

        public Personne()
        {

        }
        public Personne(string nvNom, string nvPrenom, int nvAge, string nvAdresse, string nvGroupeSanguin)
        {
            this.nom = nvNom;
            this.prenom = nvPrenom;
            this.age = nvAge;
            this.adresse = nvAdresse;
            this.groupeSanguin = nvGroupeSanguin; 

        }


        /********** Accesseurs **********/

        public string GetNom()
        {
            return this.nom;
        }
        public void SetNom(string nvNom)
        {
            this.nom = nvNom;
        }
        public string GetPrenom()
        {
            return this.prenom;
        }
        public void SetPrenom(string nvPrenom)
        {
            this.prenom = nvPrenom;
        }

    }
}
