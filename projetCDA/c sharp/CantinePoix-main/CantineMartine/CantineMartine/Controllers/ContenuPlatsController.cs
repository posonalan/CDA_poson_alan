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
    public class ContenuPlatsController:ControllerBase
    {

        private readonly ContenuPlatsServices _service;
        private readonly IMapper _mapper;

        public ContenuPlatsController(MyDbContext _context)
        {
            _service = new ContenuPlatsServices(_context);
            var config = new MapperConfiguration(cfg =>
            {
                // comme l'article contient des catégorie, on déclare 2 mappers article et catégorie
                cfg.AddProfile<ContenuPlatProfile>();
                //cfg.AddProfile<CategoriesProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/ContenuPlats
        [HttpGet]
        public IEnumerable<ContenuplatsDTOIn> GetAllContenuPlats()
        {
            IEnumerable<Contenuplat> listeContenuPlats = _service.GetAllContenuPlats();
            return _mapper.Map<IEnumerable<ContenuplatsDTOIn>>(listeContenuPlats);
        }

        //GET api/ContenuPlats/{i}
        [HttpGet("{id}", Name = "GetContenuPlatById")]
        public ContenuplatsDTOIn GetContenuPlatById(int id)
        {
            Contenuplat commandItem = _service.GetContenuPlatById(id);
            if (commandItem != null)
            {
                return _mapper.Map<ContenuplatsDTOIn>(commandItem);
            }
            return null;
        }

        public IEnumerable<ContenuplatsDTOIn> GetAllContenuPlatsByIdPlat(int id)
        {
            IEnumerable<Contenuplat> listeContenuPlats = _service.GetAllContenuPlatsByIdPlat(id);
            return _mapper.Map<IEnumerable<ContenuplatsDTOIn>>(listeContenuPlats);
        }

        public Contenuplat GetContenuPlatByIdProduitAndIdPlat(int idPlat, int idProduit)
        {
            Contenuplat commandItem = _service.GetContenuPlatByIdProduitAndIdPlat(idPlat, idProduit);
            return commandItem;
        }

        //POST api/ContenuPlats
        [HttpPost]
        public void CreateContenuPlat(ContenuplatsDTOIn objIn)
        {
            Contenuplat obj = _mapper.Map<Contenuplat>(objIn);
            _service.AddContenuPlat(obj);
            return;
        }

        //POST api/ContenuPlats/{id}
        [HttpPut("{id}")]
        public void UpdateContenuPlat(int id, ContenuplatsDTOIn obj)
        {
            Contenuplat objFromRepo = _service.GetContenuPlatById(id);
            if (objFromRepo == null)
            {
                return;
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateContenuPlat(objFromRepo);
            return;
        }

        //DELETE api/ContenuPlats/{id}
        [HttpDelete("{id}")]
        public void DeleteContenuPlat(int id)
        {
            Contenuplat obj = _service.GetContenuPlatById(id);
            if (obj == null)
            {
                return;
            }
            _service.DeleteContenuPlat(obj);
            return;
        }


    }
}
