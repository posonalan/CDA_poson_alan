using System;

namespace Compte
{
    class Program
    {
        static void Main(string[] args)
        {
            string Aa;
            int a;
            string Bb;
            int b;
            string numCompte;
            int nC;
            String cin;
            string nom;
            string prenom;
            string numero;
            int num;
            string operation;
            string som;
            int so; 


            Clients Clients2 = new Clients(/*CIN*/"EE333444",/*nom*/"Karimi",/*prenom*/"Samir",/*telephone*/ 06222222);

            //Comptes Compte1 = new Comptes(  proprietaire,12345.00,"€" );

            //Clients Clients1  = new Clients(/*CIN*/"EE333444",/*nom*/"Karimi",/*prenom*/"Samir",/*telephone*/ 06222222, Compte1);
            //Console.WriteLine(Compte1.ToString());

            Console.Write("Donner moi votre numero de compte : ");
            numCompte = Console.ReadLine();
            nC = Int32.Parse(numCompte);

            Console.Write("Donner Le CIN : ");
            cin = Console.ReadLine();


            Console.Write("Donner Le Nom : ");
            nom = Console.ReadLine();

            Console.Write("Donner Le Prénom: ");
            prenom = Console.ReadLine();

            Console.Write("Donner Le numéro de télephone:  ");
            numero = Console.ReadLine();
            num = Int32.Parse(numero);

            Clients Clients1 = new Clients(/*CIN*/cin,/*nom*/nom,/*prenom*/prenom,/*telephone*/ num);
            

            Console.WriteLine("Details du compte : ");

            Console.WriteLine("********************************************\n");

            Comptes Compte1 = new Comptes(0, "Euro", Clients1);
            Comptes Compte2 = new Comptes(0, "Euro", Clients2);

            Console.WriteLine(Compte1.ToString());

            Console.WriteLine("********************************************");

            Console.WriteLine(" Donnez le montant a deposer ");
            Console.WriteLine("Opération bien effectuée");

            Console.WriteLine("******************Credite*******************");

            Aa = Console.ReadLine();
            a = Int32.Parse(Aa);
            Compte1.Crediter(a);
            Console.WriteLine(Compte1.ToString());

            Console.WriteLine("*******************************************");

            Console.WriteLine(" Donnez moi le montant a retirer ");
            Console.WriteLine("Opération bien effectuée");

            Console.WriteLine("******************Debite*******************");

            Bb = Console.ReadLine();
            b = Int32.Parse(Bb);
            Compte1.Debiter(200);
            Console.WriteLine(Compte1.ToString());

            Console.WriteLine("*******************************************");

            Compte1.Decrire();
            Console.WriteLine(Compte1.ToString());

            Console.WriteLine("********************************************");

            Compte1.CrediteCompte(a, "euro");
            Console.WriteLine(Compte1.ToString());

            Console.WriteLine("**************Fonction Choix Debit ou Credit ******************************");

            Console.WriteLine(" Souhaitez vous Debiter(-) ou credité(+) ? ");
            operation = Console.ReadLine();
            
            Console.WriteLine(" Sommes  ");
            som = Console.ReadLine();
            so = Int32.Parse(som);
            Compte1.Transfere(so,operation); 
            Console.WriteLine(Compte1.ToString());

            Console.WriteLine("Opération bien effectuée");
































            //Console.WriteLine(Compteur.Comptes);



            //            Console.WriteLine("\n Cin : " + Clients1.Cin + "\n Nom : " + Clients1.Nom + "\n Prenom : " + Clients1.Prenom + "\n Telephone : " + Clients1.Telephone + "\n ");
            //            Console.WriteLine("********************************************");
            //            Console.WriteLine("\n Cin : " + Clients2.Cin + "\n Nom : " + Clients2.Nom + "\n Prenom : " + Clients2.Prenom + "\n Telephone : " + Clients2.Telephone + "\n ");
            //            Console.WriteLine("********************************************\n");
            //            Console.WriteLine("\n code : "+Compte1.Code+ "\n solde : " + Compte1.Solde+ "\n Cin : " + Clients2.Cin + "\n Nom : " + Clients2.Nom + "\n Prenom : " + Clients2.Prenom + "\n Telephone : " + Clients2.Telephone + "\n ");
            //            Console.WriteLine("********************************************\n");



            //            Console.WriteLine("Nom du titulaire du compte 2 : " +
            //Compte1);



        }
    }
}