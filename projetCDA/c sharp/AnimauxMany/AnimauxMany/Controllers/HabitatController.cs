using AnimauxMany.Data.Models;
using AnimauxMany.Data.Dtos;
using AnimauxMany.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class HabitatController : ControllerBase
    {

        
        private readonly HabitatService _service;
        private readonly IMapper _mapper;

        public HabitatController(HabitatService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Habitat
        [HttpGet]
        public ActionResult<IEnumerable<HabitatDTOIn>> GetAllHabitat()
        {
            IEnumerable<Habitat> listeHabitat = _service.GetAllHabitat();
            return Ok(_mapper.Map<IEnumerable<HabitatDTOIn>>(listeHabitat));
        }

        //GET api/Habitat/{i}
        [HttpGet("{id}", Name = "GetHabitatById")]
        public ActionResult<HabitatDTOIn> GetHabitatById(int id)
        {
            Habitat commandItem = _service.GetHabitatById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<HabitatDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Habitat
        [HttpPost]
        public ActionResult<HabitatDTOIn> CreateHabitat(Habitat obj)
        {
            _service.AddHabitat(obj);
            return CreatedAtRoute(nameof(GetHabitatById), new { Id = obj.IdHabitat }, obj);
        }

        //POST api/Habitat/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateHabitat(int id, HabitatDTOIn obj)
        {
            Habitat objFromRepo = _service.GetHabitatById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateHabitat(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Habitat/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialHabitatUpdate(int id, JsonPatchDocument<Habitat> patchDoc)
        {
            Habitat objFromRepo = _service.GetHabitatById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Habitat objToPatch = _mapper.Map<Habitat>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateHabitat(objFromRepo);
            return NoContent();
        }

        //DELETE api/Habitat/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteHabitat(int id)
        {
            Habitat obj = _service.GetHabitatById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteHabitat(obj);
            return NoContent();
        }


    }
}
