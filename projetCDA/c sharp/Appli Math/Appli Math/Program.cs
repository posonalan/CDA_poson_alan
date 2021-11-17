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
            string cC;
            int c;
            string dD;
            int d;
            string pr;
            int p;
            string dI;
            int di;

            Console.WriteLine("Choisissez la forme : triangle ou rectangle ou para ou pyra ou sphere ");
            form = Console.ReadLine();
            if (form == "rectangle" || form == "carre") /* rectangle */
            {
                Console.Write("Donnez moi la longueur : ");
                aA = Console.ReadLine();
                a = Int32.Parse(aA);

                Console.Write("Donnez moi la largeur : ");
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

            else if (form == "triangle")
            {
                Console.Write("Donnez moi la Hauteur : ");
                dD = Console.ReadLine();
                d = Int32.Parse(dD);

                Console.Write("Donnez moi la Base : ");
                bB = Console.ReadLine();
                b = Int32.Parse(bB);

                Triangles triangle1 = new Triangles(d, b);

                /* ***** Perimetre triangle ***** */
                Console.WriteLine("\n Voici le perimétre de votre triangle : " + triangle1.Perimetre() + " cm .");
                /* *****    Air Triangle     ***** */
                Console.WriteLine("\n Voici l'air de votre triangle : " + triangle1.Aire() + " cm .");
                /* *****    afficher      ***** */
                Console.WriteLine("\n" + triangle1.Afficher());
            }
            else if (form == "para")
            {


                /* ****** para ***** */

                Console.Write("Donnez moi la Hauteur : ");
                dD = Console.ReadLine();
                d = Int32.Parse(dD);

                Console.Write("Donnez moi la longueur : ");
                bB = Console.ReadLine();
                b = Int32.Parse(bB);

                Console.Write("Donnez moi la largeur : ");
                cC = Console.ReadLine();
                c = Int32.Parse(cC);

                Parallelepipedes para1 = new Parallelepipedes(d, b, c);
                /* ***** Perimetre Para ***** */
                Console.WriteLine("\n Voici le perimétre de votre para : " + para1.Perimetre() + " cm .");
                /* *****    volume      ***** */
                Console.WriteLine("\n" + para1.Volume());
            }


            else if (form == "pyra")
            {
                /* ***** pyramide ***** */

                Console.Write("Donnez moi la Profondeur : ");
                pr = Console.ReadLine();
                p = Int32.Parse(pr);

                Console.Write("Donnez moi la Hauteur : ");
                dD = Console.ReadLine();
                d = Int32.Parse(dD);

                Console.Write("Donnez moi la Base : ");
                bB = Console.ReadLine();
                b = Int32.Parse(bB);

                Pyramides pyramide1 = new Pyramides(p, d, b);

                /* ***** Perimetre Pyra ***** */
                Console.WriteLine("\n Voici le perimétre de votre pyra : " + pyramide1.Perimetre() + " cm .");
                /* *****    Volume Pyra     ***** */
                Console.WriteLine("\n Voici l'air de votre pyra : " + pyramide1.Volume() + " cm .");
                /* *****    afficher      ***** */
                Console.WriteLine("\n" + pyramide1.Afficher());
            }
            else if (form == "sphere")
                /* ***** Sphere ***** */

                Console.Write("Donnez moi le diametre : ");
            dI = Console.ReadLine();
            di = Int32.Parse(dI);

            Spheres sphere1 = new Spheres(di);


            /* *****    volume Sphere   ***** */
            Console.WriteLine("\n Voici l'air de votre sphere : " + sphere1.Volume() + " cm .");
            /* *****    afficher      ***** */
            Console.WriteLine("\n" + sphere1.Afficher());
        }
    }





}


