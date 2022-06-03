using AdopteUneBeteVisuel.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Services
{
    public class AnimauxServices
    {
        private readonly MyDbContext _context;

        public AnimauxServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddAnimaux(animaux obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Animaux.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAnimaux(animaux obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Animaux.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<animaux> GetAllAnimaux()
        {
            return _context.Animaux.Include("User").Include("Race").ToList();
        }

        public animaux GetAnimauxById(int id)
        {
            return _context.Animaux.Include("User").Include("Race").FirstOrDefault(obj => obj.Id_Animal == id);
        }

        public void UpdateAnimaux(animaux obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }
    }
}
