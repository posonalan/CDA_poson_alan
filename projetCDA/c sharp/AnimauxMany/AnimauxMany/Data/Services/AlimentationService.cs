using AnimauxMany.Data.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Services
{
    public class AlimentationService
    {

        private readonly animauxmanybddContext _context;

        public AlimentationService(animauxmanybddContext context)
        {
            _context = context;
        }

        public void AddAliment(Alimentation obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Alimentations.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAliment(Alimentation obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Alimentations.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Alimentation> GetAllAliment()
        {
            return _context.Alimentations.ToList();
        }

        public Alimentation GetAlimentById(int id)
        {
            return _context.Alimentations.FirstOrDefault(obj => obj.IdAlimentations == id);
        }

        public void UpdateAliment(Alimentation obj)
        {
            _context.SaveChanges();
        }


    }
}
