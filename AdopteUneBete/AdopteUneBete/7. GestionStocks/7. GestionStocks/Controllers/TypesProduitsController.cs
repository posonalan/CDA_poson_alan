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
    public class TypesProduitsController : Controller
    {

        private readonly TypesProduitsServices _service;
        private readonly IMapper _mapper;

        public TypesProduitsController(GestionStocksContext context)
        {
            _service = new TypesProduitsServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<TypesProduitsProfile>();
                cfg.AddProfile<CategoriesProfile>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/TypesProduits
        [HttpGet]
        public IEnumerable<TypesProduitsDTOOut> GetAllTypesProduits()
        {
            IEnumerable<TypesProduits> listeTypesProduits = _service.GetAllTypesProduits();
            return _mapper.Map<IEnumerable<TypesProduitsDTOOut>>(listeTypesProduits);
        }

        //GET api/TypesProduits/{i}
        [HttpGet("{id}", Name = "GetTypesProduitsById")]
        public ActionResult<TypesProduitsDTOIn> GetTypesProduitsById(int id)
        {
            TypesProduits commandItem = _service.GetTypesProduitById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<TypesProduitsDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/TypesProduits
        [HttpPost]
        public ActionResult<TypesProduitsDTOIn> CreateTypesProduits(TypesProduitsDTOIn objIn)
        {
            TypesProduits obj = _mapper.Map<TypesProduits>(objIn);
            _service.AddTypesProduit(obj);
            return CreatedAtRoute(nameof(GetTypesProduitsById), new { Id = obj.IdTypeProduit }, obj);
        }

        //POST api/TypesProduits/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateTypesProduits(int id, TypesProduitsDTOIn obj)
        {
            TypesProduits objFromRepo = _service.GetTypesProduitById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateTypesProduit(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/TypesProduits/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialTypesProduitsUpdate(int id, JsonPatchDocument<TypesProduits> patchDoc)
        {
            TypesProduits objFromRepo = _service.GetTypesProduitById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            TypesProduits objToPatch = _mapper.Map<TypesProduits>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateTypesProduit(objFromRepo);
            return NoContent();
        }

        //DELETE api/TypesProduits/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteTypesProduits(int id)
        {
            TypesProduits obj = _service.GetTypesProduitById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteTypesProduit(obj);
            return NoContent();
        }


    }
}
