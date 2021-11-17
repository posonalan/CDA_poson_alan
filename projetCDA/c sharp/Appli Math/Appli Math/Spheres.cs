using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Spheres : Cercles
    {


        public Spheres(double diametre) : base(diametre)
        {
            this.Diametre = diametre;
        }

        public double Volume()
        {
            return (4 / 3) *( base.Aire()*(base.Diametre/2));
        }


        public override string Afficher()
        {
            return "Diametre : " + Diametre + " cm -" +

                "Volume : " + Volume() + " cm .";
        }

        public override string ToString()
        {
            return
             "****_Information_****" +
             "\n|Diametre : " + this.Diametre
             + ".";
        }

    }
}


