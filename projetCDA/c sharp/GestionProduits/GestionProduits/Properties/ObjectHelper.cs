using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;


public class GestionsProduits
{  /* fichier de transformation en json */ 
    static class ObjectHelper
    {
        public static void Dump(this object data)
        { 
            string json = 
                JsonConvert.SerializeObject (data,Formatting.Indented); /* format presenter donc : nom : alan , prenom : alan ...  */ 
            Trace.WriteLine(json); /* fonction pour avoir un visuel de la realisation */ 
        }
    }
}

