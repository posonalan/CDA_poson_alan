using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C_Sharp_Applicatio_Console
{
    class Voitures
    {
        /* ********** Propriétaire ********** */
        public string Couleur { get; set; }
        public string Marque { get; set; }
        public string Modele { get; set; }
        public int NbKilometre { get; set; }
        public string Motorisation { get; set; }


        /* ******** Constructeur ******** */
        public Voitures()
        {

        }

        public Voitures(string couleur, string marque, string modele, int nbKilometre, string motorisation)
        {
            Couleur = couleur;
            Marque = marque;
            Modele = modele;
            NbKilometre = nbKilometre;
            Motorisation = motorisation;
        }

        public Voitures(string marque, string modele)
        {
            Marque = marque;
            Modele = modele;
        }


        public override string ToString()
        {
            return " Cette voiture est une " + this.Modele + " de la marque " + this.Marque + " , de couleur " + Couleur + " de motorisation " + Motorisation + " avec " + NbKilometre + " kilometres";
        }

        public void Rouler(int KilometrePlus)
        {
            this.NbKilometre = NbKilometre + KilometrePlus;
        }


    }
}