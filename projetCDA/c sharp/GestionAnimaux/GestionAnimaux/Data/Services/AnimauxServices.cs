using GestionAnimaux.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GestionAnimaux.Data.Services
{
    public class AnimauxServices
    {
        /* ***** Propriété ***** */
        private readonly MyDbContext _context; /* _context au format MyDbContext */

        /* ***** Constructeur ***** */
        public AnimauxServices(MyDbContext context)
        {
            _context = context;
        }

        /* Fonction ajout de un Animal */
        public void AddAnimal(Animal p) /* le p est au format personne */
        {
            if (p == null) { throw new ArgumentNullException(nameof(p)); } /* si le p est null 'vide' on genere une erreur et on la montre */
            _context.Animaux.Add(p); _context.SaveChanges(); /* ajout du p et sauvegarde */
        }

        /* fonction de suppression d'un Animal , pauvre Bete :'( */
        public void DeleteAnimal(Animal p)
        { //si l'objet Animal est null, on renvoi une exception
            if (p == null) { throw new ArgumentNullException(nameof(p)); }
            // on met à jour le context
            _context.Animaux.Remove(p);
            _context.SaveChanges();
        }

        /* fonction get liste : affichage de la liste */
        public IEnumerable<Animal> GetAllAnimaux()
        {
            return _context.Animaux.ToList();
        }
        /* fonction getById : chercher par id */
        public Animal GetAnimalById(int id)
        { /* first le premier ou celui par default */
            return _context.Animaux.FirstOrDefault(p => p.IdAnimal == id);
        }

        public void UpdateAnimal(Animal p)
        {
            /* nothing on va mettre à jour le context dans le controller par mapping et passer les modifs à la base */

        }




    }
}
