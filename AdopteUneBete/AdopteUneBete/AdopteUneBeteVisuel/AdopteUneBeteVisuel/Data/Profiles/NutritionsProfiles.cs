using AdopteUneBeteVisuel.Data.Dtos;
using AdopteUneBeteVisuel.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Profiles
{
    public class NutritionsProfiles : Profile
    {
        public NutritionsProfiles()
        {
            CreateMap<nutrition, NutritionsDTOIn>();
            CreateMap<NutritionsDTOIn, nutrition>();

            CreateMap<nutrition, NutritionsDTOOut>();
            CreateMap<NutritionsDTOOut, nutrition>();

            CreateMap<nutrition, NutritionsDTORaces>();
            CreateMap<NutritionsDTORaces, nutrition>();

            CreateMap<nutrition, NutritionsDTOAlimentations>();
            CreateMap<NutritionsDTOAlimentations, nutrition>();
        }
    }
}