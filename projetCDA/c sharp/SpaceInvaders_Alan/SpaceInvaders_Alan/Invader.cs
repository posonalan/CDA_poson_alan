using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpaceInvaders_Alan
{
    class Invader
    {
        /***** Proprieté *****/

        public string Motif { get; set; } = "#"; /* type d'envahisseur exemple  alien , vache , claude francois */ 
        public int Position { get; set; } /* position de l'envahisseur */ 
        public bool Shoot { get; set; }

        public Invader(string motif, int position, bool shoot)
        {
            this.Motif = motif;
            this.Position = position;
            this.Shoot = shoot; 
        }

        //public bool tirer()
        //{
        //    if (!shoot)
        //    {
        //        return true;
        //    }
        //    return false; 
        //}



        public override string ToString()
        {
            return " type d'envahisseur : "+ this.Motif+ " " ;
        }





    }
}
