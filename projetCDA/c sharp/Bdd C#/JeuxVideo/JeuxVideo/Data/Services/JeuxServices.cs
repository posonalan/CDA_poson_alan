using JeuxVideo.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JeuxVideo.Data.Services
{
    public class JeuxServices
    {
        /* ***** Propriété ***** */
        private readonly MyDbContext _context; /* _context au format MyDbContext */

        /* ***** Constructeur ***** */
        public JeuxServices(MyDbContext context)
        {
            _context = context;
        }

        /* Fonction ajout de personne */
        public void AddJeu(Jeu p) /* le p est au format personne */
        {
            if (p == null) { throw new ArgumentNullException(nameof(p)); } /* si le p est null 'vide' on genere une erreur et on la montre */
            _context.Jeux.Add(p); _context.SaveChanges(); /* ajout du p et sauvegarde */
        }
        /* fonction de suppression d'un jeu , pauvre jeu ... */
        public void DeleteJeu(Jeu p)
        { //si l'objet jeu est null, on renvoi une exception
            if (p == null) { throw new ArgumentNullException(nameof(p)); }
            // on met à jour le context
            _context.Jeux.Remove(p);
            _context.SaveChanges();
        }
        /* fonction get liste : affichage de la liste */
        public IEnumerable<Jeu> GetAllJeux()
        {
            return _context.Jeux.ToList();
        }
        /* fonction getById : chercher par id */
        public Jeu GetJeuById(int id)
        { /* first le premier ou celui par default */
            return _context.Jeux.FirstOrDefault(p => p.IdJeu == id);
        }

        public void UpdateJeu(Jeu p)
        {
            /* nothing on va mettre à jour le context dans le controller par mapping et passer les modifs à la base */

        }

       
    }
}
