using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Services
{
    class ApprovisionnementServices
    {
        private readonly VGContext _context;

        public ApprovisionnementServices(VGContext context)
        {
            _context = context;
        }

        public void AddApprovisionnement(Approvisionnement obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Approvisionnements.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteApprovisionnement(Approvisionnement obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Approvisionnements.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Approvisionnement> GetAllApprovisionnement()
        {
            return _context.Approvisionnements.ToList();
        }

        public Approvisionnement GetApprovisionnementById(int id)
        {
            return _context.Approvisionnements.FirstOrDefault(obj => obj.IdApprovisionnement == id);
        }

        public void UpdateApprovisionnement(Approvisionnement obj)
        {
            _context.SaveChanges();
        }


    }
}
