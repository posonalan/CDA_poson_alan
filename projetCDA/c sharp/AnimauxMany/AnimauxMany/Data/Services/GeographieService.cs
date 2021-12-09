using AnimauxMany.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Services
{
    public class GeographieService
    {

        private readonly animauxmanybddContext _context;

        public GeographieService(animauxmanybddContext context)
        {
            _context = context;
        }

        public void AddGeographie(Geographie obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Geographies.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteGeographie(Geographie obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Geographies.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Geographie> GetAllGeographie()
        {
            return _context.Geographies.Include("MilieuVies.Animaux").ToList();
        }

        public Geographie GetGeographieById(int id)
        {
            return _context.Geographies.FirstOrDefault(obj => obj.IdGeographie == id);
        }

        public void UpdateGeographie(Geographie obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }


    }
}
