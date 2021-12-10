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
    class ApprovisionnementProfile : Profile
    {
        public ApprovisionnementProfile()
        { 
        CreateMap<Approvisionnement, ApprovisionnementDTOIn>(); 
        CreateMap<ApprovisionnementDTOIn, Approvisionnement>(); 

        CreateMap<Approvisionnement, ApprovisionnementDTOOut>(); 
        CreateMap<ApprovisionnementDTOOut, Approvisionnement>(); 
        }
    }
}
