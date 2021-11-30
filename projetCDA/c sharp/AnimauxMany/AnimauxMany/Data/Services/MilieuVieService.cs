using AnimauxMany.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Services
{
    public class MilieuVieService
    {
        private readonly animauxmanybddContext _context;

        public MilieuVieService(animauxmanybddContext context)
        {
            _context = context;
        }

        public void AddMilieuVie(MilieuVie obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.MilieuVies.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteMilieuVie(MilieuVie obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.MilieuVies.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<MilieuVie> GetAllMilieuVie()
        {
            return _context.MilieuVies.ToList();
        }

        public MilieuVie GetMilieuVieById(int id)
        {
            return _context.MilieuVies.FirstOrDefault(obj => obj.Id == id);
        }

        public void UpdateMilieuVie(MilieuVie obj)
        {
            _context.SaveChanges();
        }


    }
}
