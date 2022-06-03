using AdopteUneBeteVisuel.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Services
{
    public class RacesServices
    {
        private readonly MyDbContext _context;

        public RacesServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddRace(race obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Races.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteRace(race obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Races.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<race> GetAllRaces()
        {
            return _context.Races.Include("Espece").Include("ListAnimaux").Include("ListNutritions.Alimentation").ToList();
        }

        public race GetRaceById(int id)
        {
            return _context.Races.Include("Espece").Include("ListAnimaux").Include("ListNutritions.Alimentation").FirstOrDefault(obj => obj.Id_Race == id);
        }

        public void UpdateRace(race obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }
    }
}
