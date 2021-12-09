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
    class CategoriePlatProfile : Profile
    {
        public CategoriePlatProfile()
        {
            CreateMap<Categoriesplat, CategoriesPlatsDTOIn>();
            CreateMap<CategoriesPlatsDTOIn, Categoriesplat>();

            CreateMap<Categoriesplat, CategoriesPlatsDTOOut>();
            CreateMap<CategoriesPlatsDTOOut, Categoriesplat>();
        }
    }
}
