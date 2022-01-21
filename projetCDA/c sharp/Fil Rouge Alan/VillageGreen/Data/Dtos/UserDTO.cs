using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VillageGreen.Data.Dtos
{
    public partial class UserDTOIn
    {
        public UserDTOIn()
        { }
        public string NomUser { get; set; }
        public string PrenomUser { get; set; }
        public string EmailUser { get; set; }
        public string MdpUser { get; set; }
        public int IdRole { get; set; }
    }
    public partial class UserDTOOut
    {
        public UserDTOOut()
        { }
        public int IdUser { get; set; }
        public string NomUser { get; set; }
        public string PrenomUser { get; set; }
        public string EmailUser { get; set; }
        public string MdpUser { get; set; }
        public int IdRole { get; set; }
    }
}
