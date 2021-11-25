using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestApi.Data.Models;

namespace TestApi.Data.Service
{
    /*Classe personnes services */ 
    public class PersonnesServices
    {    /* ***** Propriété ***** */ 
        private readonly MyDbContext _context; /* _context au format MyDbContext */ 
       
        /* ***** Constructeur ***** */
        public PersonnesServices(MyDbContext context) 
        {
            _context = context;
        }

        /* Fonction ajout de personne */ 
        public void AddPersonnes(Personne p) /* le p est au format personne */ 
        {
            if (p == null) { throw new ArgumentNullException(nameof(p)); } /* si le p est null 'vide' on genere une erreur et on la montre */ 
            _context.Personnes.Add(p); _context.SaveChanges(); /* ajout du p et sauvegarde */ 
        }
        /* fonction de suppression de personne , pauvre gens ... */ 
        public void DeletePersonne(Personne p) 
        { //si l'objet personne est null, on renvoi une exception
            if (p == null) { throw new ArgumentNullException(nameof(p)); }
            // on met à jour le context
            _context.Personnes.Remove(p);
            _context.SaveChanges();
        }
        /* fonction get liste : affichage de la liste */
        public IEnumerable<Personne> GetAllPersonnes()
        {
            return _context.Personnes.ToList();
        }
        /* fonction getById : chercher par id */ 
        public Personne GetPersonneById(int id)
        { /* first le premier ou celui par default */ 
            return _context.Personnes.FirstOrDefault(p => p.IdPersonnes == id);
        }

        public void UpdatePersonne(Personne p)
        {
            /* nothing on va mettre à jour le context dans le controller par mapping et passer les modifs à la base */

        }
    }
}

