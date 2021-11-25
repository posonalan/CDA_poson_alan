using GestionAnimaux.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GestionAnimaux.Data
{
    public class MyDbContext : DbContext
    {
        public DbSet<Animal> Animaux { get; set; }
        public DbSet<Aliment> Alimentation { get; set; }
        /* Ce constructeur fait appel au constructeur hérité et lui passera les options de connexion à la base de données */
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {
        }
    }
}
