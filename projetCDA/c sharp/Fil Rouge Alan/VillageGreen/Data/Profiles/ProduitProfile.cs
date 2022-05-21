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
    class ProduitProfile : Profile
    {
        public ProduitProfile()
        {
            CreateMap<Produit, ProduitDTOIn>();
            CreateMap<ProduitDTOIn, Produit>();

            CreateMap<Produit, ProduitDTOOut>();
            CreateMap<ProduitDTOOut, Produit>();

        }
    }
}