using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using AdopteUneBeteVisuel.Data.Models;

#nullable disable

namespace AdopteUneBeteVisuel.Data
{
    public partial class MyDbContext : DbContext
    {
        public MyDbContext()
        {
        }

        public MyDbContext(DbContextOptions<MyDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<alimentation> Alimentations { get; set; }
        public virtual DbSet<animaux> Animaux { get; set; }
        public virtual DbSet<espece> Especes { get; set; }
        public virtual DbSet<nutrition> Nutritions { get; set; }
        public virtual DbSet<race> Races { get; set; }
        public virtual DbSet<user> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("server=localhost;user=root;database=adopteunebete;ssl mode=none");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<alimentation>(entity =>
            {
                entity.HasKey(e => e.Id_alimentation)
                    .HasName("PRIMARY");

                entity.Property(e => e.Id_alimentation).HasColumnType("int(11)");

                entity.Property(e => e.libelle)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<animaux>(entity =>
            {
                entity.HasKey(e => e.Id_Animal)
                    .HasName("PRIMARY");

                entity.ToTable("animaux");

                entity.HasIndex(e => e.Id_Race, "FK_Animaux_Races");

                entity.HasIndex(e => e.Id_user, "FK_Animaux_users");

                entity.HasIndex(e => e.matricule, "matricule")
                    .IsUnique();

                entity.Property(e => e.Id_Animal).HasColumnType("int(11)");

                entity.Property(e => e.Id_Race).HasColumnType("int(11)");

                entity.Property(e => e.Id_user).HasColumnType("int(11)");

                entity.Property(e => e.age).HasColumnType("int(11)");

                entity.Property(e => e.image).IsRequired();

                entity.Property(e => e.matricule)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Race)
                    .WithMany(p => p.ListAnimaux)
                    .HasForeignKey(d => d.Id_Race)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Animaux_Races");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ListAnimaux)
                    .HasForeignKey(d => d.Id_user)
                    .HasConstraintName("FK_Animaux_users");
            });

            modelBuilder.Entity<espece>(entity =>
            {
                entity.HasKey(e => e.Id_Espece)
                    .HasName("PRIMARY");

                entity.Property(e => e.Id_Espece).HasColumnType("int(11)");

                entity.Property(e => e.libelle)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<nutrition>(entity =>
            {
                entity.HasKey(e => e.Id_nutrition)
                    .HasName("PRIMARY");

                entity.ToTable("nutrition");

                entity.HasIndex(e => e.Id_Race, "FK_Nutrition_Races");

                entity.HasIndex(e => e.Id_alimentation, "FK_Nutrition_alimentations");

                entity.Property(e => e.Id_nutrition).HasColumnType("int(11)");

                entity.Property(e => e.Id_Race).HasColumnType("int(11)");

                entity.Property(e => e.Id_alimentation).HasColumnType("int(11)");

                entity.HasOne(d => d.Race)
                    .WithMany(p => p.ListNutritions)
                    .HasForeignKey(d => d.Id_Race)
                    .HasConstraintName("FK_Nutrition_Races");

                entity.HasOne(d => d.Alimentation)
                    .WithMany(p => p.ListNutritions)
                    .HasForeignKey(d => d.Id_alimentation)
                    .HasConstraintName("FK_Nutrition_alimentations");
            });

            modelBuilder.Entity<race>(entity =>
            {
                entity.HasKey(e => e.Id_Race)
                    .HasName("PRIMARY");

                entity.HasIndex(e => e.Id_Espece, "FK_Races_Especes");

                entity.Property(e => e.Id_Race).HasColumnType("int(11)");

                entity.Property(e => e.Id_Espece).HasColumnType("int(11)");

                entity.Property(e => e.libelle)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Espece)
                    .WithMany(p => p.ListRaces)
                    .HasForeignKey(d => d.Id_Espece)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Races_Especes");
            });

            modelBuilder.Entity<user>(entity =>
            {
                entity.HasKey(e => e.Id_user)
                    .HasName("PRIMARY");

                entity.HasIndex(e => e.login, "login")
                    .IsUnique();

                entity.Property(e => e.Id_user).HasColumnType("int(11)");

                entity.Property(e => e.login)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.password)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
