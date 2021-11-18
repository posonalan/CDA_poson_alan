using System;

namespace RPG
{
    class Program
    {
        static void Main(string[] args)
        {
           
            Console.WriteLine("     ********** RPG AUTO **********\n");

            Joueurs remy = new Joueurs("Remy"); 
            MonstresFragiles bart; 
            
            
            Console.WriteLine(De.LanceLeDe());
            do
            {
                if (De.LanceLeDe() == 1)
                {
                    bart = new MonstresPuissants("Miguelle");
                }
                else
                {
                    bart = new MonstresFragiles("José");
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
