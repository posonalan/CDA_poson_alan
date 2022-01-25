
using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
using CantineMartine.Data.Profiles;


using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CantineMartine.Data.Services;

namespace CantineMartine.Data.Controllers
{
    public class MenuController : ControllerBase
    {


        private readonly MenuService _service;
        private readonly IMapper _mapper;

        public MenuController(MyDbContext _context)
        {
            _service = new MenuService(_context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<MenuProfile>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Menu
        [HttpGet]
        public ActionResult<IEnumerable<MenuDTOIn>> GetAllMenu()
        {
            IEnumerable<Menu> listeMenu = _service.GetAllMenu();
            return Ok(_mapper.Map<IEnumerable<MenuDTOIn>>(listeMenu));
        }

       

        //GET api/Menu
        [HttpGet]
        public IEnumerable<MenuDTOIn> GetAllSemaine()
        {
            IEnumerable<Menu> listeSemaine = _service.GetAllSemaine();
            return _mapper.Map<IEnumerable<MenuDTOIn>>(listeSemaine);
        }

        //GET api/Menu/{i}
        [HttpGet("{id}", Name = "GetMenuById")]
        public ActionResult<MenuDTOIn> GetMenuById(int id)
        {
            Menu commandItem = _service.GetMenuById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<MenuDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Menu
        [HttpPost]
        public ActionResult<MenuDTOIn> CreateMenu(Menu obj)
        {
            _service.AddMenu(obj);
            return CreatedAtRoute(nameof(GetMenuById), new { Id = obj.IdMenu }, obj);
        }

        //POST api/Menu/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateMenu(int id, MenuDTOIn obj)
        {
            Menu objFromRepo = _service.GetMenuById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateMenu(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Menu/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialMenuUpdate(int id, JsonPatchDocument<Menu> patchDoc)
        {
            Menu objFromRepo = _service.GetMenuById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Menu objToPatch = _mapper.Map<Menu>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateMenu(objFromRepo);
            return NoContent();
        }

        //DELETE api/Menu/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteMenu(int id)
        {
            Menu obj = _service.GetMenuById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteMenu(obj);
            return NoContent();
        }


    }
}
