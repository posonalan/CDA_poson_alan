using _7._GestionStocks.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Services
{
    class TypesProduitsServices
    {

        private readonly GestionStocksContext _context;

        public TypesProduitsServices(GestionStocksContext context)
        {
            _context = context;
        }

        public void AddTypesProduit(TypesProduits obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.TypesProduits.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteTypesProduit(TypesProduits obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.TypesProduits.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<TypesProduits> GetAllTypesProduits()
        {
            return _context.TypesProduits.ToList();
        }

        public TypesProduits GetTypesProduitById(int id)
        {
            return _context.TypesProduits.FirstOrDefault(obj => obj.IdTypeProduit == id);
        }

        public void UpdateTypesProduit(TypesProduits obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }


    }
}
