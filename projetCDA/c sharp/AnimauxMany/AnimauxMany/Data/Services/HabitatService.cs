using AnimauxTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AnimauxMany.Data.Models;

namespace AnimauxTest.Data.Services
{
    public class HabitatService
    {


        private readonly animauxmanybddContext _context;

        public HabitatService(animauxmanybddContext context)
        {
            _context = context;
        }

        public void AddHabitat(Habitat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Habitats.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteHabitat(Habitat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Habitats.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Habitat> GetAllNomService()
        {
            return _context.Habitats.ToList();
        }

        public Habitat GetHabitatById(int id)
        {
            return _context.Habitats.FirstOrDefault(obj => obj.Id == id);
        }

        public void UpdateHabitat(Habitat obj)
        {
            _context.SaveChanges();
        }


    }
}
