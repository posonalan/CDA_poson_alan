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
    public class AlimentationController : ControllerBase
    {

      

        private readonly AlimentationService _service;
        private readonly IMapper _mapper;

        public AlimentationController(AlimentationService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/NomController
        [HttpGet]
        public ActionResult<IEnumerable<AlimentationDTOIn>> GetAllAlimentation()
        {
            IEnumerable<Alimentation> listeAlimentation = _service.GetAllAliment();
            return Ok(_mapper.Map<IEnumerable<AlimentationDTOIn>>(listeAlimentation));
        }

        //GET api/NomController/{i}
        [HttpGet("{id}", Name = "GetAlimentById")]
        public ActionResult<AlimentationDTOIn> GetAlimentById(int id)
        {
            Alimentation commandItem = _service.GetAlimentById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<AlimentationDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/NomController
        [HttpPost]
        public ActionResult<AlimentationDTOIn> CreateAlimentation(Alimentation obj)
        {
            _service.AddAliment(obj);
            return CreatedAtRoute(nameof(GetAlimentById), new { Id = obj.IdAlimentations }, obj);
        }

        //POST api/NomController/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateAlimentation(int id, AlimentationDTOIn obj)
        {
            Alimentation objFromRepo = _service.GetAlimentById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateAliment(objFromRepo);
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
        public ActionResult PartialAlimentationUpdate(int id, JsonPatchDocument<Alimentation> patchDoc)
        {
            Alimentation objFromRepo = _service.GetAlimentById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Alimentation objToPatch = _mapper.Map<Alimentation>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateAliment(objFromRepo);
            return NoContent();
        }

        //DELETE api/NomController/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteAlimentation(int id)
        {
            Alimentation obj = _service.GetAlimentById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteAliment(obj);
            return NoContent();
        }


    }
}
