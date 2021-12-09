using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestUnitaireNovice
{
    public class Personnage
    {

        public string Nom { get; set; }

        public string Prenom { get; set; }
        public int Age { get; set; }

        public const string AgeMortMessage = "ans , Vous etes surement mort";
        public const string AgeIncorrectMessage = "L'age entrer est incorrect ";

        public Personnage(string nom, string prenom, int age)
        {
            this.Nom = nom;
            this.Prenom = prenom;
            this.Age = age;
        }

        public void AgeDemander(int agedem)
        {
            if (agedem == 10)
            {
                Age += 10;
            }
            else if (agedem == 20)
            {
                Age += 20;
            }
            else if (agedem == 30)
            {
                Age -= 30;
            }
            else if (agedem > 100)
            {
                throw new ArgumentOutOfRangeException(" Avec vos ", Age, AgeMortMessage);
            }
            throw new ArgumentOutOfRangeException("votre demande", agedem, AgeIncorrectMessage);
        }

        public void AgePasser(int agedem)
        {
            if (agedem < 0)
            {
                throw new ArgumentOutOfRangeException("indisponible");
            }
            Age += 10; 
        }




    }
}
