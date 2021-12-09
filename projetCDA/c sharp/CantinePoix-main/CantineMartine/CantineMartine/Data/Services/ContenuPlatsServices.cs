using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Services
{
    public class ContenuPlatsServices
    {

        private readonly MyDbContext _context;

        public ContenuPlatsServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddContenuPlat(Contenuplat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Contenuplats.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteContenuPlat(Contenuplat obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Contenuplats.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Contenuplat> GetAllContenuPlats()
        {
            return _context.Contenuplats.ToList();
        }

        public Contenuplat GetContenuPlatById(int id)
        {
            return _context.Contenuplats.FirstOrDefault(obj => obj.IdContenuPlat == id);
        }

        public IEnumerable<Contenuplat> GetAllContenuPlatsByIdPlat(int id)
        {
            return _context.Contenuplats.Where(obj => obj.IdPlat == id).ToList();
        }

        public Contenuplat GetContenuPlatByIdProduitAndIdPlat(int idPlat, int idProduit)
        {
            return _context.Contenuplats.Where(obj => obj.IdPlat == idPlat).Where(obj => obj.IdProduit == idProduit).FirstOrDefault();
        }

        public void UpdateContenuPlat(Contenuplat obj)
        {
            _context.SaveChanges();
        }


    }
}
