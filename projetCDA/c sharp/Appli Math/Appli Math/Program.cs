using System;

namespace Appli_Math
{
    class Program
    {
        static void Main(string[] args)
        {
            string aA;
            int a;
            string bB;
            int b;
            string form;

            Console.WriteLine("Choisissez la forme : triangle ou rectangle");
            form = Console.ReadLine();
            if (form == "rectangle" || form =="carre") /* rectangle */ 
            {
                Console.Write("Donnez moi la longueur : ");
                aA = Console.ReadLine();
                a = Int32.Parse(aA);

                Console.Write("Donnez moi la longueur : ");
                bB = Console.ReadLine();
                b = Int32.Parse(bB);

                Rectangles rectangle1 = new Rectangles(a, b);

                /* ***** Perimetre rectangle ***** */
                Console.WriteLine("\n Voici le perimétre de votre rectangle : " + rectangle1.Perimetre() + " cm .");
                /* *****    Air rectangle     ***** */
                Console.WriteLine("\n Voici l'air de votre rectangle : " + rectangle1.Aire() + " cm .");
                /* *****    Un carre ?     ***** */
                Console.WriteLine("\n" + rectangle1.EstCarre());
                /* *****    afficher      ***** */
                Console.WriteLine("\n" + rectangle1.AfficherRectangle());

            }
            Console.Write("Donnez moi la Hauteur : ");
            aA = Console.ReadLine();
            a = Int32.Parse(aA);

            Console.Write("Donnez moi la Base : ");
            bB = Console.ReadLine();
            b = Int32.Parse(bB);

            Triangles triangle1 = new Triangles(a, b);

            /* ***** Perimetre triangle ***** */
            Console.WriteLine("\n Voici le perimétre de votre triangle : " + triangle1.Perimetre() + " cm .");
            /* *****    Air rectangle     ***** */
            Console.WriteLine("\n Voici l'air de votre triangle : " + triangle1.Aire() + " cm .");
            /* *****    afficher      ***** */
            Console.WriteLine("\n" + triangle1.AfficherTriangle());




        }
    }
}
