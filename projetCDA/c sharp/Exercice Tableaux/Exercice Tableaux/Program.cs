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
            //c[3] = 'J';                  /* la position 4 */
            //c[2] = 'k';                  /* la position 3 */
            //c[1] = 'R';                  /* la position 2 */
            //for (int k = 0; k < 4; k++)  /* tant que k est inferieur a 4 */
            //    Console.WriteLine(c[k]); /* on ecrit les lettres dans l'ordre du tableau */
            //for (int k = 0; k < 4; k++)  /* tant que k est inferieur a 4 */
            //    c[k]++;                  /* on fait la position +1 */
            //foreach (char i in c)        /* on recherche i dans le tableau c  */
            //    Console.WriteLine(i);    /* on affiche les données  */

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

            /****************  Initialisation et affichage ****************/

            // int[] liste = new int[10] { 1, 2, 3, 4, 5,6,7,8,9,10 };
            //             Console.WriteLine("              Un beau tableau  ");
            //             Console.WriteLine("              +-------------+");
            // for (int i = 0; i < liste.Length; i++)
            //{

            //     if (liste[i] < 10)
            //     {
            //            Console.WriteLine("              | Position {0}: {1}  |", i, liste[i]);
            //     }
            //     else { Console.WriteLine("              | Position {0}: {1} |", i, liste[i]); }
            // }
            //            Console.WriteLine("              +-------------+");

            /****************  Initialisation et boucle ****************/


            //int[] tab = new int[10];                                      /* creation d'un tableau a 10 cases */
            //Console.WriteLine("              Un beau tableau  ");
            //Console.WriteLine("              +-------------+");
            //for (int i = 0; i < tab.Length; i++)                          /* faire jusqu'a arriver a la fin du tableau */
            //{
            //    tab[i] = i + 1;                                           /* on range les valeur de i au fur et a mesure des tours de boucle */
            //    Console.WriteLine(" | Position {0}: {1} |", i, tab[i]);   /* on affiche les valeurs */

            //}
            //Console.WriteLine("              +-------------+");


            /****************           Somme           ****************/

            //int[] t = new int[10] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }; /* notre tableau de taille 10 */ 
            //int somme = 0;                                           /* on met la somme a 0 */ 

            //for (int i = 0; i < t.Length; i++)                       /* jusqua taille final du tableau */ 
            //{

            //    somme = somme + t[i];                                /* on additionne les valeurs a chaque tour de boucle */ 
            //}

            //Console.Write(" La somme est de : " + somme+".");        /* on affiche le resultat ( la somme ) 


            /****************         Recherche        ****************/

            //int[] t = new int[10] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }; /* notre tableau de taille 10 */ 
            //int compteur = 0;                                        /* initialisation du compteur a 0 */ 

            //Console.WriteLine("Donner un chiffre :");                /* demande */ 
            //int value = int.Parse(Console.ReadLine());

            //while (compteur < t.Length && t[compteur] != value)      /* tant que la compteur est plus petit que la taille du tableau et que le compteur est different de la valeur */ 
            //{
            //    compteur++;                                          /* on fait compteur +1 */
            //}

            //if (compteur < t.Length)                                 /* si le compteur est inferieur a la taille du tableau */ 
            //{
            //    Console.WriteLine("Ton chiffre est bien la ");       /* on affiche que le chiffre est bien dans le tableau */ 
            //}
            //else
            //{
            //    Console.WriteLine("Ton chiffre n'est pas dans le tableau "); /* sinon affichage : il n'est pas dans le tableau */ 
            //}

            /****************  Permutation circulaire  ****************/

            //int[] tableauA = new int[10]; /* on fait un tableau de 10 cases */ 
            //int[] tableauB = new int[10]; /* on fait un tableau 2 de 10 cases */  
            //for (int i = 0; i < tableauA.Length; i++) /* boucle tant que i est pas sup  a la taille du tableau */ 
            //    tableauA[i] = i + 1; /* on fait i+1 et on place le resultat dans le tableau */ 
            //for (int i = 0; i < tableauA.Length; i++) /* boucle tant que i est pas sup  a la taille du tableau */
            //    tableauB[(i + 1) % tableauA.Length] = tableauA[i]; /* on rentre dans le tableaub les valeur de i modulo */ 
            //foreach (int p in tableauB) /* on recherche dans le tableau */ 
            //    Console.WriteLine(p); /* et on affiche */ 




            /*****  Permutation circulaire sans deuxième tableau  *****/









            //            arrayFill1 = [| 1..25 |]
            //Array.fill arrayFill1 2 20 0
            //printfn "%A" arrayFill1

            //int[] liste = new int[10] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            //Console.WriteLine("              Un beau tableau  ");
            //Console.WriteLine("              +-------------+");
            //for (int i = 0; i < liste.Length; i++)
            //{

            //    liste[i] = i + 1;
            //    a = liste[i]; 


            //    if (liste[i] < 10)
            //    {

            //        Console.WriteLine("              | Position {0}: {1}  |", i, liste[i]);
            //    }
            //    else { Console.WriteLine("              | Position {0}: {1} |", i, liste[i]); }
            //}
            //Console.WriteLine("              +-------------+");



            /************************  Miroir  ************************/





            //    // création nouveau tableau
            //    int[] nouveauT = CreeTableau(5);
            //    Console.WriteLine("Nb de postes ={0}", nouveauT.Length);
            //    // ....
            //    // Affichage du tableau
            //    AfficheTableau(nouveauT);
            //    //
            //    Console.ReadLine();
            //}

            //static int[] CreeTableau(int taille)
            //{
            //    return new int[taille];
            //}
            //static void AfficheTableau(int[] unTableau)
            //{
            //    for (int i = 0; i < unTableau.Length; i++)
            //    {
            //        Console.WriteLine("Poste {0}: {1}", i, unTableau[i]);
            //    }


        }
    }
}
