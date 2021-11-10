using System;
using System.Collections.Generic;

namespace SpaceInvaders_Alan
{
    class Program
    {
        static void Main(string[] args)
        {
            //List<> listeGrille = new List<Space>()
            //{ 
            //};

            Invader alien1 = new Invader("^=^", 2, true);
            Invader alien2 = new Invader("=_=", 2, true);
            Invader alien3 = new Invader("*o*", 2, true);
            Invader alien4 = new Invader("è=è", 2, true);


            Space grille1 = new Space(5, 10);   grille1.CreeGrille();
            Console.WriteLine("┌───────────────────┐");

            grille1.AfficherGrille(); 

           


            Console.WriteLine("└───────────────────┘");

             


        }
    }
}
