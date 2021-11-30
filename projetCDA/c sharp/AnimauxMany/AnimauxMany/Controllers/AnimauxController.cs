﻿using AnimauxTest.Data.Dtos;
using AnimauxTest.Data.Models;
using AnimauxTest.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Animauxmany.Controllers
{
    public class AnimauxController : ControllerBase
    {
        [Route("api/[controller]")]
        [ApiController]


        private readonly AnimauxService _service;
        private readonly IMapper _mapper;

        public AnimauxController(AnimauxService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/NomController
        [HttpGet]
        public ActionResult<IEnumerable<AnimauxDTOIn>> GetAllAnimaux()
        {
            IEnumerable<Animaux> listeNomController = _service.GetAllAnimaux();
            return Ok(_mapper.Map<IEnumerable<AnimauxDTOIn>>(listeNomController));
        }

        //GET api/NomController/{i}
        [HttpGet("{id}", Name = "GetAnimauxById")]
        public ActionResult<AnimauxDTOIn> GetAnimauxById(int id)
        {
            Animaux commandItem = _service.GetAnimauxById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<AnimauxDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/NomController
        [HttpPost]
        public ActionResult<AnimauxDTOIn> CreateAnimaux(Animaux obj)
        {
            _service.AddAnimaux(obj);
            return CreatedAtRoute(nameof(GetAnimauxById), new { Id = obj.IdAnimal }, obj);
        }

        //POST api/NomController/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateAnimaux(int id, AnimauxDTOIn obj)
        {
            Animaux objFromRepo = _service.GetAnimauxById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateAnimaux(objFromRepo);
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
        public ActionResult PartialAnimauxUpdate(int id, JsonPatchDocument<Animaux> patchDoc)
        {
            Animaux objFromRepo = _service.GetAnimauxById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Animaux objToPatch = _mapper.Map<Animaux>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateAnimaux(objFromRepo);
            return NoContent();
        }

        //DELETE api/NomController/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteAnimaux(int id)
        {
            Animaux obj = _service.GetAnimauxById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteAnimaux(obj);
            return NoContent();
        }


    }
}
