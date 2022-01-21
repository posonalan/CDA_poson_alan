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
    class HistoriqueTVAProfile : Profile
    {
        public HistoriqueTVAProfile()
        {
            CreateMap<HistoriqueTVA, HistoriqueTVADTOIn>();
            CreateMap<HistoriqueTVADTOIn, HistoriqueTVA>();

            CreateMap<HistoriqueTVA, HistoriqueTVADTOOut>();
            CreateMap<HistoriqueTVADTOOut, HistoriqueTVA>();

        }
    }
}