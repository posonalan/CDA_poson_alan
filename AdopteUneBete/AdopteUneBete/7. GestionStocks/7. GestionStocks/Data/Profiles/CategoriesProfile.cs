using _7._GestionStocks.Data.Dtos;
using _7._GestionStocks.Data.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7._GestionStocks.Data.Profiles
{
    class CategoriesProfile : Profile
    {
        public CategoriesProfile()
        {
            CreateMap<Categories, CategoriesDTOIn>();
            CreateMap<CategoriesDTOIn, Categories>();

            CreateMap<Categories, CategoriesDTOOut>();
            CreateMap<CategoriesDTOOut, Categories>();
        }
    }
}
