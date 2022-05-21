using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VillageGreen.Data.Dtos;
using VillageGreen.Data.Models;

namespace VillageGreen.Data.Profiles
{

    class CommandeProfile : Profile
    {
        public CommandeProfile()
        {
            CreateMap<Commande, CommandeDTOIn>();
            CreateMap<CommandeDTOIn, Commande>();

            CreateMap<Commande, CommandeDTOOut>();
            CreateMap<CommandeDTOOut, Commande>();

        }
    }
}
