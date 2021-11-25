using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpaceInvaders_Alan
{
    class Space
    {
        /***** Proprietés *****/
        public int NbLignes { get; set; } /* nombres de ligne */
        public int NbColonnes { get; set; } /* nombres de colonne */
        public Invader[,] Grille { get; set; }




        /***** Constructeur *****/
        public Space(int nbLignes, int nbColonnes)
        {
            NbLignes = nbLignes;
            NbColonnes = nbColonnes;
            this.CreeGrille(); /* on cree la grille a chaque fois qu'on crée un nouvelle objet */
        }

        /* fonction de creation de la grille */
        public void CreeGrille()
        {
            // Q5 Grille = new char[this.NbLignes, this.NbColonnes];
            Grille = new Invader[this.NbLignes, this.NbColonnes]; /* on remplie les case ( ligne x colonne ) avec des invader */
            for (int ligne = 0; ligne < this.NbLignes; ligne++) /* pour le depart jusque le nombre de ligne */
            {
                for (int colonne = 0; colonne < this.NbColonnes; colonne++) /* pour le depart jusque le nombre de ligne */
                {
                    //Q5  Grille[ligne, colonne] = ' ';
                    if (ligne == 0) /* si la personne ne choisis rien  */
                    {
                        Grille[ligne, colonne] = new Invader(); /* on affiche # par defaut */
                    }
                    else
                    {
                        Grille[ligne, colonne] = new Invader(' '); /* sinon on affiche sa selection */
                    }
                }
            }
        }

        /* fonction d'affichage , permet d'afficher la grille */
        public void Afficher()
        {
            Console.WriteLine("nbLignes : " + NbLignes + "\n");
            Console.WriteLine("nbColonnes : " + NbColonnes + "\n");
            Console.WriteLine(this.ToString());
        }







        public override string ToString()
        {
            string aff = "";  // cette variable permet de construire au fur et à mesure les éléments à afficher
            for (int ligne = 0; ligne < this.NbLignes; ligne++)
            {
                for (int colonne = 0; colonne < this.NbColonnes; colonne++)
                {
                    aff += (Grille[ligne, colonne]); /* on met le comptenu de chaque case dans la grille */
                }
            }
            aff += "\n";
            return aff; /* on affiche */
        }







    }
}

