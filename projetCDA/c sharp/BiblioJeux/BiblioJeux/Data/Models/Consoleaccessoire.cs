using System;
using System.Collections.Generic;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class Consoleaccessoire
    {
        public int IdConsoleAccessoire { get; set; }
        public int? IdAccessoire { get; set; }
        public int? IdConsole { get; set; }

        public virtual Accessoire IdAccessoireNavigation { get; set; }
        public virtual Console IdConsoleNavigation { get; set; }
    }
}
