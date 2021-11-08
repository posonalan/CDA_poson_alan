using System;

namespace Compte
{
    class Program
    {
        static void Main(string[] args)
        {

            Clients Clients1 = new Clients(/*CIN*/"EE111222",/*nom*/"Salim",/*prenom*/"Omar",/*telephone*/ 06111111);
            //Clients Clients2 = new Clients(/*CIN*/"EE333444",/*nom*/"Karimi",/*prenom*/"Samir",/*telephone*/ 06222222);

            //Comptes Compte1 = new Comptes(  proprietaire,12345.00,"€" );

            //Clients Clients1  = new Clients(/*CIN*/"EE333444",/*nom*/"Karimi",/*prenom*/"Samir",/*telephone*/ 06222222, Compte1);
            //Console.WriteLine(Compte1.ToString());
            Console.WriteLine("********************************************\n");
            Comptes Compte1 = new Comptes(12345.00, "Euro", Clients1);
            Console.WriteLine(Compte1.ToString());
            Console.WriteLine("********************************************");
            Compte1.Crediter(200);
            Console.WriteLine(Compte1.ToString());
            Console.WriteLine("********************************************");
            Compte1.Debiter(200);
            Console.WriteLine(Compte1.ToString());
            Console.WriteLine("********************************************");
            Compte1.Decrire();
            Console.WriteLine(Compte1.ToString());
            Console.WriteLine("********************************************");
            Console.CrediteCompte(200, "euro", ); 



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