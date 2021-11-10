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
        public int NbLigne { get; set; } /* nombres de ligne */
        public int NbColonne { get; set; } /* nombres de colonne */

        public List<Space> ListeGrille { get; set; }

        public Invader Invader { get; set; } /* j'ai la liaison entre les invaders et l'espace     */



        /***** Constructeur *****/
        public Space(int nbLigne, int nbColonne, List<Space> listeGrille, Invader invader)
        {
            NbLigne = nbLigne;
            NbColonne = nbColonne;
            ListeGrille = listeGrille;
            Invader = invader;

        }

        public string CreeGrille()
        {

            int[] tab = new int[4, 10] { " ", " ", " ", " " }{ " "," "," "," "," "," "," "," "," "," ",}
            for (int i = 0; i < 4; i++)
            {
                tab[i] += tab[i];
                for (int j = 0; i < 10; j++)
                {
                    tab[j] += tab[j];
                }
            }


        }

        //public CreeGrille()
        //{

        //}

        //public  string CreeCadre()
        //{
        //    for (int i=0; i<10; i++)
        //    {
        //        Console.WriteLine("|                   |");
        //    }


    }
    public override string ToString()
    {
        return " Nombre de ligne " + this.NbLigne + "\nNombre de colonne " + this.NbColonne + "\nContenu de la grille " + this.ListeGrille + ".";
    }
















}
}
