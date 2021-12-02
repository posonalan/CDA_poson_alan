using AutoMapper;
using GestionStockAppli.Data.Dtos;
using GestionStockAppli.Data.Models;
using GestionStockAppli.Data.Services;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.JsonPatch;
using System.Collections.Generic;

using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;

namespace GestionStockAppli.Data.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    class TypeProduitController : ControllerBase
    {


        private readonly TypeProduitService _service;
        private readonly IMapper _mapper;

        public TypeProduitController(TypeProduitServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/TypesProduits
        [HttpGet]
        public ActionResult<IEnumerable<TypesProduitsDTO>> GetAllTypesProduits()
        {
            IEnumerable<TypesProduits> listeTypesProduits = _service.GetAllTypesProduits();
            return Ok(_mapper.Map<IEnumerable<TypesProduitsDTO>>(listeTypesProduits));
        }

        //GET api/TypesProduits/{i}
        [HttpGet("{id}", Name = "GetTypesProduitsById")]
        public ActionResult<TypesProduitsDTO> GetTypesProduitsById(int id)
        {
            TypesProduit commandItem = _service.GetTypesProduitsById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<TypesProduitsDTO>(commandItem));
            }
            return NotFound();
        }

        //POST api/TypesProduits
        [HttpPost]
        public ActionResult<TypesProduitsDTO> CreateTypesProduits(TypesProduit obj)
        {
            _service.AddTypesProduits(obj);
            return CreatedAtRoute(nameof(GetTypesProduitsById), new { Id = obj.Id }, obj);
        }

        //POST api/TypesProduits/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateTypesProduits(int id, TypesProduitsDTO obj)
        {
            TypesProduit objFromRepo = _service.GetTypesProduitsById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateTypesProduits(objFromRepo);
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
            TypesProduit objFromRepo = _service.GetTypesProduitsById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            TypesProduit objToPatch = _mapper.Map<TypesProduit>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateTypesProduits(objFromRepo);
            return NoContent();
        }

        //DELETE api/TypesProduits/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteTypesProduits(int id)
        {
            TypesProduit obj = _service.GetTypesProduitsById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteTypesProduits(obj);
            return NoContent();
        }


    }
}
