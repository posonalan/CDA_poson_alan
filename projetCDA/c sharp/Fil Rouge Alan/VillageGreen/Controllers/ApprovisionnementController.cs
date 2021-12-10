using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Models;

namespace VillageGreen.Controllers
{
    class ApprovisionnementController
    {
        private readonly ApprovisonnementServices _service;
        private readonly IMapper _mapper;

        public ApprovisonnementController(ApprovisonnementServices service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        //GET api/Approvisonnement
        [HttpGet]
        public ActionResult<IEnumerable<ApprovisonnementDTOIn>> GetAllApprovisonnement()
        {
            IEnumerable<Approvisionnement> listeApprovisonnement = _service.GetAllApprovisonnement();
            return Ok(_mapper.Map<IEnumerable<ApprovisonnementDTOIn>>(listeApprovisonnement));
        }

        //GET api/Approvisonnement/{i}
        [HttpGet("{id}", Name = "GetApprovisionnementById")]
        public ActionResult<ApprovisonnementDTOIn> GetApprovisionnementById(int id)
        {
            Approvisionnement commandItem = _service.GetApprovisionnementById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<ApprovisonnementDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Approvisonnement
        [HttpPost]
        public ActionResult<ApprovisonnementDTOIn> CreateApprovisionnement(ApprovisonnementDTOIn objIn)
        {
            Approvisionnement obj = _mapper.Map<Approvisionnement>(objIn);
            _service.AddApprovisionnement(obj);
            return CreatedAtRoute(nameof(GetApprovisionnementById), new { Id = obj.IdApprovisionnement }, obj);
        }

        //POST api/Approvisonnement/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateApprovisionnement(int id, ApprovisonnementDTOIn obj)
        {
            Approvisionnement objFromRepo = _service.GetApprovisionnementById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateApprovisionnement(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Approvisonnement/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialApprovisionnementUpdate(int id, JsonPatchDocument<Approvisionnement> patchDoc)
        {
            Approvisionnement objFromRepo = _service.GetApprovisionnementById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Approvisionnement objToPatch = _mapper.Map<Approvisionnement>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateApprovisionnement(objFromRepo);
            return NoContent();
        }

        //DELETE api/Approvisonnement/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteApprovisionnement(int id)
        {
            Approvisionnement obj = _service.GetApprovisionnementById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteApprovisionnement(obj);
            return NoContent();
        }


    }
}
