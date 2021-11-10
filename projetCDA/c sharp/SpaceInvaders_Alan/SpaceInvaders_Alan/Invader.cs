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

        public char Motif { get; set; }  /* type d'envahisseur exemple  alien , vache , claude francois */ 
       
       

        public Invader(char motif )
        {
            this.Motif = motif;
            
           
        }

      
        public Invader()
        {
            this.Motif = '§';
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
            return this.Motif+"" ;
            // ou   return char.ToString(this.Motif);
        }





    }
}
