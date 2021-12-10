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
    class CategorieClientProfile : Profile
    {
        public CategorieClientProfile()
        {
            CreateMap<CategorieClient, CategorieClientDTOIn>();
            CreateMap<CategorieClientDTOIn, CategorieClient>();

            CreateMap<CategorieClient, CategorieClientDTOOut>();
            CreateMap<CategorieClientDTOOut, CategorieClient>();
        }
    }
}
