using System;

namespace Exercice_4
{
    class Program
    {
        static void Main(string[] args)
        {


            double value1, value2;
            char operateur;

            value1 = demanderDouble();
            do
            {
                operateur = demanderOperateur();
                switch (operateur)
                {
                    case '-':
                    case '+':
                    case '*':
                        value2 = demanderDouble();
                        value1 = calculSimple(value1, value2, operateur);
                        break;
                    case '/':
                        value2 = demanderDoubleNonNull();
                        value1 = calculSimple(value1, value2, operateur);
                        break;
                    case '$':
                        value2 = demanderEntierPositif();
                        value1 = calculSimple(value1, value2, operateur);
                        break;
                    case '!':
                        if (value1 % 1 == 0 && value1 > 0) // On vérifie que value1 est un Entier et qu'il est positif.
                        {
                            value1 = calcul(value1, operateur);
                        }
                        else
                        {
                            Console.WriteLine("Calcul impossible !");
                        }
                        break;
                    case 'V':
                        if (value1 > 0) // On vérifie que value1 est positif.
                        {
                            value1 = calcul(value1, operateur);
                        }
                        else
                        {
                            Console.WriteLine("Calcul impossible !");
                        }
                        break;
                    case '=':
                        break;
                    default:
                        Console.WriteLine("Opérateur incorrect.");
                        break;
                }

                Console.WriteLine("Résultat = " + value1);
                if (operateur == '=')
                {
                    Console.WriteLine("Merci d'avoir utiliser cette calculatrice made in AFPA.");
                }
            } while (operateur != '=');
            public static int demanderEntierPositif(string texte)
            {
                int valeur;
                bool conversionReussie;
                do
                {
                    Console.WriteLine(texte);
                    conversionReussie = int.TryParse(Console.ReadLine(), out valeur);

                } while (!conversionReussie || valeur < 0);
                return valeur;
            }

            static double demanderDouble(string texte)
            {
                double nb;
                bool ok;
                do
                {
                    Console.Write(texte);
                    ok = double.TryParse(Console.ReadLine(), out nb);
                } while (!ok);
                return nb;
            }

            public static double demanderDoubleNonNull(string texte)
            {
                double n;
                bool conversionReussie;
                do
                {
                    Console.WriteLine(texte);
                    conversionReussie = double.TryParse(Console.ReadLine(), out n);
                } while (!conversionReussie || n != 0);
                return n;
            }

            static char DemanderOperateur()
            {
                bool ok = true;
                char op;
                bool condition;

                do
                {
                    Console.Write("Entrez un opérateur +,-,*,/,$,!,V : ");
                    ok = char.TryParse(Console.ReadLine(), out op);
                    condition = !ok || (op != '+' && op != '-' && op != '*' && op != '/' && op != '$' && op != '!' && op != 'V' && op != 'v');
                    if (condition)
                        Console.WriteLine("Saisie incorrecte.");

                } while (condition);
                return char.ToUpper(op);
            }

            static double calculSimple(double valeur1, char operateur, double valeur2)
            {
                double resultat = 0;
                switch (operateur)
                {
                    case '+':
                        resultat = valeur1 + valeur2;
                        break;
                    case '-':
                        resultat = valeur1 - valeur2;
                        break;
                    case '*':
                        resultat = valeur1 * valeur2;
                        break;
                    case '/':
                        resultat = valeur1 / valeur2;
                        break;
                    case '$':
                        resultat = Math.Pow(valeur1, valeur2);
                        break;
                    default:
                        break;
                }
                return resultat;





            }















        }
    }
}
