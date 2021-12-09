using AnimauxTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxTest.Data.Profiles
{
    public class GeographieProfile
    {
        public GeographieProfile()
        {
            CreateMap<Geographie, GeographieDTOIn>();
            CreateMap<GeographieDTOIn, Geographie>();

            CreateMap<Geographie, GeographieDTOOut>();
            CreateMap<GeographieDTOOut, Geographie>();
        }
    }
}
