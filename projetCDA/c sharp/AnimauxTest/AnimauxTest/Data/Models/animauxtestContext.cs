using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace AnimauxTest.Data.Models
{
    public partial class animauxtestContext : DbContext
    {
        public animauxtestContext()
        {
        }

        public animauxtestContext(DbContextOptions<animauxtestContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Alimentation> Alimentations { get; set; }
        public virtual DbSet<Animaux> Animauxes { get; set; }
        public virtual DbSet<Geographie> Geographies { get; set; }
        public virtual DbSet<Habitat> Habitats { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("Name=Default");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Alimentation>(entity =>
            {
                entity.HasKey(e => e.IdAlimentations)
                    .HasName("PRIMARY");

                entity.ToTable("alimentations");

                entity.Property(e => e.IdAlimentations).HasColumnType("int(11)");

                entity.Property(e => e.LibelleAliment).HasMaxLength(50);
            });

            modelBuilder.Entity<Animaux>(entity =>
            {
                entity.HasKey(e => e.IdAnimaux)
                    .HasName("PRIMARY");

                entity.ToTable("animaux");

                entity.HasIndex(e => e.IdAlimentations, "IdAlimentations");

                entity.HasIndex(e => e.IdGeographie, "IdGeographie");

                entity.HasIndex(e => e.IdHabitat, "IdHabitat");

                entity.Property(e => e.IdAnimaux).HasColumnType("int(11)");

                entity.Property(e => e.IdAlimentations).HasColumnType("int(11)");

                entity.Property(e => e.IdGeographie).HasColumnType("int(11)");

                entity.Property(e => e.IdHabitat).HasColumnType("int(11)");

                entity.Property(e => e.LibelleAnimal).HasMaxLength(50);

                entity.Property(e => e.TypeAnimal).HasMaxLength(50);

                entity.HasOne(d => d.IdAlimentationsNavigation)
                    .WithMany(p => p.Animauxes)
                    .HasForeignKey(d => d.IdAlimentations)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("animaux_ibfk_2");

                entity.HasOne(d => d.IdGeographieNavigation)
                    .WithMany(p => p.Animauxes)
                    .HasForeignKey(d => d.IdGeographie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("animaux_ibfk_3");

                entity.HasOne(d => d.IdHabitatNavigation)
                    .WithMany(p => p.Animauxes)
                    .HasForeignKey(d => d.IdHabitat)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("animaux_ibfk_1");
            });

            modelBuilder.Entity<Geographie>(entity =>
            {
                entity.HasKey(e => e.IdGeographie)
                    .HasName("PRIMARY");

                entity.ToTable("geographie");

                entity.Property(e => e.IdGeographie).HasColumnType("int(11)");

                entity.Property(e => e.LibelleGeographie).HasMaxLength(50);
            });

            modelBuilder.Entity<Habitat>(entity =>
            {
                entity.HasKey(e => e.IdHabitat)
                    .HasName("PRIMARY");

                entity.ToTable("habitat");

                entity.Property(e => e.IdHabitat).HasColumnType("int(11)");

                entity.Property(e => e.LibelleHabitat).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
