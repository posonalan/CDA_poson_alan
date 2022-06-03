using AdopteUneBeteVisuel.Data;
using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AdopteUneBeteVisuel.Data.Profiles;
using AdopteUneBeteVisuel.Data.Services;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class UsersController:Controller
    {

        private readonly UsersServices _service;
        private readonly IMapper _mapper;

        public UsersController(MyDbContext context)
        {
            _service = new UsersServices(context);
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<UsersProfiles>();
                cfg.AddProfile<AnimauxProfiles>();
            });
            _mapper = config.CreateMapper();
        }

        //GET api/Users
        [HttpGet]
        public IEnumerable<UsersDTOOut> GetAllUsers()
        {
            IEnumerable<user> listeUsers = _service.GetAllUsers();
            return _mapper.Map<IEnumerable<UsersDTOOut>>(listeUsers);
        }

        //GET api/Users/{i}
        [HttpGet("{id}", Name = "GetUserById")]
        public ActionResult<UsersDTOOut> GetUserById(int id)
        {
            user commandItem = _service.GetUserById(id);
            if (commandItem != null)
            {
                return Ok(_mapper.Map<UsersDTOOut>(commandItem));
            }
            return NotFound();
        }

        //POST api/Users
        [HttpPost]
        public ActionResult<UsersDTOIn> CreateUser(UsersDTOIn objIn)
        {
            user obj = _mapper.Map<user>(objIn);
            _service.AddUser(obj);
            return CreatedAtRoute(nameof(GetUserById), new { Id = obj.Id_user }, obj);
        }

        //POST api/Users/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateUser(int id, UsersDTOIn obj)
        {
            user objFromRepo = _service.GetUserById(id);
            if (objFromRepo == null)
            {
                return NotFound();
            }
            _mapper.Map(obj, objFromRepo);
            _service.UpdateUser(objFromRepo);
            return NoContent();
        }

        //DELETE api/Users/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteUser(int id)
        {
            user obj = _service.GetUserById(id);
            if (obj == null)
            {
                return NotFound();
            }
            _service.DeleteUser(obj);
            return NoContent();
        }


    }
}
