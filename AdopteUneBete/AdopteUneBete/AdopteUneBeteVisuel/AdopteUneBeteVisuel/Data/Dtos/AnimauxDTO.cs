using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Dtos
{
    public class AnimauxDTOIn
    {
        public string matricule { get; set; }
        public string image { get; set; }
        public int age { get; set; }
        public int? Id_user { get; set; }
        public int Id_Race { get; set; }
    }

    public class AnimauxDTOOut
    {
        public int Id_Animal { get; set; }
        public string matricule { get; set; }
        public string image { get; set; }
        public int age { get; set; }
        public int? Id_user { get; set; }
        public int Id_Race { get; set; }
        public virtual UsersDTOIn User { get; set; }
        public virtual RacesDTOIn Race { get; set; }
    }
}
