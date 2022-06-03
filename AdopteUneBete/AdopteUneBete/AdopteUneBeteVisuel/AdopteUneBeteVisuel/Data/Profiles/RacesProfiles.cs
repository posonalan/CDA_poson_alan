using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Profiles
{
    public class RacesProfiles : Profile
    {
        public RacesProfiles()
        {
            CreateMap<race, RacesDTOIn>();
            CreateMap<RacesDTOIn, race>();

            CreateMap<race, RacesDTOOut>();
            CreateMap<RacesDTOOut, race>();
        }
    }
}