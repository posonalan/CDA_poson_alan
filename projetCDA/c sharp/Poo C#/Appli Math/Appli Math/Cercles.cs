using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Cercles
    {
        public double Diametre { get; set; }
    



        public Cercles(double diametre)
        {
            this.Diametre = diametre; 
        }


        public double Perimetre()
        {
            return this.Diametre*3.14 ; /* Cercles */
        }

        public double Aire()
        {
            return (Math.Pow((this.Diametre/2),2)*Math.PI) ; /* cercles */
        }



        public virtual string Afficher()
        {
            return "Diametre : " + Diametre + " cm -" +
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
