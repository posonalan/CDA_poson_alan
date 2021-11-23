using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using TestApi.Data.Models;

#nullable disable

namespace TestApi.Models.DbModels
{
    public partial class dunkerqueContext : DbContext
    {
        public dunkerqueContext()
        {
        }

        public dunkerqueContext(DbContextOptions<dunkerqueContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Personne> Personnes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("Name=Default");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Personne>(entity =>
            {
                entity.HasKey(e => e.IdPersonnes)
                    .HasName("PRIMARY");

                entity.ToTable("personnes");

                entity.Property(e => e.IdPersonnes).HasColumnType("int(11)");

                entity.Property(e => e.Nom)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Prenom)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
