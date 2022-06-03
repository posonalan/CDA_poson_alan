using AdopteUneBeteVisuel.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Services
{
    public class NutritionsServices
    {
        private readonly MyDbContext _context;

        public NutritionsServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddNutrition(nutrition obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Nutritions.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteNutrition(nutrition obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Nutritions.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<nutrition> GetAllNutritions()
        {
            return _context.Nutritions.Include("Alimentation").Include("Race").ToList();
        }

        public nutrition GetNutritionById(int id)
        {
            return _context.Nutritions.Include("Alimentation").Include("Race").FirstOrDefault(obj => obj.Id_nutrition == id);
        }

        public void UpdateNutrition(nutrition obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }
    }
}
