using AutoMapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

using ApiMultiBillet.Data.Dtos;
using ApiMultiBillet.Data.Models;
using ApiMultiBillet.Data.Servives;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class BilleteriesController : ControllerBase
    {

        private readonly BilleteriesServices _service;
        private readonly IMapper _mapper;

        public BilleteriesController(BilleteriesServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Billeteries
        [EnableCors("toto")]
        [HttpGet]
        public ActionResult<IEnumerable<BilleterieDTO>> GetAllBilleterie()
        {
            IEnumerable<Billeterie> listeBilleteries = _service.GetAllBilleterie();
            return Ok(_mapper.Map<IEnumerable<BilleterieDTO>>(listeBilleteries));
        }

        //GET api/Billeteries/{i}
        [EnableCors("toto")]
        [HttpGet("{id}", Name = "GetBilleteriesById")]
        public ActionResult<BilleterieDTO> GetBilleterieById(int id)
        {
            Billeterie commandItem = _service.GetBilleterieById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<BilleterieDTO>(commandItem));
            }
            return NotFound();
        }

        //POST api/Billeteries
        [HttpPost]
        public ActionResult<BilleterieDTO> CreateBilleterie(BilleterieDTO obj)
        {

            _service.AddBilleterie(_mapper.Map<Billeterie>(obj));
            return CreatedAtRoute(nameof(GetBilleterieById), new { Id = obj.IdBillet }, obj);
        }

        //POST api/Billeteries/{id}
        [EnableCors("toto")]
        [HttpPut("{id}")]
        public ActionResult UpdateBilleterie(int id, BilleterieDTO obj)
        {
            Billeterie objFromRepo = _service.GetBilleterieById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateBilleterie(objFromRepo);
            return NoContent();
        }

        //DELETE api/Billeteries/{id}
        [EnableCors("toto")]
        [HttpDelete("{id}")]
        public ActionResult DeleteBilleterie(int id)
        {
            Billeterie obj = _service.GetBilleterieById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteBilleterie(obj);
            return NoContent();
        }


    }
}
