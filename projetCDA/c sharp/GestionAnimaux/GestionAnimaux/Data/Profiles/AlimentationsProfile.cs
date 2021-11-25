using AutoMapper;
using GestionAnimaux.Data.Dtos;
using GestionAnimaux.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GestionAnimaux.Data.Profiles
{
    public class AlimentationsProfile : Profile
    {
        public AlimentationsProfile()
        {
            CreateMap<AlimentationsDTO, Aliment>();
            CreateMap<Aliment, AlimentationsDTO>();


            // Pour les données Alimentation contenu dans Animaux => il y aura un appel à AlimentationsProfile
        }
    }
}

