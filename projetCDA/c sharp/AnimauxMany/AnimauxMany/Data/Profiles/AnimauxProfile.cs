﻿using AnimauxMany.Data.Models;
using AnimauxTest.Data.Dtos;
using AnimauxTest.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Profiles
{
    public class AnimauxProfile : Profile
    {
        public AnimauxProfile()
        {
            CreateMap<Animaux, AnimauxDTOIn>();
            CreateMap<AnimauxDTOIn, Animaux>();

            CreateMap<Animaux, AnimauxDTOOut>();
            CreateMap<Animaux, AnimauxDTOAvecLiens>();

            CreateMap<AnimauxDTOOut, Animaux>();
            CreateMap<AnimauxDTOAvecLiens, Animaux>();
        }

    }
}
