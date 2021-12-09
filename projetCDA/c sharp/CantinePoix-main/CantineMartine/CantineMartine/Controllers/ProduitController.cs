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
    class ProduitController:ControllerBase
    {
        private readonly ProduitService _service;
        private readonly IMapper _mapper;

        public ProduitController(MyDbContext _context)
        {
            _service = new ProduitService(_context);
            var config = new MapperConfiguration(cfg =>
            {
                // comme l'article contient des catégorie, on déclare 2 mappers article et catégorie
                cfg.AddProfile<ProduitProfile>();
                //cfg.AddProfile<CategoriesProfiles>();
            });
            _mapper = config.CreateMapper();
        }
        
        public IEnumerable<ProduitDTOAvecLibelleCategorieProduit> GetAllProduit()
        {
            IEnumerable<Produit> listeProduit = _service.GetAllProduits();
            return _mapper.Map<IEnumerable<ProduitDTOAvecLibelleCategorieProduit>>(listeProduit);
           
        }
       
        public Produit GetProduitById(int id)
        {
            Produit commandItem = _service.GetProduitById(id);
            if (commandItem != null)
            {
                return _mapper.Map<Produit>(commandItem);
            }
            return null;
        }

        public ProduitDTOAvecLibelleCategorieProduit GetProduitByIdAvecLibelleCategorieProduit(int id)
        {
            Produit commandItem = _service.GetProduitById(id);
            if (commandItem != null)
            {
                return _mapper.Map<ProduitDTOAvecLibelleCategorieProduit>(commandItem);
            }
            return null;
        }

        public void CreateProduit(ProduitDTOIn objin)
        {
            Produit obj = _mapper.Map<Produit>(objin);
            _service.AddProduit(obj);
        }

       
        public void UpdateProduit(int id, ProduitDTOIn obj)
        {
            Produit objFromRepo = _service.GetProduitById(id);
            _mapper.Map(obj, objFromRepo);
            _service.UpdateProduit(objFromRepo);
        }

        
        public void DeleteProduit(int id)
        {
            Produit obj = _service.GetProduitById(id);
            _service.DeleteProduit(obj);
        }
    }
}
