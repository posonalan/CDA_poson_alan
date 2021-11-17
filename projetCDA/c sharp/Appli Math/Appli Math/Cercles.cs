using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Cercles
    {
        public int Diametre { get; set; }
    



        public Cercles(int diametre)
        {
            this.Diametre = diametre; 
        }


        public double Perimetre()
        {
            return this.Diametre*3.14 ; /* Cercles */
        }

        public int Aire()
        {
            return 3.14((this.Diametre /2)2) ; /* Triangle */
        }



        public string AfficherTriangle()
        {
            return "Hauteur : " + Hauteur + " cm -" +
                " Base : " + Base + " cm - " +
                "Perimetre : " + Perimetre() + " cm -" +
                "Aire : " + Aire() + " cm .";
        }

        public override string ToString()
        {
            return
             "****_Information_****" +
             "\n|Diametre : " + this.Diametre 
             +".";
        }

    }

    
}
