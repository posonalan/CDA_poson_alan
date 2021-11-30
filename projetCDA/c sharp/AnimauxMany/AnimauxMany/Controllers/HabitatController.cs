using AnimauxMany.Data.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Controllers
{
    public class HabitatController : ControllerBase
    {

        [Route("api/[controllers]")]
        [ApiController]

        private readonly HabitatService _service;
        private readonly IMapper _mapper;

        public HabitatController(HabitatService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/NomController
        [HttpGet]
        public ActionResult<IEnumerable<HabitatDTOIn>> GetAllNomController()
        {
            IEnumerable<Habitat> listeNomController = _service.GetAllNomController();
            return Ok(_mapper.Map<IEnumerable<HabitatDTOIn>>(listeNomController));
        }

        //GET api/NomController/{i}
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

        //POST api/NomController
        [HttpPost]
        public ActionResult<HabitatDTOIn> CreateHabitat(Habitat obj)
        {
            _service.AddHabitat(obj);
            return CreatedAtRoute(nameof(GetHabitatById), new { Id = obj.Id }, obj);
        }

        //POST api/NomController/{id}
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
        //PATCH api/NomController/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialHabitatUpdate(int id, JsonPatchDocument<Habitat> patchDoc)
        {
            //Habitat objFromRepo = _service.GetHabitatById(id);
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

        //DELETE api/NomController/{id}
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
