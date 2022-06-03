using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdopteUneBeteVisuel.Data.Dtos
{
    public class UsersDTOIn
    {
        public bool? role { get; set; }
        public string login { get; set; }
        public string password { get; set; }
    }

    public class UsersDTOOut
    {
        public UsersDTOOut()
        {
            ListAnimaux = new HashSet<AnimauxDTOIn>();
        }

        public int Id_user { get; set; }
        public bool? role { get; set; }
        public string login { get; set; }
        public string password { get; set; }

        public virtual ICollection<AnimauxDTOIn> ListAnimaux { get; set; }
    }
}
