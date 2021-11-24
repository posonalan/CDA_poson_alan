using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenerationBdd.Data
{
    public class MyDbContext : DbContext
    {
        public DbSet<Personnes> Personnes { get; set; }
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options) { }

        /* Modifier les types générés dans le contexte */ 
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        { /* changer l'age en short au lieu de int */ 
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Personnes>(e => e.Property(o => o.Age)
            .HasColumnType("tinyint(1)").HasConversion<short>());
        }




    }
}
