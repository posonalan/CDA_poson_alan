using System;

using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DataSourceTest
{
    class Program
    {
        static void Main(string[] args)
        {   /* route jusqu'au fichier */ 
            string path = @"../../../MonFichier.txt";
            /* tableau de 10 case */ 
            string[] tableau = new string[10];
            /* tableau de reception */ 
            string[] tableauRetour = new string[10];
            /* fonction de preparation de tableau : le tableau a deplacer */ 
            tableau = PrepareLeTableaauAEnregistrer(tableau);
            /* fonction afficher le tableau a deplacer */ 
            AfficherTableau(tableau);
            /* fonction ecriture du tableau a deplacer et la route pour le trouver */ 
            EcrireFichier(tableau, path);
            /* mettre la route dans le nouveau tableau */ 
            tableauRetour = LireFichier(path);
            /* si le tableau recepteur n'est pas vide */ 
            if (tableauRetour != null)
            { /* tableau bien recuperer */ 
                Console.WriteLine("\n Tableau Récupéré");
                AfficherTableau(tableauRetour);
            }
            Console.Read();
        }
        /* fonction de preparation du tableau a deplacer */ 
        static string[] PrepareLeTableaauAEnregistrer(string[] tab)
        //remplit un tableau
        { /* on place donner par donner dans un tableau pour le deplacer vers le nouveau fichier */ 
            for (int i = 0; i < 10; i++)
            {
                tab[i] = "nom " + (i + 1) + "  info : " + i;
            }
            return tab;
        }
        static string[] LireFichier(string path)
        // Renvoi un tableau de chaine contenant les informations stockées dans le fichier 
        {
            string[] chaine = new string[10];
            try
            {
                // Lecture et stockage dans chaine
                chaine = File.ReadAllLines(path);
            }
            catch (Exception e)
            { /* si un probleme se passe */ 
                Console.WriteLine("Une exception s'est produite : " + e.Message);
                Console.WriteLine("Indiquer le path :");
                chaine = LireFichier(Console.ReadLine());
            }
            return chaine;
        }
        static void EcrireFichier(string[] chaine, string path)
        // Ecris dans le fichier  
        {
            File.WriteAllLines(path, chaine);
        }

        static void AfficherTableau(string[] tab)
        // Affiche le tableau
        {
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine(tab[i]);
            }
        }
    }
}