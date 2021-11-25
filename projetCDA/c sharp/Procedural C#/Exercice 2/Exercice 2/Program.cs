using System;

namespace Exercice_2
{
    class Program
    {
        static void Main(string[] args)
        {
            /* Exo 1 - Successeur */
            string var;
            int varInt;
            Console.Write("Saisissez un caractère : ");
            var = Console.ReadLine();
            varInt = (int)char.Parse(var);
            Console.WriteLine("Son successeur dans la table UNICODE est : " + (char)(varInt + 1) + " soit le code : " + (varInt + 1));



            // 2.2
            char val1 = '0';
            char val2 = '1';
            char val3 = '2';
            char val4 = '3';
            char val5 = '4';
            char val6 = '5';
            char val7 = '6';
            char val8 = '7';
            char val9 = '8';
            char val10 = '9';

            Console.WriteLine((int)val1);
            Console.WriteLine((int)val2);
            Console.WriteLine((int)val3);
            Console.WriteLine((int)val4);
            Console.WriteLine((int)val5);
            Console.WriteLine((int)val6);
            Console.WriteLine((int)val7);
            Console.WriteLine((int)val8);
            Console.WriteLine((int)val9);
            Console.WriteLine((int)val10);

            Console.WriteLine("Carton et camion : \n");

            string Kk;
            double k; /* kilo par cartons */
            string Mm;
            double m; /* poid permis dans le camion */
            string Nn;
            int n; /* nombre de cartons */

            Console.WriteLine("Saississez le poid des cartons : ");
            Kk = Console.ReadLine();
            k = double.Parse(Kk);
            Console.WriteLine("Saississez le nombre de cartons : ");
            Nn = Console.ReadLine();
            n = Int32.Parse(Nn);
            Console.WriteLine("Saississez le poids permis par camion : ");
            Mm = Console.ReadLine();
            m = Int32.Parse(Mm);

            Console.WriteLine("Chaque cartons pése : " + k + "kg , les camions peuvent accepter jusqu'a  " + m +
            "kg .\n Avec : " + n + " cartons , nous remplirons " + ((k * n) / m) + " camions \n");






        }
    }
}
