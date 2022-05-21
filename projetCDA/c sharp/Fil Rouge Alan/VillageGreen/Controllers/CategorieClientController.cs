using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;
using VillageGreen.Data.Services;

namespace VillageGreen.Controllers
{
    class CategorieClientController
    {
        private readonly CategorieClientServices _service;
        private readonly IMapper _mapper;

        public CategorieClientController(CategorieClientServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/CategorieClient
        [HttpGet]
        public ActionResult<IEnumerable<CategorieClientDTOIn>> GetAllCategorieClient()
        {
            IEnumerable<CategorieClient> listeCategorieClient = _service.GetAllCategorieClient();
            return Ok(_mapper.Map<IEnumerable<CategorieClientDTOIn>>(listeCategorieClient));
        }

        //GET api/CategorieClient/{i}
        [HttpGet("{id}", Name = "GetCategorieClientById")]
        public ActionResult<CategorieClientDTOIn> GetCategorieClientById(int id)
        {
            CategorieClient commandItem = _service.GetCategorieClientById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<CategorieClientDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/CategorieClient
        [HttpPost]
        public ActionResult<CategorieClientDTOIn> CreateCategorieClient(CategorieClientDTOIn objIn)
        {
            CategorieClient obj = _mapper.Map<CategorieClient>(objIn);
            _service.AddCategorieClient(obj);
            return CreatedAtRoute(nameof(GetCategorieClientById), new { Id = obj.IdCategorieClient }, obj);
        }

        //POST api/CategorieClient/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateCategorieClient(int id, CategorieClientDTOIn obj)
        {
            CategorieClient objFromRepo = _service.GetCategorieClientById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateCategorieClient(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/CategorieClient/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialCategorieClientUpdate(int id, JsonPatchDocument<CategorieClient> patchDoc)
        {
            CategorieClient objFromRepo = _service.GetCategorieClientById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            CategorieClient objToPatch = _mapper.Map<CategorieClient>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateCategorieClient(objFromRepo);
            return NoContent();
        }

        //DELETE api/CategorieClient/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteCategorieClient(int id)
        {
            CategorieClient obj = _service.GetCategorieClientById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteCategorieClient(obj);
            return NoContent();
        }


    }
}
