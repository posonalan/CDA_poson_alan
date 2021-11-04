using System;
using System.Text; 


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

            //string t;
            //string t2;
            //string iI;
            //string jJ;
            //int i;
            //int j;
            //int e;
            //t2 = "";
            //string a; 

            //Console.WriteLine(" Ecrivez votre premiere phrase : ");
            //t = Console.ReadLine();
            //Console.WriteLine(" Vous souhaitez commencer a quel caractere ? ");
            //iI = Console.ReadLine();
            //i = Int32.Parse(iI) - 1;
            //Console.WriteLine(" Vous souhaitez terminer a quel caractere ?");
            //jJ = Console.ReadLine();
            //j = Int32.Parse(jJ);

            //for (e = i; i < j; i++) /* i valeur de depart tant quelle est plus petite que j valeur d'arriver on boucle */
            //{
            //    t2 = t2 + t[i]; /* t2 va recevoir les differents t[i] au fil des boucles : t2 vide , t2 + ti1, t2+ ti1 + ti2, ...  */
            //}
            //Console.WriteLine(t2);
            //Console.WriteLine(" saisi un mot pour modifier la chaine : "); /* on demande la modification a apporter */                                                                
            //a = Console.ReadLine();
            //String modification = t2.Insert(3, a); /* on insert apres le 3 eme caractere la modification */ 
            //Console.WriteLine("la  modification : '{0}'", modification); /* on affiche la modification */

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

            /********** Fonction replace **********/

            //string t;
            //string t2;
            //string iI;
            //string jJ;
            //int i;
            //int j;
            //int e;
            //t2 = "";
            //string a;

            //Console.WriteLine(" Ecrivez votre premiere phrase : ");
            //t = Console.ReadLine();
            //Console.WriteLine(" Vous souhaitez commencer a quel caractere ? ");
            //iI = Console.ReadLine();
            //i = Int32.Parse(iI) - 1;
            //Console.WriteLine(" Vous souhaitez terminer a quel caractere ?");
            //jJ = Console.ReadLine();
            //j = Int32.Parse(jJ);

            //for (e = i; i < j; i++) /* i valeur de depart tant quelle est plus petite que j valeur d'arriver on boucle */
            //{
            //    t2 = t2 + t[i]; /* t2 va recevoir les differents t[i] au fil des boucles : t2 vide , t2 + ti1, t2+ ti1 + ti2, ...  */
            //}
            //Console.WriteLine(t2);

            //Console.WriteLine("la chaine d'origine  \"{0}\"", t2); /* j'ecrie la selection d'origine */
            //Console.WriteLine("la chaine modifier   \"{0}\"", t2.Replace('a', 'b')); /* j'ecrie b a la place de tout les a */



            /********** Remplace sans la fonction replace **********/

            //string t;
            //string t2;
            //string iI;
            //string jJ;
            //int i;
            //int j;
            //int e;
            //t2 = "";
            //string a;

            //Console.WriteLine(" Ecrivez votre premiere phrase : ");
            //t = Console.ReadLine();
            //Console.WriteLine(" Vous souhaitez commencer a quel caractere ? ");
            //iI = Console.ReadLine();
            //i = Int32.Parse(iI) - 1;
            //Console.WriteLine(" Vous souhaitez terminer a quel caractere ?");
            //jJ = Console.ReadLine();
            //j = Int32.Parse(jJ);

            //for (e = i; i < j; i++) /* i valeur de depart tant quelle est plus petite que j valeur d'arriver on boucle */
            //{
            //    a = t[i].ToString();  /* on met le tableau dans la variable a */

            //    if (a == "a") /* si le caractere est a */
            //    {
            //        a = "b"; /* on le trasforme en b */

            //        t2 = t2 + a; /* t2 va recevoir les differents t[i] au fil des boucles : t2 vide , t2 + ti1, t2+ ti1 + ti2, ...  */
            //    }
            //    else
            //    {
            //        t2 = t2 + a; /* t2 va recevoir les differents t[i] au fil des boucles : t2 vide , t2 + ti1, t2+ ti1 + ti2, ...  */
            //    }
            //    Console.WriteLine(t2); /* on devoile le tableau */
            //}
            /**** version 2 ****/
            /* utilisition de using sytem.text; pour le stringBuilder */

            //StringBuilder t;
            //char a, b;

            //Console.Write("Entrez la valeur  t : ");
            //t = new StringBuilder(Console.ReadLine());
            //Console.Write("Entrez la valeur a : ");
            //a = Char.Parse(Console.ReadLine());
            //Console.Write("Entrez la valeur b : ");
            //b = Char.Parse(Console.ReadLine());



            //for (int i = 0; i < t.Length; i++)
            //{
            //    if (t[i] == a)
            //    {
            //        t[i] = b;
            //    }



            //}
            //Console.Write(t);



            /***************************** Prendre le debut et la fin d'une chaine de caractere *****************************/


            //string t;
            //string t2;
            //t2 = "";
            //string a;
            //a = "."; 

            //Console.WriteLine(" saisissez votre adresse de fichier  : ");
            //t = Console.ReadLine();

            //t2 = t.Substring(0, t.IndexOf(a));
            //Console.WriteLine(t2);
            //t2 = t.Substring(0, t.LastIndexOf(a));
            //Console.WriteLine(t2);
            //t2 = t.Substring( t.LastIndexOf(a)+1);
            //Console.WriteLine(t2);

            /***************************** Expression arithmetique *****************************/
            string a;

            string b;
            int i;
            Console.WriteLine(" saisissez votre calcule : ");
            a = Console.ReadLine();
            int compteur = 0; /* initialisation du compteur a 0 */


            for (i = 0; i < a.Length; i++) /* pour i jusqu'a la taille du tableau */
            {
                if (a[i] == '(')             /* on regarde si l'entrer cest une parenthese */
                {
                    compteur++;               /* si c'est une parenthese on met 1 au compteur */


                }
                else if (a[i] == ')')
                {     /* si cest une fermente */
                    compteur--;               /* on met compteur -1 */
                }

            }
            if (compteur == 0)                 /* si le compteur est a 0 cest bon */
            {
                Console.WriteLine(" its ok ! ");


            }
            else
            {
                Console.WriteLine("its not ok ! ");  /* sinon cest pas bon */
            }














        }
    }
}