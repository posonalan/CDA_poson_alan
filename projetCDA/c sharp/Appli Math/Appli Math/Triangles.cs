using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Appli_Math
{
    class Triangles
    {       /***** Proprieter *****/
        public int Base { get; set; }
        public int Hauteur { get; set; }

            /***** Constructeur *****/
        public Triangles(int laBase, int hauteur)
        {
            this.Base=laBase;
            this.Hauteur=hauteur;
        }

        /***** Methode *****/

        public virtual double Perimetre()
        {
            return this.Hauteur + this.Base + Math.Sqrt((this.Hauteur* this.Hauteur)+(this.Base * this.Base) ); /* triangle */
        }

        public int Aire()
        {
            return (this.Base * this.Hauteur)/2; /* Triangle */
        }

    

        public virtual string Afficher()
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
             "\n|Base                : " + this.Base +
             "\n|Hauteur           : " + this.Hauteur
             +
             ".";
        }

        }
    }
