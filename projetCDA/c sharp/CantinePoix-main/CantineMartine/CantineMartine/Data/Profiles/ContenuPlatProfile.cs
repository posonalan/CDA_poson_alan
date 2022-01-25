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
    public class ContenuPlatProfile : Profile
    {
        public ContenuPlatProfile()
        {
            CreateMap<Contenuplat, ContenuplatsDTOIn>();
            CreateMap<ContenuplatsDTOIn, Contenuplat>();

            CreateMap<Contenuplat, ContenuplatsDTOOut>();
            CreateMap<ContenuplatsDTOOut, Contenuplat>();



        }
    }
}
