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
        public char[,] Grille { get; set; }
      



        /***** Constructeur *****/
        public Space(int nbLigne, int nbColonne)
        {
            NbLigne = nbLigne;
            NbColonne = nbColonne;
           
           

            CreeGrille();

        }

        public void CreeGrille()
        {
            Grille = new char[this.NbLigne, this.NbColonne];
            for (int i = 0; i < this.NbLigne; i++)
            {
                for (int j = 0; j < this.NbColonne; j++)
                {
                    Grille[i, j] = ' ' ;
                }
            }
        }
        public void AfficherGrille()
        {
            foreach (int valeur in Grille)
            {
                Console.WriteLine(Grille);
            }

        }

        //public void EnvahisseurDuHaut()
        //{
            
        //}





  

        public override string ToString()
        {
            return " Nombre de ligne " + this.NbLigne + "\nNombre de colonne " + this.NbColonne  + ".";
        }
    }















}

