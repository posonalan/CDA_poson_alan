using CantineMartine.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Services
{
    class ProduitService
    {
            private readonly MyDbContext _context;
            public ProduitService(MyDbContext context)
            {
                _context = context;
            }

            public void AddProduit(Produit produit)
            {
                if (produit == null)
                {
                    throw new ArgumentNullException(nameof(produit));
                }
                _context.Add(produit);
                _context.SaveChanges();
            }

            public IEnumerable<Produit> GetAllProduits()
            {
                return _context.Produits.Include("CategProduit").ToList();
            }

            public void DeleteProduit(Produit produit)
            {
                if (produit == null)
                {
                    throw new ArgumentNullException(nameof(produit));
                }
                _context.Remove(produit);
                _context.SaveChanges();
            }

            public Produit GetProduitById(int id)
            {
                return _context.Produits.FirstOrDefault(p => p.IdProduit == id);
            }

            public void UpdateProduit(Produit obj)
            {
                _context.SaveChanges();
            }
        }
}
