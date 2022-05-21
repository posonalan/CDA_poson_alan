using ApiMultiBillet.Data.Dtos;
using ApiMultiBillet.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiMultiBillet.Data.Profiles
{
    public class StagiairesProfiles : Profile
    {
        public StagiairesProfiles()
        {
            CreateMap<Stagiaire, StagiaireDTO>();
            CreateMap<StagiaireDTO, Stagiaire>();
        }

    }
}
