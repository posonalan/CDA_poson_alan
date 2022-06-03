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

namespace AdopteUneBete.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class EspecesController:Controller
    {

        private readonly EspecesServices _service;
        private readonly IMapper _mapper;

        public EspecesController(MyDbContext context)
        {
            _service = new EspecesServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<EspecesProfiles>();
                cfg.AddProfile<RacesProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Especes
        [HttpGet]
        public IEnumerable<EspecesDTOOut> GetAllEspeces()
        {
            IEnumerable<espece> listeEspeces = _service.GetAllEspeces();
            return _mapper.Map<IEnumerable<EspecesDTOOut>>(listeEspeces);
        }

        //GET api/Especes/{i}
        [HttpGet("{id}", Name = "GetEspeceById")]
        public ActionResult<EspecesDTOOut> GetEspeceById(int id)
        {
            espece commandItem = _service.GetEspeceById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<EspecesDTOOut>(commandItem));
            }
            return NotFound();
        }

        //POST api/Especes
        [HttpPost]
        public ActionResult<EspecesDTOIn> CreatEespece(EspecesDTOIn objIn)
        {
            espece obj = _mapper.Map<espece>(objIn);
            _service.AddEspece(obj);
            return CreatedAtRoute(nameof(GetEspeceById), new { Id = obj.Id_Espece }, obj);
        }

        //POST api/Especes/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateEspece(int id, EspecesDTOIn obj)
        {
            espece objFromRepo = _service.GetEspeceById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateEspece(objFromRepo);
            return NoContent();
        }

        //DELETE api/Especes/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteEspece(int id)
        {
            espece obj = _service.GetEspeceById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteEspece(obj);
            return NoContent();
        }


    }
}
