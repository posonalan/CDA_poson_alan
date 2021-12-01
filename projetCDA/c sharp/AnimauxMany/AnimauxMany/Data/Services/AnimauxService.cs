using AnimauxMany.Data.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Services
{
    public class AnimauxService
    {
      

        private readonly animauxmanybddContext _context;

        public AnimauxService(animauxmanybddContext context)
        {
            _context = context;
        }

        public void AddAnimaux(Animaux obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Animaux.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAnimaux(Animaux obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Animaux.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Animaux> GetAllAnimaux()
        {
            return _context.Animaux.ToList();
        }

        public Animaux GetAnimauxById(int id)
        {
            return _context.Animaux.FirstOrDefault(obj => obj.IdAnimaux == id);
        }

        public void UpdateAnimaux(Animaux obj)
        {
            _context.SaveChanges();
        }


    }
}
