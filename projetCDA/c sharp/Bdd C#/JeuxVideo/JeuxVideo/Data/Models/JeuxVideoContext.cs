using JeuxVideo.Data.Models;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace JeuxVideo.Models.DbModels
{
    public partial class JeuxVideoContext : DbContext
    {
        public JeuxVideoContext()
        {
        }

        public JeuxVideoContext(DbContextOptions<JeuxVideoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Jeu> Jeux { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("Name=Default");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Jeu>(entity =>
            {
                entity.HasKey(e => e.IdJeu)
                    .HasName("PRIMARY");

                entity.ToTable("jeux");

                entity.Property(e => e.IdJeu).HasColumnType("int(11)");

                entity.Property(e => e.Nom)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Plateforme)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
