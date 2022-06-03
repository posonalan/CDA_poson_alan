using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Profiles
{
    public class AlimentationsProfiles:Profile
    {
        public AlimentationsProfiles()
        {
            CreateMap<alimentation, AlimentationsDTOIn>();
            CreateMap<AlimentationsDTOIn, alimentation>();

            CreateMap<alimentation, AlimentationsDTOOut>();
            CreateMap<AlimentationsDTOOut, alimentation>();
        }
    }
}
