using AutoMapper;
using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CantineMartine.Data.Profiles
{
    class PlatProfile : Profile
    {
        public PlatProfile()
        {
            CreateMap<Plat, PlatsDTOIn>();
            CreateMap<PlatsDTOIn, Plat>();

            CreateMap<Plat, PlatsDTOOut>();
            CreateMap<PlatsDTOOut, Plat>();

            CreateMap<Plat, PlatsDTOOut>().ForMember(d => d.LibelleCategoriePlat, o => o.MapFrom(s => s.CategoriePlat.LibelleCategoriePlat));
        }
    }
}
