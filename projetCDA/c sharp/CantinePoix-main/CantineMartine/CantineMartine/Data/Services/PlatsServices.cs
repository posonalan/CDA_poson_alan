using CantineMartine.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Services
{
    class PlatsServices
    {

        private readonly MyDbContext _context;

        public PlatsServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddPlat(Plat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Plats.Add(obj);
            _context.SaveChanges();
        }

        public void DeletePlat(Plat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Plats.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Plat> GetAllPlats()
        {
            return _context.Plats.Include("CategoriePlat").ToList();
        }

        public Plat GetPlatById(int id)
        {
            return _context.Plats.Include("CategoriePlat").FirstOrDefault(obj => obj.IdPlat == id);
        }

        public void UpdatePlat(Plat obj)
        {
            _context.SaveChanges();
        }


    }
}
