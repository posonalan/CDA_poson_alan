using System;

namespace TestUnitaireNovice
{
    class Program
    {
        static void Main(string[] args)
        {
            Personnage personnage = new Personnage("Alan","Arial",20);
            personnage.AgeDemander(10);
            personnage.AgePasser(20);
            Console.WriteLine("votre age est de :", personnage.Age);
            Console.ReadKey(); // permet de garder la console ouverte
        }
    }
}
