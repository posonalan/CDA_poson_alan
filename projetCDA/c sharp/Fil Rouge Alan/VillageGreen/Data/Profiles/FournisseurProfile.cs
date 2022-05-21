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

    class FournisseurProfile : Profile
    {
        public FournisseurProfile()
        {
            CreateMap<Fournisseur, FournisseurDTOIn>();
            CreateMap<FournisseurDTOIn, Fournisseur>();

            CreateMap<Fournisseur, FournisseurDTOOut>();
            CreateMap<FournisseurDTOOut, Fournisseur>();

        }
    }
}