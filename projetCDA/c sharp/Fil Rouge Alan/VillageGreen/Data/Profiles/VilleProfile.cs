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
    class VilleProfile : Profile
    {
        public VilleProfile()
        {
            CreateMap<Ville, VilleDTOIn>();
            CreateMap<VilleDTOIn, Ville>();

            CreateMap<Ville, VilleDTOOut>();
            CreateMap<VilleDTOOut, Ville>();

        }
    }
}