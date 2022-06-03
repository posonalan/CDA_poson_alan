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
    public class AnimauxController:Controller
    {

        private readonly AnimauxServices _service;
        private readonly IMapper _mapper;

        public AnimauxController(MyDbContext context)
        {
            _service = new AnimauxServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<AnimauxProfiles>();
                cfg.AddProfile<UsersProfiles>();
                cfg.AddProfile<RacesProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Animaux
        [HttpGet]
        public IEnumerable<AnimauxDTOOut> GetAllAnimaux()
        {
            IEnumerable<animaux> listeAnimaux = _service.GetAllAnimaux();
            return _mapper.Map<IEnumerable<AnimauxDTOOut>>(listeAnimaux);
        }

        //GET api/Animaux/{i}
        [HttpGet("{id}", Name = "GetAnimauxById")]
        public ActionResult<AnimauxDTOOut> GetAnimauxById(int id)
        {
            animaux commandItem = _service.GetAnimauxById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<AnimauxDTOOut>(commandItem));
            }
            return NotFound();
        }

        //POST api/Animaux
        [HttpPost]
        public ActionResult<AnimauxDTOIn> CreateAnimaux(AnimauxDTOIn objIn)
        {
            animaux obj = _mapper.Map<animaux>(objIn);
            _service.AddAnimaux(obj);
            return CreatedAtRoute(nameof(GetAnimauxById), new { Id = obj.Id_Animal }, obj);
        }

        //POST api/Animaux/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateAnimaux(int id, AnimauxDTOIn obj)
        {
            animaux objFromRepo = _service.GetAnimauxById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateAnimaux(objFromRepo);
            return NoContent();
        }

        //DELETE api/Animaux/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteAnimaux(int id)
        {
            animaux obj = _service.GetAnimauxById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteAnimaux(obj);
            return NoContent();
        }


    }
}
