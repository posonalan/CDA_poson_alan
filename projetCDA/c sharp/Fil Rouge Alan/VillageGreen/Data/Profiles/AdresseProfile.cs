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
    class AdresseProfile : Profile
    {
        public AdresseProfile()
        {
            CreateMap<Adresse, AdresseDTOIn>();
            CreateMap<AdresseDTOIn, Adresse>();

            CreateMap<Adresse, AdresseDTOOut>();
            CreateMap<AdresseDTOOut, Adresse>();
        }
    }
}
