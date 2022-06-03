using AdopteUneBeteVisuel.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Services
{
    public class AlimentationsServices
    {
        private readonly MyDbContext _context;

        public AlimentationsServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddAlimentation(alimentation obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Alimentations.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAlimentation(alimentation obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Alimentations.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<alimentation> GetAllAlimentations()
        {
            return _context.Alimentations.Include("ListNutritions.Race").ToList();
        }

        public alimentation GetAlimentationById(int id)
        {
            return _context.Alimentations.Include("ListNutritions.Race").FirstOrDefault(obj => obj.Id_alimentation == id);
        }

        public void UpdateAlimentation(alimentation obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }
    }
}
