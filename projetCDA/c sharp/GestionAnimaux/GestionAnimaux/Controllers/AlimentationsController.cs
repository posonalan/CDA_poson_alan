using AutoMapper;
using GestionAnimaux.Data.Dtos;
using GestionAnimaux.Data.Models;
using GestionAnimaux.Data.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GestionAnimaux.Controllers
{

    [Route("api/Alimentation")]
    [ApiController]
    public class AlimentationsController : ControllerBase 
    {

        private readonly AlimentationsService _service;
        private readonly IMapper _mapper;

        public AlimentationsController(AlimentationsService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper; 
        }

        [HttpGet]
        public ActionResult<IEnumerable<AlimentationsDTO>> GetAllAliment()
        {
            IEnumerable<Aliment> listeAliment = _service.GetAllAliment();
            return Ok(_mapper.Map<IEnumerable<AlimentationsDTO>>(listeAliment));
        }

 
    }
}
