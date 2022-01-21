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
    class RubriqueProfile : Profile
    {
        public RubriqueProfile()
        {
            CreateMap<Rubrique, RubriqueDTOIn>();
            CreateMap<RubriqueDTOIn, Rubrique>();

            CreateMap<Rubrique, RubriqueDTOOut>();
            CreateMap<RubriqueDTOOut, Rubrique>();

        }
    }
}