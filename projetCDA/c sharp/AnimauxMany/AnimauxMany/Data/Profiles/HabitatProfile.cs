using AnimauxMany.Data.Models;
using AnimauxMany.Data.Dtos;

using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Profiles
{
    public class HabitatProfile : Profile
    {
        public HabitatProfile()
        {
            CreateMap<Habitat, HabitatDTOIn>();
            CreateMap<HabitatDTOIn, Habitat>();

            CreateMap<Habitat, HabitatDTOOut>();
            CreateMap<Habitat, AnimauxDTOAvecLiens>();

            CreateMap<HabitatDTOOut, Habitat>();
            CreateMap<AnimauxDTOAvecLiens, Habitat>();

        }
    }
}
