using ApiMultiBillet.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Data.Servives
{
    public class StagiairesServices
    {
        private readonly MyDbContext _context;

        public StagiairesServices(MyDbContext context)
        {
            _context = context;
        }

        public void AddStagiaire(Stagiaire obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Stagiaires.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteStagiaire(Stagiaire obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            _context.Stagiaires.Remove(obj);
            _context.SaveChanges();
        }

        public IEnumerable<Stagiaire> GetAllStagiaires()
        {
            return _context.Stagiaires.Include("ListeBillet").ToList();
        }

        public IEnumerable<Stagiaire> GetAllStagiairesByIdBillet(int id)
        {
            return _context.Stagiaires.Include("ListeBillet").ToList().Where(obj => obj.IdBillet == id);
        }

        public Stagiaire GetStagiaireById(int id)
        {
            return _context.Stagiaires.FirstOrDefault(obj => obj.IdStagiaire == id);
        }

        public void UpdateStagiaire(Stagiaire obj)
        {
            _context.SaveChanges();
        }


    }
}
