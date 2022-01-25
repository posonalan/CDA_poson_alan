using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Services
{
    class CategoriesproduitService
    {

        private readonly MyDbContext _context;

        public CategoriesproduitService(MyDbContext context)
        {
            _context = context;
        }

        public void AddCategorieProduit(Categoriesproduit obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Categoriesproduits.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteCategorieProduit(Categoriesproduit obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Categoriesproduits.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Categoriesproduit> GetAllCategoriesProduit()
        {
            return _context.Categoriesproduits.ToList();
        }

        public Categoriesproduit GetCategorieProduitById(int id)
        {
            return _context.Categoriesproduits.FirstOrDefault(obj => obj.IdCategorieProduit == id);
        }

        public void UpdateCategorieProduit(Categoriesproduit obj)
        {
            _context.SaveChanges();
        }


    }
}
