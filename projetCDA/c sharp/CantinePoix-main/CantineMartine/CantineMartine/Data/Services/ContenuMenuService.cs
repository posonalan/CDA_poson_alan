using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Services
{
   public class ContenuMenuService
    {

        private readonly MyDbContext _context;

        public ContenuMenuService(MyDbContext context)
        {
            _context = context;
        }

        public void AddContenuMenu(Contenumenu obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Contenumenus.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteContenuMenu(Contenumenu obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Contenumenus.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Contenumenu> GetAllContenuMenu()
        {
            return _context.Contenumenus.ToList();
        }

        public Contenumenu GetContenuMenuById(int id)
        {
            return _context.Contenumenus.FirstOrDefault(obj => obj.IdContenuMenu == id);
        }

        public void UpdateContenuMenu(Contenumenu obj)
        {
            _context.SaveChanges();
        }


    }
}
