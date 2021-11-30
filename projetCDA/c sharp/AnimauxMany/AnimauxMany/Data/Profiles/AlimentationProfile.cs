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
    public class AlimentationProfile : Profile
    {

        public AlimentationProfile()
        {
            CreateMap<Alimentation, AlimentationDTOIn>();
            CreateMap<AlimentationDTOIn, Alimentation>();

            CreateMap<Alimentation, AlimentationDTOOut>();
            CreateMap<AlimentationDTOOut, Alimentation>();
        }
    }
}
