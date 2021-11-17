using System;

namespace RPG
{
    class Program
    {
        static void Main(string[] args)
        {
            Joueurs remy = new Joueurs("remy"); 
            MonstresFragiles bart; 
            
            
            Console.WriteLine(De.LanceLeDe());
            do
            {
                if (De.LanceLeDe() == 1)
                {
                    bart = new MonstresPuissants("miguelle");
                }
                else
                {
                    bart = new MonstresFragiles("baptou");
                }
                do
                {
                    remy.Attaque(bart);

                    if (bart.Pdv == false)
                    {
                        bart.Attaque(remy);
                    }

                } while (remy.Statue() && bart.Pdv == false );
               
                Console.WriteLine(remy.Pdv);
                Console.WriteLine(remy.Score);



            } while (remy.Statue());
            Console.WriteLine(remy.Score); 
            
             

        }
    }
}
