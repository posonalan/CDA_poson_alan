using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Services
{
    class CategorieClientServices
    {
        private readonly VGContext _context;

        public CategorieClientServices(VGContext context)
        {
            _context = context;
        }

        public void AddCategorieCLient(CategorieClient obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.CategoriesClient.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteCategorieCLient(CategorieClient obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.CategoriesClient.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<CategorieClient> GetAllCategorieClients()
        {
            return _context.CategoriesClient.ToList();
        }

        public CategorieClient GetCategorieCLientById(int id)
        {
            return _context.CategoriesClient.FirstOrDefault(obj => obj.IdCategorieClient == id);
        }

        public void UpdateCategorieCLient(CategorieClient obj)
        {
            _context.SaveChanges();
        }


    }
}
