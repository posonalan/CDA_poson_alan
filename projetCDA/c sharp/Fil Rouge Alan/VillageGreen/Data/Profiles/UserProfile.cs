using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Dtos;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Profiles
{
    class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserDTOIn>();
            CreateMap<UserDTOIn, User>();

            CreateMap<User, UserDTOOut>();
            CreateMap<UserDTOOut, User>();

        }
    }
}