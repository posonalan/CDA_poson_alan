using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using CantineMartine.Data.Models;

#nullable disable

namespace CantineMartine.Data
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

        public virtual DbSet<Categoriesplat> Categoriesplats { get; set; }
        public virtual DbSet<Categoriesproduit> Categoriesproduits { get; set; }
        public virtual DbSet<Contenumenu> Contenumenus { get; set; }
        public virtual DbSet<Contenuplat> Contenuplats { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Plat> Plats { get; set; }
        public virtual DbSet<Produit> Produits { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
           optionsBuilder.UseMySQL("server=localhost;user=root;database=cantinemartine;ssl mode=none");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categoriesplat>(entity =>
            {
                entity.HasKey(e => e.IdCategoriePlat)
                    .HasName("PRIMARY");

                entity.ToTable("categoriesplats");

                entity.Property(e => e.IdCategoriePlat).HasColumnType("int(11)");

                entity.Property(e => e.LibelleCategoriePlat).HasMaxLength(50);
            });

            modelBuilder.Entity<Categoriesproduit>(entity =>
            {
                entity.HasKey(e => e.IdCategorieProduit)
                    .HasName("PRIMARY");

                entity.ToTable("categoriesproduits");

                entity.Property(e => e.IdCategorieProduit).HasColumnType("int(11)");

                entity.Property(e => e.LibelleCategorieProduit).HasMaxLength(50);
            });

            modelBuilder.Entity<Contenumenu>(entity =>
            {
                entity.HasKey(e => e.IdContenuMenu)
                    .HasName("PRIMARY");

                entity.ToTable("contenumenu");

                entity.HasIndex(e => e.IdMenu, "FK_ContenuMenu_Menus");

                entity.HasIndex(e => e.IdPlat, "FK_ContenuMenu_Plats");

                entity.Property(e => e.IdContenuMenu).HasColumnType("int(11)");

                entity.Property(e => e.DateJour).HasColumnType("date");

                entity.Property(e => e.IdMenu).HasColumnType("int(11)");

                entity.Property(e => e.IdPlat).HasColumnType("int(11)");

                entity.HasOne(d => d.IdMenuNavigation)
                    .WithMany(p => p.Contenumenus)
                    .HasForeignKey(d => d.IdMenu)
                    .HasConstraintName("FK_ContenuMenu_Menus");

                entity.HasOne(d => d.IdPlatNavigation)
                    .WithMany(p => p.Contenumenus)
                    .HasForeignKey(d => d.IdPlat)
                    .HasConstraintName("FK_ContenuMenu_Plats");
            });

            modelBuilder.Entity<Contenuplat>(entity =>
            {
                entity.HasKey(e => e.IdContenuPlat)
                    .HasName("PRIMARY");

                entity.ToTable("contenuplat");

                entity.HasIndex(e => e.IdPlat, "FK_ContenuPlat_Plats");

                entity.HasIndex(e => e.IdProduit, "FK_ContenuPlat_Produits");

                entity.Property(e => e.IdContenuPlat).HasColumnType("int(11)");

                entity.Property(e => e.IdPlat).HasColumnType("int(11)");

                entity.Property(e => e.IdProduit).HasColumnType("int(11)");

                entity.Property(e => e.Quantite).HasColumnType("int(11)");

                entity.HasOne(d => d.IdPlatNavigation)
                    .WithMany(p => p.Contenuplats)
                    .HasForeignKey(d => d.IdPlat)
                    .HasConstraintName("FK_ContenuPlat_Plats");

                entity.HasOne(d => d.IdProduitNavigation)
                    .WithMany(p => p.Contenuplats)
                    .HasForeignKey(d => d.IdProduit)
                    .HasConstraintName("FK_ContenuPlat_Produits");
            });

            modelBuilder.Entity<Menu>(entity =>
            {
                entity.HasKey(e => e.IdMenu)
                    .HasName("PRIMARY");

                entity.ToTable("menus");

                entity.Property(e => e.IdMenu).HasColumnType("int(11)");

                entity.Property(e => e.NumeroSemaine).HasColumnType("int(11)");
            });

            modelBuilder.Entity<Plat>(entity =>
            {
                entity.HasKey(e => e.IdPlat)
                    .HasName("PRIMARY");

                entity.ToTable("plats");

                entity.HasIndex(e => e.IdCategoriePlat, "FK_Plats_CategoriePlat");

                entity.Property(e => e.IdPlat).HasColumnType("int(11)");

                entity.Property(e => e.IdCategoriePlat).HasColumnType("int(11)");

                entity.Property(e => e.LibellePlat).HasMaxLength(50);

                entity.HasOne(d => d.CategoriePlat)
                    .WithMany(p => p.Plats)
                    .HasForeignKey(d => d.IdCategoriePlat)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Plats_CategoriePlat");
            });

            modelBuilder.Entity<Produit>(entity =>
            {
                entity.HasKey(e => e.IdProduit)
                    .HasName("PRIMARY");

                entity.ToTable("produits");

                entity.HasIndex(e => e.IdCategorieProduit, "FK_Produits_CategorieProduits");

                entity.Property(e => e.IdProduit).HasColumnType("int(11)");

                entity.Property(e => e.IdCategorieProduit).HasColumnType("int(11)");

                entity.Property(e => e.LibelleProduit).HasMaxLength(50);

                entity.Property(e => e.QuantiteProduit).HasColumnType("int(11)");

                entity.HasOne(d => d.CategProduit)
                    .WithMany(p => p.Produits)
                    .HasForeignKey(d => d.IdCategorieProduit)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Produits_CategorieProduits");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
