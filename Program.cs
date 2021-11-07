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
            //            Console.WriteLine("\n Cin : " + Clients1.Cin + "\n Nom : " + Clients1.Nom + "\n Prenom : " + Clients1.Prenom + "\n Telephone : " + Clients1.Telephone + "\n ");
            //            Console.WriteLine("********************************************");
            //            Console.WriteLine("\n Cin : " + Clients2.Cin + "\n Nom : " + Clients2.Nom + "\n Prenom : " + Clients2.Prenom + "\n Telephone : " + Clients2.Telephone + "\n ");
            //            Console.WriteLine("********************************************\n");
            //            Console.WriteLine("\n code : "+Compte1.Code+ "\n solde : " + Compte1.Solde+ "\n Cin : " + Clients2.Cin + "\n Nom : " + Clients2.Nom + "\n Prenom : " + Clients2.Prenom + "\n Telephone : " + Clients2.Telephone + "\n ");
            //            Console.WriteLine("********************************************\n");



            //            Console.WriteLine("Nom du titulaire du compte 2 : " +
            //Compte1);



            //Console.WriteLine("\n " + voiture2 + "\n " + voiture3 + "\n " + voiture4);

            //Console.WriteLine("\n Votre voiture " + voiture3.Marque + " " + voiture3.Modele + " avait  " + voiture3.NbKilometre + " kms en 2020.");
            //voiture3.Rouler(1200);
            //Console.WriteLine("\n Votre voiture " + voiture3.Marque + " " + voiture3.Modele + " a aujourdhui " + voiture3.NbKilometre + "kms. ");


            //// p.nom="TRUC" si attribut public
            //p.SetNom( "TRUC"); // si attribut privé

            ///* si les attributs sont public */
            ////Console.WriteLine("info de toto : " + toto.nom + " " + toto.prenom +" " + toto);

            ///* si privé */
            //Console.WriteLine("nom de p : " + p.GetNom());
            //Console.WriteLine(p.ToString());

            //Console.WriteLine("info de toto : " + toto.GetNom() + " " + toto.GetPrenom() +" " + toto.ToString());


            //Personnes p1 = new Personnes("MACHIN", "Bidule");
            //Console.WriteLine("p1 " + p1.ToString());

            //toto.Note = 3;
            //Console.WriteLine("la note de toto est : " + toto.Note);

            //Voitures v = new Voitures("titine", toto);
            //Console.WriteLine(v.ToString());
        }
    }
}