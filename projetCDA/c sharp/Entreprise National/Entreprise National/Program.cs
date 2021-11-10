﻿using System;
using System.Collections.Generic;

namespace Entreprise_National
{
    class Program
    {
        static void Main(string[] args)
        {
            /* Creation des Employes */ 

            Agences prapage = new Agences("Prapage", "96 Rue de la paix", 62200, "Boulogne", true);
            Agences afpa = new Agences("Afpa", "407 avenue de la gironde", 59111, "Dunkerque",false);

            Enfants paul = new Enfants("Paul", "Parker", new DateTime(2012, 05, 04));
            Enfants lola = new Enfants("Lola", "Blanpain", new DateTime(2010, 02, 08));
            Enfants lucie = new Enfants("Lucie", "Dupont", new DateTime(2015, 05, 12));


  Employes bruno = new Employes("MAYEUX","Bruno",  new DateTime(2000, 10, 15), "Chef de projet", 45500, "Front-End",prapage, new List<Enfants>() { paul, lola });
            Employes pierre = new Employes("COURQUIN","Pierre",  new DateTime(2020, 5, 1), "Developpeur", 67500, "Front-End",afpa, new List<Enfants>() { });
            Employes martine = new Employes("POIX","Martine",  new DateTime(2021, 11, 01), "Stagiaire", 0, "Café",prapage, new List<Enfants>() { lucie});
            Employes quentin = new Employes("BALAIR","Quentin",  new DateTime(2017, 02, 15), "Developpeur", 0, "Back-End",prapage, new List<Enfants>() { });
            Employes maxence = new Employes("THACKER","Maxence",  new DateTime(2021, 11, 01), "Stagiaire", -1000, "Menage",afpa, new List<Enfants>() { });


            /* affichage de la prime */ 
            Console.WriteLine(bruno.Prime());
       

            /* Creation de la liste des employes */ 
            List<Employes> listeEmployes = new List<Employes>()
            {
                /* si on place directement dans la liste */
            bruno,
            pierre };
            /* si on voudrais en ajouter des nouveau au fur et a mesure dans la liste */ 
            listeEmployes.Add(martine);
            listeEmployes.Add(quentin);
            listeEmployes.Add(maxence);

            /* Afficher la liste d'employes */   
            Console.WriteLine("Nombre d'employer dans la societe : " + listeEmployes.Count);

            /* faire une recherche dans la liste des employes */
            Console.WriteLine("\n Avant TRI\n");
            foreach (var item in listeEmployes)
            {
                Console.WriteLine(item);
            }
            /* tri de la liste en utilisant la methode de comparaison Classement */ 
            listeEmployes.Sort(Employes.ClassementService); 

            /* recherche dans la liste */
            Console.WriteLine("\n APRES TRI\n");
            foreach (var item in listeEmployes)
            {
                Console.WriteLine(item);
            }


            /* Masse salariale Annuel initialiser a 0 */ 
            double masseSalarialeAnnuelle=0;
            foreach (var item in listeEmployes)
            {
                masseSalarialeAnnuelle += item.MasseSalariale();
            }
            Console.WriteLine("La masse salariale annuelle est de " + masseSalarialeAnnuelle); }

          public enum ValeurChequeNoel
        {
            C20,
            C30,
            C50
        }
    }
}
