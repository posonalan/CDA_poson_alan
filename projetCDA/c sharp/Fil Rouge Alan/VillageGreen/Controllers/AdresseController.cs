using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Services;

namespace VillageGreen.Controllers
{
    class AdresseController
    {
        private readonly AdresseServices _service;
        private readonly IMapper _mapper;

        public AdresseController(AdresseServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Adresse
        [HttpGet]
        public ActionResult<IEnumerable<AdresseDTOIn>> GetAllAdresse()
        {
            IEnumerable<Adresse> listeAdresse = _service.GetAllAdresse();
            return Ok(_mapper.Map<IEnumerable<AdresseDTOIn>>(listeAdresse));
        }

        //GET api/Adresse/{i}
        [HttpGet("{id}", Name = "GetAdresseById")]
        public ActionResult<AdresseDTOIn> GetAdresseById(int id)
        {
            Adresse commandItem = _service.GetAdresseById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<AdresseDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Adresse
        [HttpPost]
        public ActionResult<AdresseDTOIn> CreateAdresse(AdresseDTOIn objIn)
        {
            Adresse obj = _mapper.Map<Adresse>(objIn);
            _service.AddAdresse(obj);
            return CreatedAtRoute(nameof(GetAdresseById), new { Id = obj.IdAdresse }, obj);
        }

        //POST api/Adresse/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateAdresse(int id, AdresseDTOIn obj)
        {
            Adresse objFromRepo = _service.GetAdresseById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateAdresse(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Adresse/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialAdresseUpdate(int id, JsonPatchDocument<Adresse> patchDoc)
        {
            Adresse objFromRepo = _service.GetAdresseById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Adresse objToPatch = _mapper.Map<Adresse>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateAdresse(objFromRepo);
            return NoContent();
        }

        //DELETE api/Adresse/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteAdresse(int id)
        {
            Adresse obj = _service.GetAdresseById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteAdresse(obj);
            return NoContent();
        }


    }
}
