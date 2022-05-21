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
    class RoleProfile : Profile
    {
        public RoleProfile()
        {
            CreateMap<Role, RoleDTOIn>();
            CreateMap<RoleDTOIn, Role>();

            CreateMap<Role, RoleDTOOut>();
            CreateMap<RoleDTOOut, Role>();

        }
    }
}