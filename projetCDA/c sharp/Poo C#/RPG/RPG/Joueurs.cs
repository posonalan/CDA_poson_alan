using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG
{
    class Joueurs
    {
        public string Nom { get; set; }
        public int Pdv { get;  set; }
        public int Score { get; set; }



        public Joueurs(string nom)
        {
            this.Nom = nom;
            this.Pdv = 50;
            this.Score = 0;

        }
        /***********************************************/
        public bool Statue() /* en vie ou mort */
        {
            if (this.Pdv <= 0)
            {
                return false;
            }
            return true;
        }
        /**********************************************/
        public void Attaque(MonstresFragiles bart)
        {
            int lanceJoueur = De.LanceLeDe();
            int lanceMonstre = De.LanceLeDe();
            Console.WriteLine(" Lancer de dé : \n");
            Console.WriteLine(" le "+Nom+" realise un " + lanceJoueur + " , " + "le monstre realise un " + lanceMonstre + ".");

            if (lanceJoueur >= lanceMonstre)
            {
                Console.WriteLine(" le monstre est mort");

                this.Score+= bart.valeur;

                bart.Pdv = true;
            }
            bart.Pdv = false;


        }
        /*********************************************/
        public void SubitDegats(int degatSubis)
        {
            this.Pdv -= degatSubis;
            Console.WriteLine(Nom + " perd " + degatSubis + "points de vie, il lui reste " + Pdv + " point de vie.");

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
