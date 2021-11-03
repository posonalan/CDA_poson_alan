using System;

namespace Exercice_Tableaux
{
    class Program
    {
        static void Main(string[] args)
        {
            /**************** Analyse ****************/

            //char[] c = new char[4];      /* on cree un nouveau tableau a 4 cases */
            //c[0] = 'a';                  /* la position 1 */
            //c[3] = 'J';                  /* la position 2 */
            //c[2] = 'k';                  /* la position 3 */
            //c[1] = 'R';                  /* la position 4 */
            //for (int k = 0; k < 4; k++)  /* tant que k est inferieur a 4 */
            //    Console.WriteLine(c[k]); /* on ecrit les lettres dans l'ordre du tableau */
            //for (int k = 0; k < 4; k++)  /* tant que k est inferieur a 4 */
            //    c[k]++;                  /* on fait la position +1 */
            //foreach (char i in c)        /* on recherche la position */
            //    Console.WriteLine(i);    /* on affiche les données de i */

            ///* resultat R k J b S l K */

            /**************** Analyse ****************/

            //int[] k;                            /* on prepere un tableau de nombre */ 
            //k = new int[10];                    /* on cree un table k qui comporte 10 cases */ 
            //k[0] = 1;                           /* la case 1 est initialisé a 1 */ 
            //for (int i = 1; i < 10; i++)        /* pour i est inferieur a 10 */
            //    k[i] = 0;                       /* a chaque passage on replace i a 0 */ 
            //for (int j = 1; j <= 3; j++)        /* pour j inferieur ou egal a 3 */ 
            //    for (int i = 1; i < 10; i++)    /* pour i est inferieur a 10 jusque 10 */ 
            //        k[i] += k[i - 1];           /* faire i-1 et l'incorporer dans k[i] */
            //foreach (int i in k)                /* rechercher i dans le tableaux */ 
            //    Console.WriteLine(i);           /* ecrire i */ 

            ///* resultat : 1 3 6 10 15 21 28 36 45 55 */ 

            /**************** Analyse ****************/

           // int[] k;                            /* on prepare le tableau */
           // k = new int[10];                    /* on cree le tableau k */ 
           // k[0] = 1;                           /* a la position 1 on ecrit 1 */ 
           // k[1] = 1;                           /* a la deuxieme position on ecrit 1 */ 
           // for (int i =  2; i < 10; i++)       /* pour i est inferieur a 10 jusque i superieur */ 
           //     k[i] = 0;                       /* on met i a 0 */
           // for (int j = 1; j <= 3; j++)        /* pour j jusqua j sup ou egal a i */
           //     for (int i = 1; i < 10; i++)    /* pour i inf a 10 jusque 10 */ 
           //         k[i] += k[i - 1];           /* on fait i -1 que l'on stock dans k[i] */ 
           // foreach (int p in k)                /* on recherche p dans le tableau */ 
           //     Console.WriteLine(p);           /* on affiche la recherche */

           ///*resultat : 1 4 9 16 25 36 49 64 81 100 */ 


        }
    }
}
