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
    class PaysProfile : Profile
    {
        public PaysProfile()
        {
            CreateMap<Pays, PaysDTOIn>();
            CreateMap<PaysDTOIn, Pays>();

            CreateMap<Pays, PaysDTOOut>();
            CreateMap<PaysDTOOut, Pays>();

        }
    }
}