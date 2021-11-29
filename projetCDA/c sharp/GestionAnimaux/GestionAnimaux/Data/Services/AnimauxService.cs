using GestionAnimaux.Data.Dtos;
using GestionAnimaux.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GestionAnimaux.Data.Services
{
    public class AnimauxService
    {
        /* ***** Propriété ***** */
        private readonly MyDbContext _context; /* _context au format MyDbContext */

        /* ***** Constructeur ***** */
        public AnimauxService(MyDbContext context)
        {
            _context = context;
        }

        public IEnumerable<Animal> GetAllAnimal()
        {
            var liste = (from animal in _context.Animaux
                         join aliment in _context.Alimentation
                         on animal.IdAliment equals aliment.IdAliment
                         select new Animal
                         {
                             IdAnimal = animal.IdAnimal,
                             Nom = animal.Nom,
                             IdAliment = aliment.IdAliment,
                             Aliment = aliment
                         }).ToList();
            return liste;
        }
        public IEnumerable<Animal> GetAnimalById(int id)
        {
            var UnAnimal = (from animal in _context.Animaux
                         join aliment in _context.Alimentation
                         on animal.IdAliment equals aliment.IdAliment
                         select new Animal
                         {
                             IdAnimal = animal.IdAnimal,
                             Nom = animal.Nom,
                             IdAliment = aliment.IdAliment,
                             Aliment = aliment
                         }).FirstOrDefault(p => p.IdAnimal == id);
             return UnAnimal;
        }




        /* Fonction ajout de un Animal */
        public void AddAnimal(AnimauxDTOIn p) /* le p est au format personne */
        {
            if (p == null) 
            { 
                throw new ArgumentNullException(nameof(p));
            } /* si le p est null 'vide' on genere une erreur et on la montre */
            var entite = new Animal()
            {
                Nom = p.Nom,
                IdAliment = p.IdAliment,
            };
            _context.Add(p);
            _context.SaveChanges(); /* ajout du p et sauvegarde */
        }

        /* fonction de suppression d'un Animal , pauvre Bete :'( */
        public void DeleteAnimal(Animal p)
        { //si l'objet Animal est null, on renvoi une exception
            if (p == null) { throw new ArgumentNullException(nameof(p)); }
            // on met à jour le context
            _context.Animaux.Remove(p);
            _context.SaveChanges();
        }

        ///* fonction get liste : affichage de la liste */
        //public IEnumerable<Animal> GetAllAnimal()
        //{
        //    return _context.Animaux.ToList();
        //}
        /* fonction getById : chercher par id */
        //public Animal GetAnimalById(int id)
        //{ /* first le premier ou celui par default */
        //    return _context.Animaux.FirstOrDefault(p => p.IdAnimal == id);
        //}

        public void UpdateAnimal(Animal p)
        {
           if (p == null)
            {
                throw new ArgumentNullException(nameof(p)); 
            }
            var ani = new Animal()
            {
                IdAnimal = p.IdAnimal,
                Nom = p.Nom,
                IdAliment = p.IdAliment,
            };
            _context.Update(p);
            _context.SaveChanges();


           }
        }




    }

