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
    class TypesProduitsProfile : Profile
    {
        public TypesProduitsProfile()
        {
            CreateMap<TypesProduits, TypesProduitsDTOIn>();
            CreateMap<TypesProduitsDTOIn, TypesProduits>();

            CreateMap<TypesProduits, TypesProduitsDTOOut>();
            CreateMap<TypesProduitsDTOOut, TypesProduits>();
        }
    }
}
