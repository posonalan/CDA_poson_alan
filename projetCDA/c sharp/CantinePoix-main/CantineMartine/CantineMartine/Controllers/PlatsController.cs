using AutoMapper;
using CantineMartine.Data;
using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
using CantineMartine.Data.Profiles;
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
    [Route("api/[controller]")]
    [ApiController]
    public class PlatsController : Controller
    {

        private readonly PlatsServices _service;
        private readonly IMapper _mapper;

        public PlatsController(MyDbContext context)
        {
            _service = new PlatsServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<PlatProfile>();
                cfg.AddProfile<CategoriePlatProfile>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Plats
        [HttpGet]
        public IEnumerable<PlatsDTOOut> GetAllPlats()
        {
            IEnumerable<Plat> listePlats = _service.GetAllPlats();
            return _mapper.Map<IEnumerable<PlatsDTOOut>>(listePlats);
        }

        //GET api/Plats/{i}
        [HttpGet("{id}", Name = "GetPlatById")]
        public PlatsDTOOut GetPlatById(int id)
        {
            Plat commandItem = _service.GetPlatById(id);
            if (commandItem != null)
            {
                return _mapper.Map<PlatsDTOOut>(commandItem);
            }
            return null;
        }

        //POST api/Plats
        [HttpPost]
        public PlatsDTOIn CreatePlat(PlatsDTOIn objIn)
        {
            Plat obj = _mapper.Map<Plat>(objIn);
            _service.AddPlat(obj);
            return null;
        }

        //POST api/Plats/{id}
        [HttpPut("{id}")]
        public void UpdatePlat(int id, PlatsDTOIn obj)
        {
            Plat objFromRepo = _service.GetPlatById(id);
            if (objFromRepo == null)
            {
                return;
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdatePlat(objFromRepo);
            return;
        }

        //DELETE api/Plats/{id}
        [HttpDelete("{id}")]
        public void DeletePlat(int id)
        {
            Plat obj = _service.GetPlatById(id);
            if (obj == null)
            {
                return;
            }
            _service.DeletePlat(obj);
            return;
        }

    }
}
