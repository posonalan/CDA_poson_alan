using AnimauxMany.Data.Models;
using AnimauxTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Services
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
            _context.Animauxes.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAnimaux(Animaux obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Animauxes.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Animaux> GetAllAnimauxService()
        {
            return _context.Animauxes.ToList();
        }

        public Animaux GetAnimauxById(int id)
        {
            return _context.Animauxes.FirstOrDefault(obj => obj.IdAnimaux == id);
        }

        public void UpdateAnimaux(Animaux obj)
        {
            _context.SaveChanges();
        }


    }
}
