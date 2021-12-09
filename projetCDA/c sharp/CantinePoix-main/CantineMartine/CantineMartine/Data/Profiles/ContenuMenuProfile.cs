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
    public class ContenuMenuProfile : Profile
    {
        public ContenuMenuProfile()
        {
            CreateMap<Contenumenu, ContenuMenuDTOIn>();
            CreateMap<ContenuMenuDTOIn, Contenumenu>();

            CreateMap<Contenumenu, ContenuMenuDTOOut>();
            CreateMap<ContenuMenuDTOOut, Contenumenu>();



        }
    }
}
