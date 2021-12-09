using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestApi.Data.Dtos;
using TestApi.Data.Models;

namespace TestApi.Data.Profiles
{
    public class PersonnesProfile : Profile
    {

        /* Constructeur */ 
        public PersonnesProfile()
        {
            CreateMap<Personne, PersonnesDTO>();
            CreateMap<PersonnesDTO, Personne>();
        }
    }
}
