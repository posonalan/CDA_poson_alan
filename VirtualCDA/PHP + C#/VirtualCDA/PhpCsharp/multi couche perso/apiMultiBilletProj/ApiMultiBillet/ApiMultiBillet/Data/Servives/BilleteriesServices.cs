using ApiMultiBillet.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Data.Servives
{
    public class BilleteriesServices
    {
        private readonly MyDbContext _context;

        public BilleteriesServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddBilleterie(Billeterie obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Billeteries.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteBilleterie(Billeterie obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Billeteries.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Billeterie> GetAllBilleterie()
        {
            return _context.Billeteries.ToList();
        }

        public Billeterie GetBilleterieById(int id)
        {
            return _context.Billeteries.FirstOrDefault(obj => obj.IdBillet == id);
        }

        public void UpdateBilleterie(Billeterie obj)
        {
            _context.SaveChanges();
        }


    }
}
