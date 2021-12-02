using GestionStockAppli.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionStockAppli.Data.Services
{
    class TypeProduitService
    {


        private readonly MyDbContext _context;

        public TypeProduitService(MyDbContext context)
        {
            _context = context;
        }

        public void AddTypesproduits(typesproduit obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.TypesProduits.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteTypesProduits(typesproduit obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.TypesProduits.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<typesproduit> GetAllTypesProduits()
        {
            return _context.TypesProduits.ToList();
        }

        public typesproduit GetTypesproduitsById(int id)
        {
            return _context.TypesProduits.FirstOrDefault(obj => obj.IdTypeProduit == id);
        }

        public void UpdateTypesproduits(typesproduit obj)
        {
            _context.SaveChanges();
        }


    }
}
