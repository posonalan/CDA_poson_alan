using _7._GestionStocks.Data;
using _7._GestionStocks.Data.Dtos;
using _7._GestionStocks.Data.Models;
using _7._GestionStocks.Data.Profiles;
using _7._GestionStocks.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : Controller
    {

        private readonly CategoriesServices _service;
        private readonly IMapper _mapper;

        public CategoriesController(GestionStocksContext context)
        { 
            _service = new CategoriesServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<CategoriesProfile>();
                cfg.AddProfile<ArticlesProfile>();
                cfg.AddProfile<TypesProduitsProfile>();
            });
            _mapper = config.CreateMapper();
        }


        //GET api/Categories
        [HttpGet]
        public IEnumerable<CategoriesDTOOut> GetAllCategories()
        {
            IEnumerable<Categories> listeCategories = _service.GetAllCategories();
            return _mapper.Map<IEnumerable<CategoriesDTOOut>>(listeCategories);
        }

        //GET api/Categories/{i}
        [HttpGet("{id}", Name = "GetCategoriesById")]
        public ActionResult<CategoriesDTOIn> GetCategoriesById(int id)
        {
            Categories commandItem = _service.GetCategoriesById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<CategoriesDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Categories
        [HttpPost]
        public ActionResult<CategoriesDTOIn> CreateCategories(CategoriesDTOIn objIn)
        {
            Categories obj = _mapper.Map<Categories>(objIn);
            _service.AddCategories(obj);
            return CreatedAtRoute(nameof(GetCategoriesById), new { Id = obj.IdCategorie }, obj);
        }

        //POST api/Categories/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateCategories(int id, CategoriesDTOIn obj)
        {
            Categories objFromRepo = _service.GetCategoriesById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateCategories(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Categories/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialCategoriesUpdate(int id, JsonPatchDocument<Categories> patchDoc)
        {
            Categories objFromRepo = _service.GetCategoriesById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Categories objToPatch = _mapper.Map<Categories>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateCategories(objFromRepo);
            return NoContent();
        }

        //DELETE api/Categories/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteCategories(int id)
        {
            Categories obj = _service.GetCategoriesById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteCategories(obj);
            return NoContent();
        }


    }
}
