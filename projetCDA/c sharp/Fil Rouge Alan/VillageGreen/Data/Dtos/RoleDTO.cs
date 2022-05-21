using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class RoleDTOIn
    {
        public RoleDTOIn()
        { }
        public string LibelleRole { get; set; }
    }
    public partial class RoleDTOOut
    {
        public RoleDTOOut()
        { }
        public int IdRole { get; set; }
        public string LibelleRole { get; set; }
    }
}
