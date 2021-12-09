using AnimauxTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Services
{
    public class AlimentationService
    {

        private readonly AnimauxtestContext _context;

        public AlimentationService(AnimauxtestContext context)
        {
            _context = context;
        }

        public void AddAliment(Alimentation obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Alimentation.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAliment(Alimentation obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Alimentation.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Alimentation> GetAllAliment()
        {
            return _context.Alimentation.ToList();
        }

        public Alimentation GetAlimentById(int id)
        {
            return _context.Alimentation.FirstOrDefault(obj => obj.Id == id);
        }

        public void UpdateAliment(Alimentation obj)
        {
            _context.SaveChanges();
        }


    }
}
