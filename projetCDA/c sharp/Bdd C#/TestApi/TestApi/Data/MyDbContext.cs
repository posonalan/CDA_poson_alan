using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestApi.Data.Models;

namespace TestApi.Data
{ /* La classe contexte permet de cr�er la relation (session) avec la base de donn�es. */
  /* La classe de contexte est utilis�e pour interroger ou enregistrer des donn�es dans la base de donn�es. */ 
    public class MyDbContext : DbContext
    {
        public DbSet<Personne> Personnes { get; set; }
        /* Ce constructeur fait appel au constructeur h�rit� et lui passera les options de connexion � la base de donn�es */
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)

        {

        }
    }
}
