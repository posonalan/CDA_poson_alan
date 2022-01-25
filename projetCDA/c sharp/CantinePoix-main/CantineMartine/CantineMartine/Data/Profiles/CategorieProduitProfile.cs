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
    class CategorieProduitProfile:Profile
    {
        public CategorieProduitProfile()
        {
            CreateMap<Categoriesproduit, CategoriesproduitDTOIn>();
            CreateMap<CategoriesproduitDTOIn, Categoriesproduit>();
            CreateMap<Categoriesproduit, CategoriesproduitDTOOut>();
            CreateMap<CategoriesproduitDTOOut, Categoriesproduit>();
        }
    }
}
