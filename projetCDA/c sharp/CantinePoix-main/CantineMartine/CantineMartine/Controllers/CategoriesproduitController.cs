using AutoMapper;
using CantineMartine.Data;
using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
using CantineMartine.Data.Profiles;
using CantineMartine.Data.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Controllers
{
    class CategoriesproduitController:ControllerBase
    {

        private readonly CategoriesproduitService _service;
        private readonly IMapper _mapper;

        public CategoriesproduitController(MyDbContext _context)
        {
            _service = new CategoriesproduitService(_context);
            var config = new MapperConfiguration(cfg =>
              {
                  cfg.AddProfile<CategorieProduitProfile>();
              });
            _mapper = config.CreateMapper();
        }

        public IEnumerable<CategoriesproduitDTOIn> GetAllGategoriesProduit()
        {
            IEnumerable<Categoriesproduit> listeCategoriesProduit = _service.GetAllCategoriesProduit();
            return _mapper.Map<IEnumerable<CategoriesproduitDTOIn>>(listeCategoriesProduit);
        }

      
        public Categoriesproduit GetNomModelById(int id)
        {
            Categoriesproduit commandItem = _service.GetCategorieProduitById(id);
            if (commandItem != null)
            {
                return _mapper.Map<Categoriesproduit>(commandItem);
            }
            return null;
        }

        public void CreateCategorieProduit(CategoriesproduitDTOIn objin)
        {
            Categoriesproduit obj = _mapper.Map<Categoriesproduit>(objin);
            _service.AddCategorieProduit(obj);
        }

        public void  UpdateCategorieProduit(int id, CategoriesproduitDTOIn obj)
        {
            Categoriesproduit objFromRepo = _service.GetCategorieProduitById(id);
            _mapper.Map(obj, objFromRepo);
            _service.UpdateCategorieProduit(objFromRepo);
        }

        public void DeleteCategorieProduit(int id)
        {
            Categoriesproduit obj = _service.GetCategorieProduitById(id);
            _service.DeleteCategorieProduit(obj);
        }


    }
}
