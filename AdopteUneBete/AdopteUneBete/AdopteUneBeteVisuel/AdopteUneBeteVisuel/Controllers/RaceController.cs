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
    public class RacesController:Controller
    {

        private readonly RacesServices _service;
        private readonly IMapper _mapper;

        public RacesController(MyDbContext context)
        {
            _service = new RacesServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<RacesProfiles>();
                cfg.AddProfile<AnimauxProfiles>();
                cfg.AddProfile<NutritionsProfiles>();
                cfg.AddProfile<EspecesProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Races
        [HttpGet]
        public IEnumerable<RacesDTOOut> GetAllRaces()
        {
            IEnumerable<race> listeRaces = _service.GetAllRaces();
            return _mapper.Map<IEnumerable<RacesDTOOut>>(listeRaces);
        }

        //GET api/Races/{i}
        [HttpGet("{id}", Name = "GetRaceById")]
        public ActionResult<RacesDTOOut> GetRaceById(int id)
        {
            race commandItem = _service.GetRaceById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<RacesDTOOut>(commandItem));
            }
            return NotFound();
        }

        //POST api/Races
        [HttpPost]
        public ActionResult<RacesDTOIn> CreateRace(RacesDTOIn objIn)
        {
            race obj = _mapper.Map<race>(objIn);
            _service.AddRace(obj);
            return CreatedAtRoute(nameof(GetRaceById), new { Id = obj.Id_Race }, obj);
        }

        //POST api/Races/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateRace(int id, RacesDTOIn obj)
        {
            race objFromRepo = _service.GetRaceById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateRace(objFromRepo);
            return NoContent();
        }

        //DELETE api/Races/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteRace(int id)
        {
            race obj = _service.GetRaceById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteRace(obj);
            return NoContent();
        }


    }
}
