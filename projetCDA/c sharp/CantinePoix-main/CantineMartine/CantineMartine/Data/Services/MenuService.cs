using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Text;
using System.Threading.Tasks;


namespace CantineMartine.Data.Services
{
    class MenuService
    {

        private readonly MyDbContext _context;

        public MenuService(MyDbContext context)
        {
            _context = context;
        }

        public void AddMenu(Menu obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Menus.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteMenu(Menu obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Menus.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Menu> GetAllMenu()
        {
            return _context.Menus.ToList();
        }

        public IEnumerable<Menu> GetAllSemaine()
        {
            return _context.Menus.ToList();
        }

        public Menu GetMenuById(int id)
        {
            return _context.Menus.FirstOrDefault(obj => obj.IdMenu == id);
        }

        public void UpdateMenu(Menu obj)
        {
            _context.SaveChanges();
        }


    }
}
