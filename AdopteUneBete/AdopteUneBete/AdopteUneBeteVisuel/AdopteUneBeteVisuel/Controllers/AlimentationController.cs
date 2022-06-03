using AdopteUneBeteVisuel.Data;
using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AdopteUneBeteVisuel.Data.Profiles;
using AdopteUneBeteVisuel.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class AlimentationsController:Controller
    {

        private readonly AlimentationsServices _service;
        private readonly IMapper _mapper;

        public AlimentationsController(MyDbContext context)
        {
            _service = new AlimentationsServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<AlimentationsProfiles>();
                cfg.AddProfile<NutritionsProfiles>();
                cfg.AddProfile<RacesProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Alimentations
        [HttpGet]
        public IEnumerable<AlimentationsDTOOut> GetAllAlimentations()
        {
            IEnumerable<alimentation> listeAlimentations = _service.GetAllAlimentations();
            return _mapper.Map<IEnumerable<AlimentationsDTOOut>>(listeAlimentations);
        }

        //GET api/Alimentations/{i}
        [HttpGet("{id}", Name = "GetalimentationById")]
        public ActionResult<AlimentationsDTOOut> GetAlimentationById(int id)
        {
            alimentation commandItem = _service.GetAlimentationById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<AlimentationsDTOOut>(commandItem));
            }
            return NotFound();
        }

        //POST api/Alimentations
        [HttpPost]
        public ActionResult<AlimentationsDTOIn> CreateAlimentation(AlimentationsDTOIn objIn)
        {
            alimentation obj = _mapper.Map<alimentation>(objIn);
            _service.AddAlimentation(obj);
            return CreatedAtRoute(nameof(GetAlimentationById), new { Id = obj.Id_alimentation }, obj);
        }

        //POST api/Alimentations/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateAlimentation(int id, AlimentationsDTOIn obj)
        {
            alimentation objFromRepo = _service.GetAlimentationById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateAlimentation(objFromRepo);
            return NoContent();
        }

        //DELETE api/Alimentations/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteAlimentation(int id)
        {
            alimentation obj = _service.GetAlimentationById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteAlimentation(obj);
            return NoContent();
        }


    }
}
