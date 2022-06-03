using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Profiles
{
    public class UsersProfiles : Profile
    {
        public UsersProfiles()
        {
            CreateMap<user, UsersDTOIn>();
            CreateMap<UsersDTOIn, user>();

            CreateMap<user, UsersDTOOut>();
            CreateMap<UsersDTOOut, user>();
        }
    }
}