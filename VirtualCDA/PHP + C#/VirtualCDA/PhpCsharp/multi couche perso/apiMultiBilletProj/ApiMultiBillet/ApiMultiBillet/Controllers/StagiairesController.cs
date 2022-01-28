using ApiMultiBillet.Data.Dtos;
using ApiMultiBillet.Data.Models;
using ApiMultiBillet.Data.Servives;
using AutoMapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class StagiairesController : ControllerBase
    {
        private readonly StagiairesServices _service;
        private readonly IMapper _mapper;

        public StagiairesController(StagiairesServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Stagiaires

        [HttpGet]
        public ActionResult<IEnumerable<StagiaireDTO>> GetAllStagiaires()
        {
            IEnumerable<Stagiaire> listeStagiaires = _service.GetAllStagiaires();
            return Ok(_mapper.Map<IEnumerable<StagiaireDTO>>(listeStagiaires));
        }

        //GET api/Stagiaires/{i}

        [HttpGet("{id}", Name = "GetStagiaireById")]
        public ActionResult<StagiaireDTO> GetStagiaireById(int id)
        {
            Stagiaire commandItem = _service.GetStagiaireById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<StagiaireDTO>(commandItem));
            }
            return NotFound();
        }

        //POST api/Stagiaires

        [HttpPost]
        public ActionResult<StagiaireDTO> CreateStagiaire(StagiaireDTO obj)
        {


            _service.AddStagiaire(_mapper.Map<Stagiaire>(obj));
            return CreatedAtRoute(nameof(GetStagiaireById), new { Id = obj.IdStagiaire }, obj);
        }


        //POST api/Stagiaires/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateStagiaire(int id, StagiaireDTO obj)
        {
            Stagiaire objFromRepo = _service.GetStagiaireById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateStagiaire(objFromRepo);
            return NoContent();
        }



        //DELETE api/Stagiaires/{id}

        [HttpDelete("{id}")]
        public ActionResult DeleteStagiaire(int id)
        {
            Stagiaire obj = _service.GetStagiaireById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteStagiaire(obj);
            return NoContent();
        }


    }
}
