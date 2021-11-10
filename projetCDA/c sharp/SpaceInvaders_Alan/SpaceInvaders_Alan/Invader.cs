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

        public string Motif { get; set; } /* type d'envahisseur exemple  alien , vache , claude francois */ 
        po

        public Invader(string motif)
        {
            Motif = motif; 
        }


        public override string ToString()
        {
            return " type d'envahisseur : "+ this.Motif+ " " ;
        }





    }
}
