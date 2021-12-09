using AutoMapper;
using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
using CantineMartine.Data.Services;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Controllers
{
    class ContenuMenuController : ControllerBase 
    {

        private readonly ContenuMenuService _service;
        private readonly IMapper _mapper;

        public ContenuMenuController(ContenuMenuService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/ContenuMenu
        [HttpGet]
        public ActionResult<IEnumerable<ContenuMenuDTOIn>> GetAllContenuMenu()
        {
            IEnumerable<Contenumenu> listeContenuMenu = _service.GetAllContenuMenu();
            return Ok(_mapper.Map<IEnumerable<ContenuMenuDTOIn>>(listeContenuMenu));
        }



        //GET api/ContenuMenu/{i}
        [HttpGet("{id}", Name = "GetContenuMenuById")]
        public ActionResult<ContenuMenuDTOIn> GetContenuMenuById(int id)
        {
            Contenumenu commandItem = _service.GetContenuMenuById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<ContenuMenuDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/ContenuMenu
        [HttpPost]
        public ActionResult<ContenuMenuDTOIn> CreateContenuMenu(Contenumenu obj)
        {
            _service.AddContenuMenu(obj);
            return CreatedAtRoute(nameof(GetContenuMenuById), new { Id = obj.IdContenuMenu }, obj);
        }

        //POST api/ContenuMenu/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateContenuMenu(int id, ContenuMenuDTOIn obj)
        {
            Contenumenu objFromRepo = _service.GetContenuMenuById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateContenuMenu(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/ContenuMenu/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialContenuMenuUpdate(int id, JsonPatchDocument<Contenumenu> patchDoc)
        {
            Contenumenu objFromRepo = _service.GetContenuMenuById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Contenumenu objToPatch = _mapper.Map<Contenumenu>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateContenuMenu(objFromRepo);
            return NoContent();
        }

        //DELETE api/ContenuMenu/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteContenuMenu(int id)
        {
            Contenumenu obj = _service.GetContenuMenuById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteContenuMenu(obj);
            return NoContent();
        }


    }
}
