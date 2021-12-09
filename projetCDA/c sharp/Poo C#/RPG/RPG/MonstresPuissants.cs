using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG
{
    class MonstresPuissants : MonstresFragiles
    {
        


        public MonstresPuissants(string nom  ) : base(nom) 
        {
            base.valeur = 2; 
        }
        public override void Attaque(Joueurs remy)
        {
            int lanceJoueur = De.LanceLeDe();
            int lanceMonstre = De.LanceLeDe();
            int lanceBouclier;

            Console.WriteLine(" Lancer de dé : \n");
            Console.WriteLine(" le " + Nom + " realise un " + lanceMonstre + " , " + "le joueur realise un " + lanceJoueur + ".");

            if (lanceJoueur < lanceMonstre)
            {
                lanceBouclier = De.LanceLeDe();
                if (lanceBouclier > 2)
                {
                    Console.WriteLine(" le monstre te fait mal ");

                    remy.SubitDegats(15);
                }
            }
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
