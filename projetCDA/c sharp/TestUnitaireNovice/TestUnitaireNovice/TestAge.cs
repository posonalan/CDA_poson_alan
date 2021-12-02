using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace TestUnitaireNovice
{
    public class TestAge
    {

        Personnage personnage;


        [SetUp]
        public void Setup()
        {
            int AgeDepart = 20;
            personnage = new Personnage("Maurice", "Alorla", AgeDepart);

        }

        [Test]
        public void AgeSup()
        {
            /* Variable */
            int AgeAjout = 20;
            int AgeAttendu = 40;

            /* Action */
            personnage.AgeDemander(AgeAjout);

            /* Rendu */
            int AgeActuel = personnage.Age;
            Assert.AreEqual(AgeActuel, AgeAttendu, 000.1, "age erroné ");

        }

        [Test]
        public void AgeMoin()
        {
            /* variable */
            int AgeNegatif = -10;

            /* action */
            Assert.Throws<ArgumentOutOfRangeException>(() => personnage.AgePasser(AgeNegatif));
        }
        [Test]
        public void AgeTest()
        {
            // Arrange
            int ageOnVaTest = 10;

            // Act et  Assert
            Assert.Throws<ArgumentOutOfRangeException>(() => personnage.AgeDemander(ageOnVaTest));
        }



    }
}
