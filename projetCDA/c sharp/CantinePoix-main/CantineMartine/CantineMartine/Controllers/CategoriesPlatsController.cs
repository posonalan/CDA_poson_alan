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
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesPlatsController
    {

        private readonly CategoriesPlatsServices _service;
        private readonly IMapper _mapper;

        public CategoriesPlatsController(MyDbContext context)
        {
            _service = new CategoriesPlatsServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<CategoriePlatProfile>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/CategoriesPlats
        [HttpGet]
        public IEnumerable<CategoriesPlatsDTOIn> GetAllCategoriesPlats()
        {
            IEnumerable<Categoriesplat> listeCategoriesPlats = _service.GetAllCategoriesPlats();
            return _mapper.Map<IEnumerable<CategoriesPlatsDTOIn>>(listeCategoriesPlats);
        }

        //GET api/CategoriesPlats/{i}
        [HttpGet("{id}", Name = "GetCategoriesplatById")]
        public CategoriesPlatsDTOIn GetCategoriesplatById(int id)
        {
            Categoriesplat commandItem = _service.GetCategoriePlatById(id);
            if (commandItem != null)
            {
                return _mapper.Map<CategoriesPlatsDTOIn>(commandItem);
            }
            return null;
        }

        //POST api/CategoriesPlats
        [HttpPost]
        public void CreateCategoriesplat(CategoriesPlatsDTOIn objIn)
        {
            Categoriesplat obj = _mapper.Map<Categoriesplat>(objIn);
            _service.AddCategoriePlat(obj);
        }

        //POST api/CategoriesPlats/{id}
        [HttpPut("{id}")]
        public void UpdateCategoriesplat(int id, CategoriesPlatsDTOIn obj)
        {
            Categoriesplat objFromRepo = _service.GetCategoriePlatById(id);
            if (objFromRepo == null)
            {
                return;
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateCategoriePlat(objFromRepo);
            return;
        }

        //DELETE api/CategoriesPlats/{id}
        [HttpDelete("{id}")]
        public void DeleteCategoriesplat(int id)
        {
            Categoriesplat obj = _service.GetCategoriePlatById(id);
            if (obj == null)
            {
                return;
            }
            _service.DeleteCategoriePlat(obj);
            return;
        }


    }
}
