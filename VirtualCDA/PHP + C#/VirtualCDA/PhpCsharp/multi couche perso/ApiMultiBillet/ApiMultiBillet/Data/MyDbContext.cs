using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ApiMultiBillet.Data.Models;

#nullable disable

namespace ApiMultiBillet.Data
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

        public virtual DbSet<Billeterie> Billeteries { get; set; }
        public virtual DbSet<Stagiaire> Stagiaires { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySQL("server=localhost;user=root;database=multicoucheperso;port=3308;ssl mode=none");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Billeterie>(entity =>
            {
                entity.HasKey(e => e.IdBillet)
                    .HasName("PRIMARY");

                entity.ToTable("billeterie");

                entity.Property(e => e.IdBillet).HasColumnType("int(11)");

                entity.Property(e => e.LibelleBillet)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Stagiaire>(entity =>
            {
                entity.HasKey(e => e.IdStagiaire)
                    .HasName("PRIMARY");

                entity.ToTable("stagiaire");

                entity.Property(e => e.IdStagiaire)
                    .HasColumnType("int(11)")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IdBillet).HasColumnType("int(11)");

                entity.Property(e => e.Nom)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Prenom)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdStagiaireNavigation)
                    .WithOne(p => p.Stagiaire)
                    .HasForeignKey<Stagiaire>(d => d.IdStagiaire)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Stagiaire_Billeterie");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
