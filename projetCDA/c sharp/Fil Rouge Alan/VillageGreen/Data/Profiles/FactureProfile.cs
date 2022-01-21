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

    class FactureProfile : Profile
    {
        public FactureProfile()
        {
            CreateMap<Facture, FactureDTOIn>();
            CreateMap<FactureDTOIn, Facture>();

            CreateMap<Facture, FactureDTOOut>();
            CreateMap<FactureDTOOut, Facture>();

        }
    }
}