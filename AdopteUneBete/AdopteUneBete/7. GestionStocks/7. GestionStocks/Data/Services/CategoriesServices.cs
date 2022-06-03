using _7._GestionStocks.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Services
{
    class CategoriesServices
    {

        private readonly GestionStocksContext _context;

        public CategoriesServices(GestionStocksContext context)
        {
            _context = context;
        }

        public void AddCategories(Categories obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Categories.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteCategories(Categories obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Categories.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Categories> GetAllCategories()
        {
            return _context.Categories.Include("TypesProduits").Include("ListArticles").ToList();
        }

        public Categories GetCategoriesById(int id)
        {
            return _context.Categories.Include("TypesProduits").Include("ListArticles").FirstOrDefault(obj => obj.IdCategorie == id);
        }

        public void UpdateCategories(Categories obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }


    }
}
