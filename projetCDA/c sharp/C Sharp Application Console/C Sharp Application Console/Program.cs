using System;

namespace C_Sharp_Application_Console
{
    class Program
    {
        static void Main(string[] args)
        {
          
            Voitures voiture1 = new Voitures();
            Voitures voiture2 = new Voitures(/*couleur*/"Bleu", /*marque*/"Mercedes", /*modele*/"W221", /*km*/12000, /* motorisation*/"220cc");
            Voitures voiture3 = new Voitures(/*couleur*/"Bleu", /*marque*/"Citroen", /*modele*/"C4", /*km*/10000, /* motorisation*/"220cc");
            Voitures voiture4 = new Voitures(/*couleur*/"Rouge", /*marque*/"Renault", /*modele*/"Kadjar", /*km*/10000, /* motorisation*/"220cc");


            Console.WriteLine("Marque : " + voiture3.Marque + " " + voiture3.Modele +" " + voiture3.NbKilometre); 
           
            Console.WriteLine("Marque : " + voiture4.Marque + " " + voiture4.Modele + " " + voiture4.Couleur);

            Console.WriteLine("\n "+voiture2+"\n "+ voiture3+"\n "+ voiture4);

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
