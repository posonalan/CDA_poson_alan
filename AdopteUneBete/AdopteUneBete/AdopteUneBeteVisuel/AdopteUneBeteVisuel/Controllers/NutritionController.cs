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
    public class NutritionsController:Controller
    {

        private readonly NutritionsServices _service;
        private readonly IMapper _mapper;

        public NutritionsController(MyDbContext context)
        {
            _service = new NutritionsServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<NutritionsProfiles>();
                cfg.AddProfile<AlimentationsProfiles>();
                cfg.AddProfile<RacesProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Nutritions
        [HttpGet]
        public IEnumerable<NutritionsDTOOut> GetAllNutritions()
        {
            IEnumerable<nutrition> listeNutritions = _service.GetAllNutritions();
            return _mapper.Map<IEnumerable<NutritionsDTOOut>>(listeNutritions);
        }

        //GET api/Nutritions/{i}
        [HttpGet("{id}", Name = "GetNutritionById")]
        public ActionResult<NutritionsDTOOut> GetNutritionById(int id)
        {
            nutrition commandItem = _service.GetNutritionById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<NutritionsDTOOut>(commandItem));
            }
            return NotFound();
        }

        //POST api/Nutritions
        [HttpPost]
        public ActionResult<NutritionsDTOIn> CreateNutrition(NutritionsDTOIn objIn)
        {
            nutrition obj = _mapper.Map<nutrition>(objIn);
            _service.AddNutrition(obj);
            return CreatedAtRoute(nameof(GetNutritionById), new { Id = obj.Id_nutrition }, obj);
        }

        //POST api/Nutritions/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateNutrition(int id, NutritionsDTOIn obj)
        {
            nutrition objFromRepo = _service.GetNutritionById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateNutrition(objFromRepo);
            return NoContent();
        }

        //DELETE api/Nutritions/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteNutrition(int id)
        {
            nutrition obj = _service.GetNutritionById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteNutrition(obj);
            return NoContent();
        }


    }
}
