using System;

namespace Exercise_3
{
    class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Saisir l’âge de l’utilisateur et lui dire s’il est majeur ou s’il est mineur.");

            //string age;
            //int a;
            //Console.Write("Saisissez votre age : \n");
            //age = Console.ReadLine();
            //a = Int32.Parse(age); 
            //    if (a<18)
            //        {
            //            Console.WriteLine(" Vous etes un mineur !"); 

            //        }
            //    else 
            //        {
            //            Console.WriteLine("Vous etes definitivement un majeur ... ");
            //}

            //Console.WriteLine("Saisir une valeur, afficher sa valeur absolue.");

            //string valeur;
            //int v;
            //Console.Write("Saisissez votre valeur : \n");
            //valeur = Console.ReadLine();
            //v = Int32.Parse(valeur);

            //if (v> 0)
            //{
            //    Console.WriteLine(" La valeur absolut de " + v + " est X !");
            //}
            //else {
            //    if (v < 0)
            //    {
            //        Console.WriteLine(" La valeur absolut de " + v + " est -X !");
            //    }

            //    else
            //    {
            //        Console.WriteLine(" la valeur absolut de " + v + " est 0");
            //    }
            //}

            // Console.WriteLine("Saisir une note, afficher ”ajourné” si la note est inférieure à 8, " + "”rattrapage” entre 8 et 10, "”admis” dessus de 10.");

            //string note;
            //double n;

            //Console.Write("Saisissez votre note : \n");
            //note = Console.ReadLine();
            //n = double.Parse(note);

            //if (n < 8)
            //{

            //    Console.WriteLine(" Votre note de " + n + " vous ajourne , triste nouvelle !");
            //}
            //else
            //{
            //    if (n > 10)
            //    {
            //        Console.WriteLine(" Votre note de " + n + " vous permet d'etre admis , Félicitation !");
            //    }

            //    else
            //    {
            //        Console.WriteLine(" Votre note de " + n + " vous propulse directement en rattrappage !");
            //    }
            //}


            // Une compagnie d’assurance effectue des remboursements sur lesquels est ponctionnée une
            //franchise correspondant à 10 % du montant à rembourser.Cependant, cette franchise ne doit
            //pas excéder 4000 euros.Demander à l’utilisateur de saisir le montant des dommages, afficher
            //ensuite le montant qui sera remboursé ainsi que la franchise.


            //string montant;
            //double m; 



            //Console.Write(" saisissez le montant des dommages : \n");
            //montant = Console.ReadLine();
            //m = double.Parse(montant);

            //if (m >4000)
            //{

            //    Console.WriteLine(" Voici le coup de la franchise "+(m*10/100)+ ", elle a etait etablie sur le montant de vos reparation , cest a dire " + m + " euro.");
            //}
            //else
            //{
            //    Console.WriteLine(" Helas le coup des reparations est trop important nous ne prennons pas en charge votre vehicule ");
            //}


            // Afficher sur deux valeurs saisies le nombre de valeurs distinctes


            //string ValeurA;
            //int a ;
            //string ValeurB;
            //int b; 

            //Console.Write(" saisissez la premiere valeur : \n");
            //ValeurA = Console.ReadLine();
            //a = Int32.Parse(ValeurA);
            //Console.Write(" saisissez la deuxieme valeur : \n");
            //ValeurB = Console.ReadLine();
            //b = Int32.Parse(ValeurB);

            //if(a == b)
            //{
            //    Console.WriteLine(" les valeurs " + a + " et " + b + " sont les memes ");
            //}
            //else
            //{
            //    Console.WriteLine(" les valeurs "+a+" et " +b+ " sont distinctes ");
            //}


            // Plus petite valeur parmi 3 Afficher sur trois valeurs saisies la plus petite.
            //            int a;
            //            int b;
            //            Console.WriteLine("veuillez saisir la 1re valeur");
            //            a = Convert.ToInt32(Console.ReadLine());
            //            Console.WriteLine("veuillez saisir la 2eme valeur");
            //            b = Convert.ToInt32(Console.ReadLine());
            //            if(a==b)
            //            {
            //                Console.WriteLine("1 seul valeur distinct");
            //            }
            //            else
            //            {
            //                Console.WriteLine("2 valeurs separes");
            //            };


            //int a;
            //int b;
            //int c;
            //int min;
            //Console.Write("Entrez la première valeur : ");
            //a = Convert.ToInt32(Console.ReadLine());
            //Console.Write("Entrez la deuxième valeur : ");
            //b = Convert.ToInt32(Console.ReadLine());
            //Console.Write("Entrez la troisième valeur : ");
            //c = Convert.ToInt32(Console.ReadLine());
            //if (a <= b)
            //{
            //    min = a;
            //}
            //else
            //{
            //    min = b;
            //}
            //if (c <= min)
            //{
            //    min = c;
            //}
            //Console.Write("La plus petite valeur est : " + min);




            //            Ecrire un programme demandant à l’utilisateur de saisir
            //— deux valeurs a et b, de type int ;
            //— un opérateur op de type char, vérifiez qu’il s’agit de l’une des valeurs suivantes : +, - ,
            //*, /.
            //Puis affichez le résultat de l’opération a op b.


            //int a;
            //int b;
            //char c;

            //Console.Write(" saisissez la premiere valeur : \n");
            //a = Int32.Parse(Console.ReadLine());
            //Console.Write(" saisissez la deuxieme valeur : \n");
            //b = Int32.Parse(Console.ReadLine());
            //Console.Write(" saisissez l'operateur de calcule : \n");





            //c = char.Parse(Console.ReadLine());
            //switch (c)
            //{
            //    case '-':
            //        Console.WriteLine(a - b);
            //        break;
            //    case '+':
            //        Console.WriteLine(a + b);
            //        break;
            //    case '*':
            //        Console.WriteLine(a * b);
            //        break;
            //    case '/': 
            //        if (b == 0)
            //        {
            //            Console.WriteLine("Division impossible par 0");
            //        }
            //        else
            //        {
            //            Console.WriteLine(a / b);
            //        }
            //        break;
            //        default:
            //        console.WriteLine("Operateur invalide");
            //        break;
            //}


            /******************************************************** JEU ECHEC *****************************************/

            // On indice les cases d’un échiquier avec deux indices i et j variant tous deux de 1 à 8.La case (i,
            //j) est sur la ligne i et la colonne j. Par convention, la case (1, 1) est noire.



            //    int j;
            //    int i;

            //Console.Write(" saisissez la premiere valeur : \n");
            //j= Int32.Parse(Console.ReadLine());
            //Console.Write(" saisissez la deuxieme valeur : \n");
            //i = Int32.Parse(Console.ReadLine());

            //    if ((i + j) % 2 == 0)
            //    {
            //        Console.WriteLine(" tu est sur une case noire");
            //    }
            //else
            //    {

            //        Console.WriteLine(" tu est sur une case blanche"); 
            //     }


            //            Ecrire un programme demandant à l’utilisateur de saisir les coordonnées(i, j) d’une première
            //case et les coordonnées(i′, j′) d’une deuxième case. Dites - lui ensuite s’il est possible de
            //déplacer un cavalier de(i, j) à(i′, j′).

            //int colonneDepart;
            //int ligneDepart;
            //int colonneArriver;
            //int ligneArriver;

            //Console.Write(" saisissez la premiere valeur : \n");
            //colonneDepart = Int32.Parse(Console.ReadLine());
            //Console.Write(" saisissez la deuxieme valeur : \n");
            //ligneDepart = Int32.Parse(Console.ReadLine());
            //Console.Write(" saisissez la troisieme valeur : \n");
            //colonneArriver = Int32.Parse(Console.ReadLine());
            //Console.Write(" saisissez la quatrieme valeur : \n");
            //ligneArriver = Int32.Parse(Console.ReadLine());



            //if (((Math.Abs(colonneDepart - colonneArriver ) == 2) &
            //    (Math.Abs(ligneDepart - ligneArriver) == 1)) ||
            //    ((Math.Abs(colonneDepart - colonneArriver) == 1) & 
            //    (Math.Abs(ligneDepart - ligneArriver) == 2)))
            //{

            //    Console.WriteLine(" tu peux te deplacer");
            //}
            //else
            //{
            //    Console.WriteLine(" bouge pas gamin ");
            //}


            /************************************************* DEBUT DU JEU D ECHEC ***********************************************************************/

            //int colonneDepart;
            //int ligneDepart;
            //int colonneArriver;
            //int ligneArriver;
            //int piece;
            //int jouer;
            //System.String deplacement = "pouvez vous deplacer";
            //System.String arret = " ne pouvez pas vous deplacer ! ";

            //Console.Write(" Pret pour une nouvelle partie ? 1 = oui / 2 = non  .  \n");
            //jouer = Int32.Parse(Console.ReadLine());


            //if (jouer == 1)
            {


                //Console.Write(" choisie ta piece : 0 = Cavalier, 1 = Tour, 2 = Fou, 3 = Dame, 4 = roi .  \n");
                //piece = Int32.Parse(Console.ReadLine());



                //while (piece > 4)
                //{
                //    Console.Write(" choisir une piece disponible \n");
                //    Console.Write(" choisie ta piece : 0 = Cavalier, 1 = Tour, 2 = Fou, 3 = Dame, 4 = roi .  \n");
                //    piece = Int32.Parse(Console.ReadLine());
                //}


                //Console.Write(" saisissez votre emplacement de depart ( colonne ) : \n");
                //colonneDepart = Int32.Parse(Console.ReadLine());
                //Console.Write(" saisissez votre emplacement de depart ( ligne ) :: \n");
                //ligneDepart = Int32.Parse(Console.ReadLine());
                //Console.Write(" saisissez votre emplacement de d arriver ( colonne ) : \n");
                //colonneArriver = Int32.Parse(Console.ReadLine());
                //Console.Write(" saisissez votre emplacement de d arriver ( ligne ) : \n");
                //ligneArriver = Int32.Parse(Console.ReadLine());





                //switch (piece)
                //{
                //    case 1: /* tour */ /* deux façons de coder un si */ 

                //        Console.WriteLine(" Vous" + (((colonneDepart == colonneArriver) || (ligneDepart == ligneArriver)) ? deplacement : arret));

                //if (
                //   (colonneDepart == colonneArriver) /*  si la colonne de depart et la meme que la colonne arriver */
                //  ||
                //   (ligneDepart == ligneArriver) /* si la ligne de depart est la meme que la ligne d'arriver */
                //   )



                //    Console.WriteLine(deplacement);


                //else
                //{
                //    Console.WriteLine(arret);
                //}
                //break;

                /* ***************************************** */

                //case 2: /* fou */

                //    Console.WriteLine(" Vous" + ((
                //      (Math.Abs(colonneDepart - colonneArriver))
                //      ==
                //      (Math.Abs(ligneDepart - ligneArriver))
                //      ) ? deplacement : arret));

                //    break;

                //if (

                //  (
                //  (Math.Abs(colonneDepart - colonneArriver))
                //  ==
                //  (Math.Abs(ligneDepart - ligneArriver))
                //  )

                //  )
                //{
                //    Console.WriteLine(deplacement);
                //}
                //else
                //{
                //    Console.WriteLine(arret);
                //}
                // break;

                /* ***************************************** */

                //case 3: /* dame */


                //    Console.WriteLine(" Vous" + ((
                //     (
                //      (Math.Abs(colonneDepart - colonneArriver))
                //      ==
                //      (Math.Abs(ligneDepart - ligneArriver))
                //     )
                //      ||
                //     (
                //      (colonneDepart == colonneArriver)
                //      ||
                //      (ligneDepart == ligneArriver)
                //     )
                //     ) ? deplacement : arret));

                //    break;

                // if

                //   (

                //   (
                //   (Math.Abs(colonneDepart - colonneArriver))
                //   ==
                //   (Math.Abs(ligneDepart - ligneArriver))
                //   )

                //   ||

                //(
                //(colonneDepart == colonneArriver)
                //||
                //(ligneDepart == ligneArriver)
                //)

                //)

                // {
                //     Console.WriteLine(deplacement);
                // }
                // else
                // {
                //     Console.WriteLine(arret);
                // }
                // break;

                /* ***************************************** */

                //case 4: /* roi */

                //    Console.WriteLine(" Vous" + ((
                //    (
                //     (Math.Abs(colonneDepart - colonneArriver) == 1) &
                //     (Math.Abs(ligneDepart - ligneArriver) == 0)
                //     )
                //     ||
                //     (
                //     (Math.Abs(colonneDepart - colonneArriver) == 0) &
                //     (Math.Abs(ligneDepart - ligneArriver) == 1)
                //     )
                //     ||
                //     (
                //     (Math.Abs(colonneDepart - colonneArriver) == 1) &
                //     (Math.Abs(ligneDepart - ligneArriver) == 1)
                //     )
                //     ) ? deplacement : arret));

                //    break;


                //if (


                // (
                // (Math.Abs(colonneDepart - colonneArriver) == 1) &
                // (Math.Abs(ligneDepart - ligneArriver) == 0)
                // )

                // ||

                // (
                // (Math.Abs(colonneDepart - colonneArriver) == 0) &
                // (Math.Abs(ligneDepart - ligneArriver) == 1)
                // )

                // ||

                // (
                // (Math.Abs(colonneDepart - colonneArriver) == 1) &
                // (Math.Abs(ligneDepart - ligneArriver) == 1)
                // )



                //)

                //{
                //    Console.WriteLine(deplacement);
                //}
                //else
                //{
                //    Console.WriteLine(arret);
                //}
                //break;

                /* ***************************************** */

                //case 0: /* cavalier */

                //    Console.WriteLine(" Vous" + ((
                //  (
                //        (Math.Abs(colonneDepart - colonneArriver) == 2) &
                //        (Math.Abs(ligneDepart - ligneArriver) == 1)
                //        )
                //        ||
                //        (
                //        (Math.Abs(colonneDepart - colonneArriver) == 1) &
                //        (Math.Abs(ligneDepart - ligneArriver) == 2)
                //        )
                //   ) ? deplacement : arret));
                //    break;



                //        if (

                //            (
                //            (Math.Abs(colonneDepart - colonneArriver) == 2) &
                //            (Math.Abs(ligneDepart - ligneArriver) == 1)
                //            )

                //            ||

                //            (
                //            (Math.Abs(colonneDepart - colonneArriver) == 1) &
                //            (Math.Abs(ligneDepart - ligneArriver) == 2)
                //            )

                //           )


                //        {
                //            Console.WriteLine(deplacement);
                //        }
                //        else
                //        {
                //            Console.WriteLine(arret);
                //        }
                //        break;

                //    }
                //}


                /**********************************************************************************************************************************/
                //string Hh;
                //int heure;
                //string Mm; 
                //int minute;

                //Console.Write(" qu'elle heure est il ? ( heure ).  \n");
                //Hh = Console.ReadLine();
                //heure = Int32.Parse(Hh);
                //Console.Write("qu'elle sont les minutes ?(minute). \n");
                //Mm = Console.ReadLine();
                //minute = Int32.Parse(Mm);
                //Console.WriteLine(" il est actuellement " + heure+":" + minute + ".");



                //string hd;
                //int heureDebut;
                //string hf;
                //int heureFin;
                //string md;
                //int minuteDebut;
                //string mf;
                //int minuteFin;
                //int compareHeure;
                //int compareMinute;
                ////System.String horaireD = " "+minuteDebut+ ;
                ////System.String horaireF = "pouvez vous deplacer";




                //Console.Write(" qu'elle est l'heure de depart ? ( heure ).  \n");
                //hd = Console.ReadLine();
                //heureDebut = Int32.Parse(hd);
                //Console.Write("qu'elle sont les minutes du depart ?(minute). \n");
                //md = Console.ReadLine();
                //minuteDebut = Int32.Parse(md);
                //Console.Write(" qu'elle heure arrivez vous ? ( heure ).  \n");
                //hf = Console.ReadLine();
                //heureFin = Int32.Parse(hf);
                //Console.Write("qu'elle sont les minutes que vous arrivez ?(minute). \n");
                //mf = Console.ReadLine();
                //minuteFin = Int32.Parse(mf);
                ////Console.WriteLine(" vous partez a " + heureDebut+":" + minuteDebut + " et vous arriverez pour "+heureFin+":"+minuteFin+" .");


                //compareHeure = (heureFin - heureDebut);
                //compareMinute = Math.Abs(minuteFin - minuteDebut);

                //if (compareMinute > 60)
                //{
                //    compareHeure = compareHeure++;
                //}

                //if ((heureDebut < heureFin) || (heureDebut == heureFin && minuteDebut < minuteFin))
                ////{
                ////if (heureDebut == heureFin && minuteDebut < minuteFin)
                //{


                //        Console.WriteLine("vous avez mis " + compareHeure + ":" + compareMinute + " de route");
                //    }


                ////    else
                ////    {
                ////        Console.WriteLine("Votre voyage est impossible, si vous partez a " + heureDebut + ":" + minuteDebut + " vous ne pouvez pas arriver a " + heureFin + ":" + minuteFin + ".");
                ////    }
                ////}


                //else
                //{
                //    Console.WriteLine("Votre voyage est impossible, si vous partez a " + heureDebut + "heures" + minuteDebut + " vous ne pouvez pas arriver a " + heureFin + ":" + minuteFin + ".");
                //}

                //}
                //}

                /******************************************************************************************************************************************/

                //    string Jr;
                //    int jour;
                //    string Ms;
                //    int mois;
                //    string An;
                //    int annee;
                //    int jourDemain;


                //    int moisDemain;
                //    int anneeDemain;
                //    int days;


                //    Console.Write(" Qu'elle jour sommes nous ? ( jour ).  ");
                //    Jr = Console.ReadLine();
                //    jour = Int32.Parse(Jr);
                //    Console.Write("\n Qu'elle mois sommes nous ?(mois). ");
                //    Ms = Console.ReadLine();
                //    mois = Int32.Parse(Ms);

                //    Console.Write("\n Qu'elle annee sommes nous ? ( annee ). ");
                //    An = Console.ReadLine();
                //    annee = Int32.Parse(An);
                //    days = DateTime.DaysInMonth(annee, mois);
                //    Console.WriteLine("\n Aujourdhui nous sommes le " + jour + "/" + mois + "/" + annee + ".");
                //    int anneeB;
                //    anneeB = annee;
                //    jourDemain = jour;
                //    moisDemain = mois;
                //    anneeDemain = annee;

                //    //if ( anneeB = 1900; anneeB <= 2060; anneeB++)
                //    //            {
                //    //                if (DateTime.IsLeapYear(anneeB)) Console.WriteLine(anneeB + " est une année bissextile");


                //    if (( annee %4==0 &&  annee %100 != 0 ) || ( annee % 400 == 0 ))
                //    {
                //        Console.WriteLine("\n L'année " + annee + " est une année bissextile ! ");
                //    }
                //    else
                //    {

                //        Console.WriteLine("\n L'année " + annee + "C'est pas une annee bissextile ! ");
                //    }


                //    if (mois == 12 && jour == 31)
                //    {
                //        anneeDemain = (annee + 1);

                //        moisDemain = 1;

                //        jourDemain = 1;

                //        Console.WriteLine(" \n Le lendemain du " + jour + "/" + mois + "/" + annee + " sera le " + jourDemain + "/" + moisDemain + "/" + anneeDemain + " bonne année ! ");
                //    }

                //    if (days % 2 == 0 || mois == 2 && jour == 28)

                //    {
                //        moisDemain = (mois + 1);
                //        jourDemain = 1;



                //        Console.WriteLine("\n Le lendemain du " + jour + "/" + mois + "/" + annee + " sera le " + jourDemain + "/" + moisDemain + "/" + anneeDemain + ".");


                //    }
                //    else
                //    {
                //        Console.WriteLine("\n Le lendemain du " + jour + "/" + mois + "/" + annee + " sera le " + (jourDemain + 1) + "/" + mois + "/" + annee + ".");

                //    }


                /**************************************************************************************************************************************************/

                /* Demandez à l’utilisateur de saisir les deux bornes a et b d’un intervalle [a, b]. Contrôler les
                valeurs saisies. */

                //string a;
                //string b;
                //a = "";
                //b = ""; 
               
                //while ( a != "a")
                //{

                //    Console.Write(" Ecrivez la premiere lettre de l'alphabet: ");
                //    a= Console.ReadLine();
                    
                //}

                //while (b != "b")
                //{

                //    Console.Write(" Ecrivez la deuxime lettre de l'alphabet : ");
                //    b = Console.ReadLine();

                //}

                //Console.WriteLine(" Vous avez bien repondu aux questions ! ");



                /**********************************************************************************/

                string a;
                string b;
                a = "";
                b = "";

                while (a != "2")
                {

                    Console.Write(" Trouver mon premier chiffre : ");
                    a = Console.ReadLine();
Console.WriteLine(" Et nous essaye encore ! ");
                }

                while (b != "3")
                {

                    Console.Write(" Trouver mon deuxieme chiffre : \n ");
                    b = Console.ReadLine();
                    Console.WriteLine(" Et nous essaye encore ! \");
                }

                Console.WriteLine(" Bien jouer tu a bien trouver mon premier numero : " +a+" et mon deuxieme "+b+", Felicitation");
                



            }

        }
    }
}






