using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Profiles
{
    public class EspecesProfiles : Profile
    {
        public EspecesProfiles()
        {
            CreateMap<espece, EspecesDTOIn>();
            CreateMap<EspecesDTOIn, espece>();

            CreateMap<espece, EspecesDTOOut>();
            CreateMap<EspecesDTOOut, espece>();
        }
    }
}