using AdopteUneBeteVisuel.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Services
{
    public class EspecesServices
    {
        private readonly MyDbContext _context;

        public EspecesServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddEspece(espece obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Especes.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteEspece(espece obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Especes.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<espece> GetAllEspeces()
        {
            return _context.Especes.Include("ListRaces").ToList();
        }

        public espece GetEspeceById(int id)
        {
            return _context.Especes.Include("ListRaces").FirstOrDefault(obj => obj.Id_Espece == id);
        }

        public void UpdateEspece(espece obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }
    }
}
