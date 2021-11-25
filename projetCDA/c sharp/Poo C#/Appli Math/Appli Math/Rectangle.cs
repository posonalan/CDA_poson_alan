using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Rectangles
    {
        public int Longueur { get; set; }
        public int Largeur { get; set; }


        public Rectangles(int longueur, int largeur)
        {
            this.Longueur = longueur;
            this.Largeur = largeur;
        }


        public virtual int Perimetre() 
        {
            return (this.Longueur + this.Largeur)*2; /* rectangle */ 
        }

        public  int Aire()
        {
            return this.Longueur * this.Largeur; /* rectangle */ 
        }

        public bool EstCarre()
        {
            if (this.Longueur == this.Largeur)
            {
               
                return true; 
            }
           
            return false; 
        }
            
        public string AfficherRectangle() 
                {
            return "Longueur : "+Longueur+" cm -" +
                " Largeur : "+Largeur+" cm - " +
                "Perimetre : " +Perimetre()+" cm -" +
                "Aire : "+Aire()+" cm -" +
                " la forme geometrique est un carre : "
                + EstCarre();
                }

        /* affichage */
        public override string ToString()

        {

           return
            "****_Information_****" +
            "\n|Longueur                : " + this.Longueur +
            "\n|Largeur           : " + this.Largeur +
            "."; 
          
           
        }

    }
}
