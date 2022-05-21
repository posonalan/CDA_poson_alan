using ApiMultiBillet.Data.Dtos;
using ApiMultiBillet.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Data.Profiles
{
    public class BilleteriesProfiles : Profile
    {
        public BilleteriesProfiles()
        {
            CreateMap<Billeterie, BilleterieDTO>();
            CreateMap<BilleterieDTO, Billeterie>();
        }

    }
}
