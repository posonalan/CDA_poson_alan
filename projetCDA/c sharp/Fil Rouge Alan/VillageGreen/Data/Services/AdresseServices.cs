using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Services
{
    class AdresseServices
    {
        private readonly VGContext _context;

        public AdresseServices(VGContext context)
        {
            _context = context;
        }

        public void AddAdresse(Adresse obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Adresses.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteAdresse(Adresse obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Adresses.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Adresse> GetAllAdresse()
        {
            return _context.Adresses.ToList();
        }

        public Adresse GetAdresseById(int id)
        {
            return _context.Adresses.FirstOrDefault(obj => obj.IdAdresse == id);
        }

        public void UpdateAdresse(Adresse obj)
        {
            _context.SaveChanges();
        }


    }
    

}
