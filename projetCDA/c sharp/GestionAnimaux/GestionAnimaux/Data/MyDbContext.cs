﻿using GestionAnimaux.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GestionAnimaux.Data
{
    public class MyDbContext : DbContext
    {
        public virtual DbSet<Animal> Animaux { get; set; }
        public virtual DbSet<Aliment> Alimentation { get; set; }
        /* Ce constructeur fait appel au constructeur hérité et lui passera les options de connexion à la base de données */
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {
        }
        /* ___________________________ */ 
        /* fonction de configuration */ 
        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    if (!optionsBuilder.IsConfigured)
        //    {
        //        optionsBuilder.UseSqlServer("data source=.;initial catalog=GestionAnimaux;Integrated Security=SSPI");
        //    }
        //}
        /* ___________________________ */

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Aliment>(aliment =>
            {
                aliment.ToTable("Alimentation");
                aliment.Property(e => e.IdAliment).HasColumnName("IdAliment");
            });
            modelBuilder.Entity<Animal>(animal =>
            {
                animal.ToTable("Animaux");
                animal.Property(e => e.IdAliment).HasColumnName("IdAliment");
                animal.HasOne(e => e.Aliment).WithOne().HasForeignKey<Aliment>(e => e.IdAliment);
            });
        }
    }
}
