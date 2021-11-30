using AnimauxMany.Data.Dtos;
using AnimauxMany.Data.Models;
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
    public class MilieuVieController : ControllerBase
    {
    }

    private readonly MilieuVieService _service;
    private readonly IMapper _mapper;

    public MilieuVieService(MilieuVieService service, IMapper mapper)
    {
        _service = service;
        _mapper = mapper;
    }

    //GET api/MilieuVie
    [HttpGet]
    public ActionResult<IEnumerable<MilieuVieDTOIn>> GetAllMilieuVie()
    {
        IEnumerable<MilieuVie> listeMilieuVie = _service.GetAllMilieuVie();
        return Ok(_mapper.Map<IEnumerable<MilieuVieDTOIn>>(listeMilieuVie));
    }

    //GET api/MilieuVie/{i}
    [HttpGet("{id}", Name = "GetMilieuVieById")]
    public ActionResult<MilieuVieDTOIn> GetMilieuVieById(int id)
    {
        MilieuVie commandItem = _service.GetMilieuVieById(id);
        if (commandItem != null)
        {
            return Ok(_mapper.Map<MilieuVieDTOIn>(commandItem));
        }
        return NotFound();
    }

    //POST api/MilieuVie
    [HttpPost]
    public ActionResult<MilieuVieDTOIn> CreateMilieuVie(MilieuVie obj)
    {
        _service.AddMilieuVie(obj);
        return CreatedAtRoute(nameof(GetMilieuVieById), new { Id = obj.Id }, obj);
    }

    //POST api/MilieuVie/{id}
    [HttpPut("{id}")]
    public ActionResult UpdateMilieuVie(int id, MilieuVieDTOIn obj)
    {
        MilieuVie objFromRepo = _service.GetMilieuVieById(id);
        if (objFromRepo == null)
        {
            return NotFound();
        }
        _mapper.Map(obj, objFromRepo);
        _service.UpdateMilieuVie(objFromRepo);
        return NoContent();
    }

    // Exemple d'appel
    // [{
    // "op":"replace",
    // "path":"",
    // "value":""
    // }]
    //PATCH api/MilieuVie/{id}
    [HttpPatch("{id}")]
    public ActionResult PartialMilieuVieUpdate(int id, JsonPatchDocument<MilieuVie> patchDoc)
    {
        MilieuVie objFromRepo = _service.GetMilieuVieById(id);
        if (objFromRepo == null)
        {
            return NotFound();
        }
        MilieuVie objToPatch = _mapper.Map<MilieuVie>(objFromRepo);
        patchDoc.ApplyTo(objToPatch, ModelState);
        if (!TryValidateModel(objToPatch))
        {
            return ValidationProblem(ModelState);
        }
        _mapper.Map(objToPatch, objFromRepo);
        _service.UpdateMilieuVie(objFromRepo);
        return NoContent();
    }

    //DELETE api/MilieuVie/{id}
    [HttpDelete("{id}")]
    public ActionResult DeleteMilieuVie(int id)
    {
        MilieuVie obj = _service.GetMilieuVieById(id);
        if (obj == null)
        {
            return NotFound();
        }
        _service.DeleteMilieuVie(obj);
        return NoContent();
    }


}
