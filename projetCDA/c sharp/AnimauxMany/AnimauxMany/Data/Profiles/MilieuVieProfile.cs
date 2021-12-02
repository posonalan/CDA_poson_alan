using AnimauxMany.Data.Dtos;
using AnimauxMany.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Profiles
{
    public class MilieuVieProfile : Profile
    {
        public MilieuVieProfile()
        {

            CreateMap<MilieuVie, MilieuVieDTOIn>();
            CreateMap<MilieuVieDTOIn, MilieuVie>();

            CreateMap<MilieuVie, MilieuVieDTOOut>();
            CreateMap<MilieuVieDTOOut, MilieuVie>();

            CreateMap<MilieuVie, MilieuVieDTOLiens>();
            CreateMap<MilieuVieDTOLiens, MilieuVie>();

            CreateMap<MilieuVie, MilieuVieDTOAnimaux>();
            CreateMap<MilieuVieDTOAnimaux, MilieuVie>();

        }
    }
}
