using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Rectangle
    {
        public int Longueur { get; set; }
        public int Largeur { get; set; }


        public Rectangle(int longueur, int largeur)
        {
            this.Longueur = longueur;
            this.Largeur = largeur;
        }


        public int perimetre()
        {
            return (this.Longueur + this.Largeur)*2 ;

        }

        /* affichage */
        public override string ToString()
        {

            string reponse =
            "****_Information_****" +
            "\n|Longueur                : " + this.Longueur +
            "\n|Largeur           : " + this.Largeur +
            "."; 
          
            return reponse;
        }

    }
}
