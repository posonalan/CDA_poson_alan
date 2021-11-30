using AnimauxMany.Data.Models;
using AnimauxTest.Data.Dtos;
using AnimauxTest.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Controllers
{
    public class AlimentationController : ControllerBase
    {

        [Route("api/[controller]")]
        [ApiController]

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
            IEnumerable<Alimentation> listeNomController = _service.GetAllAlimentation();
            return Ok(_mapper.Map<IEnumerable<AlimentationDTOIn>>(listeNomController));
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
            _service.AddAlimentation(obj);
            return CreatedAtRoute(nameof(GetAlimentById), new { Id = obj.IdAliment }, obj);
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
            _service.UpdateAlimentation(objFromRepo);
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
            _service.UpdateAlimentation(objFromRepo);
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
            _service.DeleteAlimentation(obj);
            return NoContent();
        }


    }
}
