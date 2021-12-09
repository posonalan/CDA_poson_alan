using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestApi.Data.Models;

namespace TestApi.Data
{ /* La classe contexte permet de créer la relation (session) avec la base de données. */
  /* La classe de contexte est utilisée pour interroger ou enregistrer des données dans la base de données. */ 
    public class MyDbContext : DbContext
    {
        public DbSet<Personne> Personnes { get; set; }
        /* Ce constructeur fait appel au constructeur hérité et lui passera les options de connexion à la base de données */
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)

        {

        }
    }
}
