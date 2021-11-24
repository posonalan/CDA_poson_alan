using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using JeuxVideo.Data.Dtos;
using JeuxVideo.Data.Models;
using JeuxVideo.Data.Services;


namespace JeuxVideo.Controllers
{
    /* définit la route qui mènera à cette classe */
    [Route("api/Jeux")]
    [ApiController]

    public class JeuxController : ControllerBase
    {
        /* le service amené par le constructeur */
        private readonly JeuxServices _service;
        /* le mapper amené par le constructeur */
        private readonly IMapper _mapper;

        /* ********** */

        /* Constructeur */
        public JeuxController(JeuxServices service, IMapper mapper)

        {
            _service = service; _mapper = mapper;
        }

        /* ********** */

        //GET api/Jeux
        [HttpGet] /* Précise le chemin qui amènera à cette méthode */
        public ActionResult<IEnumerable<JeuxDTO>> GetAllPersonnes()
        {
            var listeJeux = _service.GetAllPersonnes();
            return Ok(_mapper.Map<IEnumerable<JeuxDTO>>(listeJeux));
        }

        /* ********** */

        /* GET api/Jeux/{id}*/
        [HttpGet("{id}", Name = "GetJeuById")]
        public ActionResult<JeuxDTO> GetJeuById(int id)
        {
            var commandItem = _service.GetJeuById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<JeuxDTO>(commandItem));
            }
            return NotFound();
        }

        /* ********** */

        /* POST api/Jeux */
        [HttpPost]
        /* fonction de creation de jeu */
        public ActionResult<JeuxDTO> CreatePersonne(Jeu jeu)
        {
            //on ajoute l’objet à la base de données
            _service.AddJeu(jeu); //on retourne le chemin de findById avec l'objet créé
            return CreatedAtRoute(nameof(GetJeuById),
       new { Id = jeu.IdJeu }, jeu);
        }

        /* ********** */ 

        //PUT api/Jeux/{id}
        [HttpPut("{id}")]
        /* fonction de mise a jour du jeu */
        public ActionResult UpdateJeu(int id, JeuxDTO jeu)
        { /* prendre les personne de service par leur id */
            var jeuFromRepo = _service.GetJeuById(id);
            /* On récupère l’objet en base, s’il n’existe pas, on renvoi une erreur. */
            if (jeuFromRepo == null)
            { /* on retourne pas remplis */
                return NotFound();
            }
            jeuFromRepo.Dump();
            /* On propage les modifications grâce au mapper. */
            _mapper.Map(jeu, jeuFromRepo);
            jeuFromRepo.Dump();
            jeu.Dump(); // inutile puisque la fonction ne fait rien, mais garde la cohérence
            /* On persiste les données. */
            _service.UpdateJeu(jeuFromRepo);

            return NoContent();
        }

        /* ********** */

        /*PATCH api/Jeux/{id} */

        [HttpPatch("{id}")]
        /* Modifier qu'une partie de l'objet */
        public ActionResult PartialJeuUpdate(int id, JsonPatchDocument<Jeu> patchDoc)
        {
            /* On précise l’id dans l’URL, on passe les instructions de modification en POST */
            var jeuFromRepo = _service.GetJeuById(id);
            /* On récupère l’objet en base, s’il n’existe pas, on renvoi une erreur. */
            if (jeuFromRepo == null)
            {
                return NotFound();
            }
            /* On vérifie que les modifications sont cohérentes */
            var jeuToPatch = _mapper.Map<Jeu>(jeuFromRepo);
            patchDoc.ApplyTo(jeuToPatch, ModelState);
            if (!TryValidateModel(jeuToPatch))
            {
                return ValidationProblem(ModelState);
            } /* On propage les modifications grâce au mapper. */
            _mapper.Map(jeuToPatch, jeuFromRepo);
            /* On persiste les données. */
            _service.UpdateJeu(jeuFromRepo);
            return NoContent();
        }

        /* ********** */

        //DELETE api/Jeux/{id}
        [HttpDelete("{id}")]
        /* fonction de suppression */
        public ActionResult DeleteJeu(int id)
        {
            var jeuModelFromRepo = _service.GetJeuById(id);
            if (jeuModelFromRepo == null)
            {
                return NotFound();
            }
            _service.DeleteJeu(jeuModelFromRepo);
            return NoContent();
        }
    }
}
