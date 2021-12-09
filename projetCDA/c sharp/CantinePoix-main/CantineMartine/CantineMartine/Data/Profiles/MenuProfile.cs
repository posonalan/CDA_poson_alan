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
   public class MenuProfile : Profile
    {
        public MenuProfile()
            {
                CreateMap<Menu, MenuDTOIn>();
                CreateMap<MenuDTOIn, Menu>();

                CreateMap<Menu, MenuDTOOut>();
                CreateMap<MenuDTOOut, Menu>(); 
            }
    }
}
