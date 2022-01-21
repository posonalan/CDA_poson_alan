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
    class ProgressionCommandeProfile : Profile
    {
        public ProgressionCommandeProfile()
        {
            CreateMap<ProgressionCommande, ProgressionCommandeDTOIn>();
            CreateMap<ProgressionCommandeDTOIn, ProgressionCommande>();

            CreateMap<ProgressionCommande, ProgressionCommandeDTOOut>();
            CreateMap<ProgressionCommandeDTOOut, ProgressionCommande>();

        }
    }
}