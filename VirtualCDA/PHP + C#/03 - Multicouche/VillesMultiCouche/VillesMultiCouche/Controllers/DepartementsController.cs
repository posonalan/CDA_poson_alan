﻿using AutoMapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VillesMultiCouche.Data.Dtos;
using VillesMultiCouche.Data.Models;
using VillesMultiCouche.Data.Services;

namespace VillesMultiCouche.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class DepartementsController : ControllerBase
    {
        private readonly DepartementsServices _service;
        private readonly IMapper _mapper;

        public DepartementsController(DepartementsServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Departements
        [HttpGet]
        [EnableCors("toto")]
        public ActionResult<IEnumerable<DepartementDTO>> GetAllDepartements()
        {
            IEnumerable<Departement> listeDepartements = _service.GetAllDepartements();
            return Ok(_mapper.Map<IEnumerable<DepartementDTO>>(listeDepartements));
        }

        //GET api/Departements/{i}
        [HttpGet("{id}", Name = "GetDepartementById")]
        [EnableCors("toto")]
        public ActionResult<DepartementDTO> GetDepartementById(int id)
        {
            Departement commandItem = _service.GetDepartementById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<DepartementDTO>(commandItem));
            }
            return NotFound();
        }

        //POST api/Departements
        [HttpPost]
        [EnableCors("toto")]
        public ActionResult<DepartementDTO> CreateDepartement(Departement obj)
        {
            _service.AddDepartement(obj);
            return CreatedAtRoute(nameof(GetDepartementById), new { Id = obj.IdDepartement }, obj);
        }

        //POST api/Departements/{id}
        [HttpPut("{id}")]
        [EnableCors("toto")]
        public ActionResult UpdateDepartement(int id, DepartementDTO obj)
        {
            Departement objFromRepo = _service.GetDepartementById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateDepartement(objFromRepo);
            return NoContent();
        }



        //DELETE api/Departements/{id}
        [HttpDelete("{id}")]
        [EnableCors("toto")]
        public ActionResult DeleteDepartement(int id)
        {
            Departement obj = _service.GetDepartementById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteDepartement(obj);
            return NoContent();
        }


    }
}
