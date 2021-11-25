using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace GestionAnimaux.Data.Models
{
    public class Animal
    {
        [Key]
        public int IdAnimal { get; set; }
        public string Nom { get; set; }
     

        internal void Dump()
        {
            throw new NotImplementedException();
        }
    }
}
