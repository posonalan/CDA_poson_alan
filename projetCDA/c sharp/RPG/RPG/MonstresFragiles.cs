using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG
{
    class MonstresFragiles
    {
        public string Nom { get; set; }
        public bool Pdv { get; set; }
        public int valeur { get; set; }


        public MonstresFragiles(string nom)
        {
            this.Nom = nom;
            this.Pdv = true;
            this.valeur = 1;
        }
        public virtual void Attaque(Joueurs remy)
        {
            int lanceJoueur = De.LanceLeDe();
            int lanceMonstre = De.LanceLeDe();
            int lanceBouclier;
            

            Console.WriteLine(" Lancer de dé : \n");
            Console.WriteLine(" le " + Nom + " realise un " + lanceMonstre + " , " + "le joueur realise un " + lanceJoueur + ".");

            if (lanceJoueur < lanceMonstre)
            {
                Console.WriteLine(" Brandir le bouclier \n");
                lanceBouclier = De.LanceLeDe();
                
                if (lanceBouclier > 2)
                {
                    Console.WriteLine(" le monstre te fait mal ");

                    remy.SubitDegats(10); 
                }
                else {
                Console.WriteLine(" Attaque bloquer ! \n");
 }
            } 
        }
        public bool Statue(int pdv) /* en vie ou mort */
        {
            if (pdv <= 0)
            {
                return true;
            }
            return false;
        }

        public override string ToString()
        {
            return
             "****_Information_****" +
             "\n|Nom : " + this.Nom +
             "\n|Point de vie : " + this.Pdv +
             ".";
        }






    }
}
