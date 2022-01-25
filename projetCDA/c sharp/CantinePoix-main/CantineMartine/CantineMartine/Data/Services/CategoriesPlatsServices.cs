using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Services
{
    class CategoriesPlatsServices
    {

        private readonly MyDbContext _context;

        public CategoriesPlatsServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddCategoriePlat(Categoriesplat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Categoriesplats.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteCategoriePlat(Categoriesplat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Categoriesplats.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Categoriesplat> GetAllCategoriesPlats()
        {
            return _context.Categoriesplats.ToList();
        }

        public Categoriesplat GetCategoriePlatById(int id)
        {
            return _context.Categoriesplats.FirstOrDefault(obj => obj.IdCategoriePlat == id);
        }

        public void UpdateCategoriePlat(Categoriesplat obj)
        {
            _context.SaveChanges();
        }


    }
}
