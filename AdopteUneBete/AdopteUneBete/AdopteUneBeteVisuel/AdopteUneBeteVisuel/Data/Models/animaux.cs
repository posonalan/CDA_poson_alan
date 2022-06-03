using System;
using System.Collections.Generic;

#nullable disable

namespace AdopteUneBeteVisuel.Data.Models
{
    public partial class animaux
    {
        public int Id_Animal { get; set; }
        public string matricule { get; set; }
        public string image { get; set; }
        public int age { get; set; }
        public int? Id_user { get; set; }
        public int Id_Race { get; set; }

        public virtual user User { get; set; }
        public virtual race Race { get; set; }
    }
}
