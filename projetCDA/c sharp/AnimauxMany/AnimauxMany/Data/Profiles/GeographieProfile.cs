using AnimauxMany.Data.Models;
using AnimauxMany.Data.Dtos;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Profiles
{
    public class GeographieProfile : Profile
    {
        public GeographieProfile()
        {
            CreateMap<Geographie, GeographieDTOIn>();
            CreateMap<GeographieDTOIn, Geographie>();

            CreateMap<Geographie, GeographieDTOOut>();
            CreateMap<Geographie, AnimauxDTOAvecLiens>();

            CreateMap<GeographieDTOOut, Geographie>();
            CreateMap<AnimauxDTOAvecLiens, Geographie>();


        }
    }
}
