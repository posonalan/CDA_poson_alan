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
    class LigneCommandeProfile : Profile
    {
        public LigneCommandeProfile()
        {
            CreateMap<LigneCommande, LigneCommandeDTOIn>();
            CreateMap<LigneCommandeDTOIn, LigneCommande>();

            CreateMap<LigneCommande, LigneCommandeDTOOut>();
            CreateMap<LigneCommandeDTOOut, LigneCommande>();

        }
    }
}