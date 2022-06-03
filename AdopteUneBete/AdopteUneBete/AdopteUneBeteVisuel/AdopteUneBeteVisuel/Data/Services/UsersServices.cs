using AdopteUneBeteVisuel.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Services
{
    public class UsersServices
    {
        private readonly MyDbContext _context;

        public UsersServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddUser(user obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Users.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteUser(user obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Users.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<user> GetAllUsers()
        {
            return _context.Users.Include("ListAnimaux").ToList();
        }

        public user GetUserById(int id)
        {
            return _context.Users.FirstOrDefault(obj => obj.Id_user == id);
        }

        public void UpdateUser(user obj)
        {
            _context.Update(obj);
            _context.SaveChanges();
        }
    }
}
