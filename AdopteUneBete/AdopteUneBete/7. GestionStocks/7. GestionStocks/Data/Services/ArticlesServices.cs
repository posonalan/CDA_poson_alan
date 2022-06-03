using _7._GestionStocks.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Services
{
    public class ArticlesServices
    {

        private readonly GestionStocksContext _context;

        public ArticlesServices(GestionStocksContext context)
        {
            _context = context;
        }

        public void AddArticle(Articles obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Articles.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteArticle(Articles obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Articles.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Articles> GetAllArticles()
        {
            return _context.Articles.Include("Categorie").ToList();
        }

        public Articles GetArticleById(int id)
        {
            return _context.Articles.Include("Categorie").FirstOrDefault(obj => obj.IdArticle == id);
        }

        public void UpdateArticle(Articles obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }


    }
}
