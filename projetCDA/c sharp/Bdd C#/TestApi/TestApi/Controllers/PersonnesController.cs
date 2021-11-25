using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestApi.Data.Dtos;
using TestApi.Data.Models;
using TestApi.Data.Service;

namespace TestApi.Controllers
{
    /* définit la route qui mènera à cette classe */
    [Route("api/Personnes")]
    [ApiController]
    public class PersonnesController : ControllerBase
    {
        /* le service amené par le constructeur */
        private readonly PersonnesServices _service;
        /* le mapper amené par le constructeur */
        private readonly IMapper _mapper;
        public PersonnesController(PersonnesServices service, IMapper mapper)

        {
            _service = service; _mapper = mapper;
        }

        //GET api/personnes
        [HttpGet] /* Précise le chemin qui amènera à cette méthode */
        public ActionResult<IEnumerable<PersonnesDTO>> GetAllPersonnes()
        {
            var listePersonnes = _service.GetAllPersonnes();
            return Ok(_mapper.Map<IEnumerable<PersonnesDTO>>(listePersonnes));
        }

        /* GET api/personnes/{id}*/
        [HttpGet("{id}", Name = "GetPersonneById")]
        public ActionResult<PersonnesDTO> GetPersonneById(int id)
        {
            var commandItem = _service.GetPersonneById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<PersonnesDTO>(commandItem));
            }
            return NotFound();
        }

        /* POST api/personnes */
        [HttpPost]
        /* fonction de creation de personne */
        public ActionResult<PersonnesDTO> CreatePersonne(Personne personne)
        {
            //on ajoute l’objet à la base de données
            _service.AddPersonnes(personne); //on retourne le chemin de findById avec l'objet créé
            return CreatedAtRoute(nameof(GetPersonneById),
       new { Id = personne.IdPersonnes }, personne);
        }

        //PUT api/personnes/{id}
        [HttpPut("{id}")]
        /* fonction de mise a jour de la personne */
        public ActionResult UpdatePersonne(int id, PersonnesDTO personne)
        { /* prendre les personne de service par leur id */
            var personneFromRepo = _service.GetPersonneById(id);
            /* On récupère l’objet en base, s’il n’existe pas, on renvoi une erreur. */
            if (personneFromRepo == null)
            { /* on retourne pas remplis */
                return NotFound();
            }
            personneFromRepo.Dump();
            /* On propage les modifications grâce au mapper. */
            _mapper.Map(personne, personneFromRepo);
            personneFromRepo.Dump();
            personne.Dump(); // inutile puisque la fonction ne fait rien, mais garde la cohérence
            /* On persiste les données. */
            _service.UpdatePersonne(personneFromRepo);

            return NoContent();

        }

        /*PATCH api/personnes/{id} */

        [HttpPatch("{id}")]
        /* modifier qu'une partie de l'objet */
        public ActionResult PartialPersonneUpdate(int id, JsonPatchDocument<Personne> patchDoc)
        {
            /* On précise l’id dans l’URL, on passe les instructions de modification en POST */
            var personneFromRepo = _service.GetPersonneById(id);
            /* On récupère l’objet en base, s’il n’existe pas, on renvoi une erreur. */
            if (personneFromRepo == null)
            {
                return NotFound();
            }
            /* On vérifie que les modifications sont cohérentes */
            var personneToPatch = _mapper.Map<Personne>(personneFromRepo);
            patchDoc.ApplyTo(personneToPatch, ModelState);
            if (!TryValidateModel(personneToPatch))
            {
                return ValidationProblem(ModelState);
            } /* On propage les modifications grâce au mapper. */
            _mapper.Map(personneToPatch, personneFromRepo);
            /* On persiste les données. */
            _service.UpdatePersonne(personneFromRepo);
            return NoContent();
        }

        //DELETE api/personnes/{id}
        [HttpDelete("{id}")]
        /* fonction de suppression */ 
        public ActionResult DeletePersonne(int id)
        {
            var personneModelFromRepo = _service.GetPersonneById(id);
            if (personneModelFromRepo == null)
            {
                return NotFound();
            }
            _service.DeletePersonne(personneModelFromRepo);
            return NoContent();
        }


    }
}
