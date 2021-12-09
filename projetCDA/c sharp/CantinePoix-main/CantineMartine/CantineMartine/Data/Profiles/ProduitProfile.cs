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
    class ProduitProfile:Profile
    {
        public ProduitProfile()
        {
            CreateMap<Produit, ProduitDTOIn>();
            CreateMap<ProduitDTOIn, Produit>();
            CreateMap<Produit, ProduitDTOOut>();
            CreateMap<ProduitDTOOut, Produit>();
            CreateMap<Produit, ProduitDTOAvecLibelleCategorieProduit>().ForMember(d => d.LibelleCategorieProduit, o => o.MapFrom(s => s.CategProduit.LibelleCategorieProduit));
        }
    }
}
