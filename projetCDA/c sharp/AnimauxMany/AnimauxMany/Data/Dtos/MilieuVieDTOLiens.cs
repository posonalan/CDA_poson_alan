using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AnimauxMany.Data.Dtos
{
    public class MilieuVieDTOLiens
    {
    }

    public int IdMilieuVie { get; set; }
    public int? IdAnimaux { get; set; }
    public int? IdGeographie { get; set; }

    public virtual Animaux IdAnimauxNavigation { get; set; }
    public virtual Geographie IdGeographieNavigation { get; set; }


}
