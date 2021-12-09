using AnimauxTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Services
{
    public class HabitatService
    {
    }

    private readonly animauxtestContext _context;

    public HabitatService(animauxtestContext context)
    {
        _context = context;
    }

    public void AddHabitat(Habitatabitat obj)
    {
        if (obj == null)
        {
            throw new ArgumentNullException(nameof(obj));
        }
        _context.Habitat.Add(obj);
        _context.SaveChanges();
    }

    public void DeleteHabitat(Habitat obj)
    {
        if (obj == null)
        {
            throw new ArgumentNullException(nameof(obj));
        }
        _context.Habitat.Remove(obj);
        _context.SaveChanges();
    }

    public IEnumerable<Habitat> GetAllNomService()
    {
        return _context.Habitat.ToList();
    }

    public Habitat GetHabitatById(int id)
    {
        return _context.Habitat.FirstOrDefault(obj => obj.Id == id);
    }

    public void UpdateHabitat(Habitat obj)
    {
        _context.SaveChanges();
    }


}
