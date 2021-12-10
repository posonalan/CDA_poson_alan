using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Dtos;
using VillageGreen.Data.Models;

namespace VillageGreen.Controllers
{
    class ClientController
    {

        private readonly ClientServices _service;
        private readonly IMapper _mapper;

        public ClientController(ClientServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Client
        [HttpGet]
        public ActionResult<IEnumerable<ClientDTOIn>> GetAllClient()
        {
            IEnumerable<Client> listeClient = _service.GetAllClient();
            return Ok(_mapper.Map<IEnumerable<ClientDTOIn>>(listeClient));
        }

        //GET api/Client/{i}
        [HttpGet("{id}", Name = "GetClientById")]
        public ActionResult<ClientDTOIn> GetClientById(int id)
        {
            Client commandItem = _service.GetClientById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<ClientDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Client
        [HttpPost]
        public ActionResult<ClientDTOIn> CreateClient(ClientDTOIn objIn)
        {
            Client obj = _mapper.Map<Client>(objIn);
            _service.AddClient(obj);
            return CreatedAtRoute(nameof(GetClientById), new { Id = obj.IdClient }, obj);
        }

        //POST api/Client/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateClient(int id, ClientDTOIn obj)
        {
            Client objFromRepo = _service.GetClientById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateClient(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Client/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialClientUpdate(int id, JsonPatchDocument<Client> patchDoc)
        {
            Client objFromRepo = _service.GetClientById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Client objToPatch = _mapper.Map<Client>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateClient(objFromRepo);
            return NoContent();
        }

        //DELETE api/Client/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteClient(int id)
        {
            Client obj = _service.GetClientById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteClient(obj);
            return NoContent();
        }


    }
}
