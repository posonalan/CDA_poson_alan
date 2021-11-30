using AnimauxMany.Data.Models;
using AnimauxTest.Data.Models;
using AnimauxTest.Data.Services;
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
    public class GeographieController : ControllerBase
    {

        private readonly GeographieService _service;
        private readonly IMapper _mapper;

        public GeographieController(GeographieService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Geographie
        [HttpGet]
        public ActionResult<IEnumerable<GeographieDTOIn>> GetAllGeographie()
        {
            IEnumerable<Geographie> listeGeographie = _service.GetAllGeographie();
            return Ok(_mapper.Map<IEnumerable<GeographieDTOIn>>(listeGeographie));
        }

        //GET api/Geographie/{i}
        [HttpGet("{id}", Name = "GetGeographieById")]
        public ActionResult<GeographieDTOIn> GetGeographieById(int id)
        {
            Geographie commandItem = _service.GetGeographieById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<GeographieDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Geographie
        [HttpPost]
        public ActionResult<GeographieDTOIn> CreateGeographie(Geographie obj)
        {
            _service.AddGeographie(obj);
            return CreatedAtRoute(nameof(GetGeographieById), new { Id = obj.IdGeographie }, obj);
        }

        //POST api/Geographie/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateGeographie(int id, GeographieDTOIn obj)
        {
            Geographie objFromRepo = _service.GetGeographieById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateGeographie(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Geographie/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialGeographieUpdate(int id, JsonPatchDocument<Geographie> patchDoc)
        {
            Geographie objFromRepo = _service.GetGeographieById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Geographie objToPatch = _mapper.Map<Geographie>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateGeographie(objFromRepo);
            return NoContent();
        }

        //DELETE api/Geographie/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteGeographie(int id)
        {
            Geographie obj = _service.GetGeographieById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteGeographie(obj);
            return NoContent();
        }


    }

}
