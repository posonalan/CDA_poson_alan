using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Parallelepipedes : Rectangles
    {
        public int Hauteur { get; set; }



        public Parallelepipedes(int largeur, int longueur, int hauteur) : base(largeur,longueur)
        {
            this.Hauteur = hauteur; 
       

        }

        public override string ToString()
        {
            return base.ToString()+" hauteur "+Hauteur+".";
        }

        public override int Perimetre()
        {
            return  2*base.Perimetre()+4*Hauteur;
        }

        public int Volume()
        {
            return  Aire()*Hauteur;
        }
    }
}
