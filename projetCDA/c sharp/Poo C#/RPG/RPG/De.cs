using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG
{
    class De
    {

        public static int LanceLeDe()
        {
            Random aleatoire = new Random();

            return aleatoire.Next(1, 7);
        }
    }
}
