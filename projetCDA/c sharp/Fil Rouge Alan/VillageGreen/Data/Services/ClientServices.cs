using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Services
{
    class ClientServices
    {

        private readonly VGContext _context;

        public ClientServices(VGContext context)
        {
            _context = context;
        }

        public void AddClient(Client obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Clients.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteClient(Client obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Clients.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Client> GetAllCLient()
        {
            return _context.Clients.ToList();
        }

        public Client GetClientById(int id)
        {
            return _context.Clients.FirstOrDefault(obj => obj.IdClient == id);
        }

        public void UpdateClient(Client obj)
        {
            _context.SaveChanges();
        }


    }
}
