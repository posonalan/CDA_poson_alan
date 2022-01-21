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
    class LivraisonProfile : Profile
    {
        public LivraisonProfile()
        {
            CreateMap<Livraison, LivraisonDTOIn>();
            CreateMap<LivraisonDTOIn, Livraison>();

            CreateMap<Livraison, LivraisonDTOOut>();
            CreateMap<LivraisonDTOOut, Livraison>();

        }
    }
}