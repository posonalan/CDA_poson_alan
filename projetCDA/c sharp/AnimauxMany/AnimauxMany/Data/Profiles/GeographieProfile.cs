using AnimauxMany.Data.Models;
using AnimauxTest.Data.Dtos;
using AnimauxTest.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Profiles
{
    public class GeographieProfile : Profile
    {
        public GeographieProfile()
        {
            CreateMap<Geographie, GeographieDTOIn>();
            CreateMap<GeographieDTOIn, Geographie>();

            CreateMap<Geographie, GeographieDTOOut>();
            CreateMap<GeographieDTOOut, Geographie>();
        }
    }
}
