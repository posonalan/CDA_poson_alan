using AnimauxTest.Data.Dtos;
using AnimauxTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Profiles
{
    public class HabitatProfile
    {
        public HabitatProfile()
        {
            CreateMap<Habitat, HabitatDTOIn>();
            CreateMap<HabitatDTOIn, Habitat>();

            CreateMap<Habitat, HabitatDTOOut>();
            CreateMap<HabitatDTOOut, Habitat>();
        }
    }
}
