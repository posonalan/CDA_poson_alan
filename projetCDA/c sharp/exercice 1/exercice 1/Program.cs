using System;

namespace exercice_1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Exercice 1 : \n ");

            //string nom; 

            //Console.WriteLine("saisissez votre nom : ");
            //nom = Console.ReadLine();


            //string age;
            //int valeur; 
            //Console.WriteLine("saisissez votre age : ");
            //age = Console.ReadLine();
            //valeur= Int32.Parse(age);
            //Console.WriteLine("votre nom est "+ nom +" et vous avez " + valeur + " ans ! \n");

            //string Aa;
            //string Bb;
            //int a;
            //int b;

            //Console.WriteLine("saisissez votre 1er chiffre: ");
            //Aa = Console.ReadLine();
            //a = Int32.Parse(Aa);
            //Console.WriteLine("saisissez votre 2eme chiffre: ");
            //Bb = Console.ReadLine();
            //b = Int32.Parse(Bb);
            //Console.WriteLine("votre premiere chiffre est " + a + " et votre dexieme est  " + b + " le total de ces deux chiffres est "+(a+b)+" ! \n");

            string Cc;
            double c;

            Console.WriteLine("Saississez votre taille au format M,Cm : ");
            Cc = Console.ReadLine();
            c = double.Parse(Cc);
            Console.WriteLine("vous mesurez " + c + " cm  c'est deja pas mal ! \n");

            //string Dd;
            //int d;
            //string Ee;
            //int e;
            //string Ff;
            //int f;

            //Console.WriteLine("saisissez votre 1 er chiffre: ");
            //Dd = Console.ReadLine();
            //d = Int32.Parse(Dd);
            //Console.WriteLine("saisissez votre 2 eme chiffre: ");
            //Ee = Console.ReadLine();
            //e = Int32.Parse(Ee);
            //Console.WriteLine("saisissez votre 3 eme chiffre: ");
            //Ff = Console.ReadLine();
            //f = Int32.Parse(Ff);
            //Console.WriteLine("votre premiere chiffre est " + d + " , votre dexieme est  " + e + " et votre troisieme est  " + f +
            //".\n La moyenne de ces trois chiffres est " +((d+e+f)/3)+" ! \n");

            //Console.WriteLine("La surface d'un rectangle : ");

            //string Gg;
            //int g;
            //string Hh;
            //int h;
            //Console.WriteLine("Saississez la longueur : ");
            //Gg = Console.ReadLine();
            //g= Int32.Parse(Gg);
            //Console.WriteLine("Saississez la largeur : ");
            //Hh = Console.ReadLine();
            //h = Int32.Parse(Hh);
            //Console.WriteLine("votre longueur est " + g + " , votre largeur est  " + h +
            //". La surface du rectangle est " +(g*h)+" ! \n");

            //Console.WriteLine("Affectez le caractère ’a’ à une variable de type char, affichez ce caractère ainsi que son code UNICODE.\n");

            //char[] lettre = { 'A', 'B', 'C' };
            //string alphabet = new string(lettre);
            //Console.WriteLine("voici les 4 premieres lettre de l'alphabet : " + alphabet + " et voici le a " + lettre[0]+ " ainsi que son code unicode : U+0041 .");

            /* Exercice 1-7 */
            char a = 'B';
            Console.WriteLine("Le code ascii de " + a + " est : " + (int)a);
            Console.ReadLine();



            Console.WriteLine("transformer une Minuscule en Majuscule .\n");

            string lettre;

            Console.WriteLine("Saisissez une lettre : ");
            lettre = Console.ReadLine();
            Console.WriteLine(" voici la majuscule de votre lettre choisie : " + (lettre.ToUpper() )+" . \n"); 






        }
    }
}

