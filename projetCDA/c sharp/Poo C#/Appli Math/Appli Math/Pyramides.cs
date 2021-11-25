using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Pyramides : Triangles
    {
        public int Profondeur { get; set; }





        public Pyramides(int profondeur,int basee, int hauteur ) : base(basee, hauteur)
        {
            this.Profondeur = profondeur;
            
        }

        public override double Perimetre()
        {
            return (2* base.Perimetre()) + (3 * Profondeur);
        }

        public int Volume()
        {
            return Aire() * Profondeur;
        }

        public override string Afficher()
        {
            return "Hauteur : " + Hauteur + " cm -" +
                " Base : " + Base + " cm - " +
                " Profondeur : " + Profondeur + " cm - " +
                "Perimetre : " + Perimetre() + " cm -" +
                "Volume : " + Volume() + " cm .";
        }

        public override string ToString()
        {
            return base.ToString() + " Profondeur " + Profondeur + ".";
        }










    }
}
