using System;



namespace Exercice_chaines_de_carracteres
{
    class Program
    {
        static void Main(string[] args)
        {

            //            /********** Afficher chaque caractere d'une chaine de caractere **********/


            //            //int i;

            //            //string alan = " Les framboises sont perchées sur le tabouret de mon grand-père ";

            //            //for (i = 1; i < alan.Length; i++) /* pour i est plus petit que le nombre de caractere dans la phrase */
            //            //{
            //            //    Console.WriteLine(alan[i]);
            //            //} /* afficher chaques caracteres */


            //            /********** concat de deux chaines **********/

            //            //string t;
            //            //string t2;
            //            //string iI;
            //            //string jJ;
            //            //int i;
            //            //int j;
            //            //int e;
            //            //t2 = "";

            //            //Console.WriteLine(" Ecrivez votre premiere phrase : ");
            //            //t = Console.ReadLine();
            //            //Console.WriteLine(" Vous souhaitez commencer a quel caractere ? ");
            //            //iI = Console.ReadLine();
            //            //i = Int32.Parse(iI) - 1;
            //            //Console.WriteLine(" Vous souhaitez terminer a quel caractere ?");
            //            //jJ = Console.ReadLine();
            //            //j = Int32.Parse(jJ);

            //            //for (e = i; i < j; i++) /* i valeur de depart tant quelle est plus petite que j valeur d'arriver on boucle */
            //            //{
            //            //    t2 = t2 + t[i]; /* t2 va recevoir les differents t[i] au fil des boucles : t2 vide , t2 + ti1, t2+ ti1 + ti2, ...  */
            //            //}
            //            //Console.WriteLine(t2);


                       /********** Fonction insert **********/

            string t;
            string t2;
            string iI;
            string jJ;
            int i;
            int j;
            int e;
            t2 = "";
            string a; 

            Console.WriteLine(" Ecrivez votre premiere phrase : ");
            t = Console.ReadLine();
            Console.WriteLine(" Vous souhaitez commencer a quel caractere ? ");
            iI = Console.ReadLine();
            i = Int32.Parse(iI) - 1;
            Console.WriteLine(" Vous souhaitez terminer a quel caractere ?");
            jJ = Console.ReadLine();
            j = Int32.Parse(jJ);

            for (e = i; i < j; i++) /* i valeur de depart tant quelle est plus petite que j valeur d'arriver on boucle */
            {
                t2 = t2 + t[i]; /* t2 va recevoir les differents t[i] au fil des boucles : t2 vide , t2 + ti1, t2+ ti1 + ti2, ...  */
            }
            Console.WriteLine(t2);
            Console.WriteLine(" saisi un mot pour modifier la chaine : "); /* on demande la modification a apporter */                                                                
            a = Console.ReadLine();
            String modification = t2.Insert(3, a); /* on insert apres le 3 eme caractere la modification */ 
            Console.WriteLine("la  modification : '{0}'", modification); /* on affiche la modification */ 

            //            }

            //    }

            //}

            //using System.Collections.Generic;
            //public class MethodeInsert
            //{
            //    public static void Main()
            //    {
            //        string a;

            //        /* creation de la liste */
            //        List<string> phrase = new List<string>();

            //        /* demande de choses a rajouter a la liste */
            //        Console.WriteLine(" que souhaite tu ajoute ? ");
            //        a = Console.ReadLine();
            //        /* Ajouter des elements a la liste */
            //        phrase.Add(a);
            //        phrase.Add("elephant");
            //        phrase.Add("migale"); 
            //        // insérer des éléments dans la liste 
            //        phrase.Insert(2, "alan");
            //        phrase.InsertRange(3, new string[] { "vache", "cochon", "singe" });

            //        // Parcourir la liste avec la boucle for-each
            //        foreach (string mot in phrase)
            //        {
            //            Console.WriteLine(mot);
            //        }




        }
    }
}