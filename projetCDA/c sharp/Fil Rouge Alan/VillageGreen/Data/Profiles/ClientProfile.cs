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

     class ClientProfile : Profile
    {
        public ClientProfile()
        {
            CreateMap<Client, ClientDTOIn>();
            CreateMap<ClientDTOIn, Client>();

            CreateMap<Client, ClientDTOOut>();
            CreateMap<ClientDTOOut, Client>();

        }
    }
}
