using System;
using System.Collections.Generic;

#nullable disable

namespace AdopteUneBeteVisuel.Data.Models
{
    public partial class user
    {
        public user()
        {
            ListAnimaux = new HashSet<animaux>();
        }

        public int Id_user { get; set; }
        public bool? role { get; set; }
        public string login { get; set; }
        public string password { get; set; }

        public virtual ICollection<animaux> ListAnimaux { get; set; }
    }
}
