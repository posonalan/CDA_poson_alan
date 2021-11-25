using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace JeuxVideo.Data.Models
{
    public class Jeu
    {
        [Key]
        public int IdJeu { get; set; }
        public string Nom { get; set; }
        public string Plateforme { get; set; }

        internal void Dump()
        {
            throw new NotImplementedException();
        }
    }
}
