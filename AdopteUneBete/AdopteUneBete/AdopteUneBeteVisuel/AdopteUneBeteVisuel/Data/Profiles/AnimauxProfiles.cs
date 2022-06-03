using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Profiles
{
    public class AnimauxProfiles : Profile
    {
        public AnimauxProfiles()
        {
            CreateMap<animaux, AnimauxDTOIn>();
            CreateMap<AnimauxDTOIn, animaux>();

            CreateMap<animaux, AnimauxDTOOut>();
            CreateMap<AnimauxDTOOut, animaux>();
        }
    }
}