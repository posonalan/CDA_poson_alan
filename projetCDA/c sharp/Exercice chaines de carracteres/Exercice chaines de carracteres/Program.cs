using System;

namespace Exercice_chaines_de_carracteres
{
    class Program
    {
        static void Main(string[] args)
        {

            /********** Afficher chaque caractere d'une chaine de caractere **********/


            //int i;

            //string alan = " Les framboises sont perchées sur le tabouret de mon grand-père ";

            //for (i = 1; i < alan.Length; i++) /* pour i est plus petit que le nombre de caractere dans la phrase */
            //{
            //    Console.WriteLine(alan[i]);
            //} /* afficher chaques caracteres */


            /********** concat de deux chaines **********/

            string t;
            string t2;
            string iI;
            string jJ;
            int i;
            int j;
            int e;
            string a;
            t2 = "";
           
            Console.WriteLine(" Ecrivez votre premiere phrase : ");
            t = Console.ReadLine();
            Console.WriteLine(" Vous souhaitez commencer a quel caractere ? ");
            iI = Console.ReadLine();
            i = Int32.Parse(iI);
            Console.WriteLine(" Vous souhaitez terminer a quel caractere ?");
            jJ = Console.ReadLine();
            j = Int32.Parse(jJ);

            //Console.WriteLine("Ecrivez votre deuxieme phrase : ");
            //t2 = Console.ReadLine();

            for (e = i; i < j; i++)
            {

              //Console.WriteLine(t[i]);

                t2 = t2 + t[i]; 
                Console.WriteLine(t[i] + t2);
            }





        }

    }

}
