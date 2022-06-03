using _7._GestionStocks.Data;
using _7._GestionStocks.Data.Dtos;
using _7._GestionStocks.Data.Models;
using _7._GestionStocks.Data.Profiles;
using _7._GestionStocks.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticlesController : Controller
    {

        private readonly ArticlesServices _service;
        private readonly IMapper _mapper;

        public ArticlesController(GestionStocksContext context)
        {
            _service = new ArticlesServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<ArticlesProfile>();
                cfg.AddProfile<CategoriesProfile>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Articles
        [HttpGet]
        public IEnumerable<ArticlesDTOOut> GetAllArticles()
        {
            IEnumerable<Articles> listeArticles = _service.GetAllArticles();
            return _mapper.Map<IEnumerable<ArticlesDTOOut>>(listeArticles);
        }

        //GET api/Articles/{i}
        [HttpGet("{id}", Name = "GetArticlesById")]
        public ActionResult<ArticlesDTOIn> GetArticlesById(int id)
        {
            Articles commandItem = _service.GetArticleById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<ArticlesDTOIn>(commandItem));
            }
            return NotFound();
        }

        //POST api/Articles
        [HttpPost]
        public ActionResult<ArticlesDTOIn> CreateArticles(ArticlesDTOIn objIn)
        {
            Articles obj = _mapper.Map<Articles>(objIn);
            _service.AddArticle(obj);
            return CreatedAtRoute(nameof(GetArticlesById), new { Id = obj.IdArticle }, obj);
        }

        //POST api/Articles/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateArticles(int id, ArticlesDTOIn obj)
        {
            Articles objFromRepo = _service.GetArticleById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateArticle(objFromRepo);
            return NoContent();
        }

        // Exemple d'appel
        // [{
        // "op":"replace",
        // "path":"",
        // "value":""
        // }]
        //PATCH api/Articles/{id}
        [HttpPatch("{id}")]
        public ActionResult PartialArticlesUpdate(int id, JsonPatchDocument<Articles> patchDoc)
        {
            Articles objFromRepo = _service.GetArticleById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            Articles objToPatch = _mapper.Map<Articles>(objFromRepo);
            patchDoc.ApplyTo(objToPatch, ModelState);
            if (!TryValidateModel(objToPatch))
            {
                return ValidationProblem(ModelState);
            }
            _mapper.Map(objToPatch, objFromRepo);
            _service.UpdateArticle(objFromRepo);
            return NoContent();
        }

        //DELETE api/Articles/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteArticles(int id)
        {
            Articles obj = _service.GetArticleById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteArticle(obj);
            return NoContent();
        }


    }
}
