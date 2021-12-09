using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace BiblioJeux.Data.Models
{
    public partial class biblioJeuxContext : DbContext
    {
        public biblioJeuxContext()
        {
        }

        public biblioJeuxContext(DbContextOptions<biblioJeuxContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Accessoire> Accessoires { get; set; }
        public virtual DbSet<Console> Consoles { get; set; }
        public virtual DbSet<Consoleaccessoire> Consoleaccessoires { get; set; }
        public virtual DbSet<Consolejeu> Consolejeus { get; set; }
        public virtual DbSet<Jeu> Jeus { get; set; }
        public virtual DbSet<Marque> Marques { get; set; }
        public virtual DbSet<Profile> Profiles { get; set; }
        public virtual DbSet<Utilisateur> Utilisateurs { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("Name=Default");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Accessoire>(entity =>
            {
                entity.HasKey(e => e.IdAccessoire)
                    .HasName("PRIMARY");

                entity.ToTable("accessoire");

                entity.HasIndex(e => e.IdMarque, "FK_Accessoire_Marque");

                entity.Property(e => e.IdAccessoire)
                    .HasColumnType("int(11)")
                    .HasColumnName("idAccessoire");

                entity.Property(e => e.IdMarque)
                    .HasColumnType("int(11)")
                    .HasColumnName("idMarque");

                entity.Property(e => e.LibelleAccessoire)
                    .HasMaxLength(50)
                    .HasColumnName("libelleAccessoire");

                entity.HasOne(d => d.IdMarqueNavigation)
                    .WithMany(p => p.Accessoires)
                    .HasForeignKey(d => d.IdMarque)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Accessoire_Marque");
            });

            modelBuilder.Entity<Console>(entity =>
            {
                entity.HasKey(e => e.IdConsole)
                    .HasName("PRIMARY");

                entity.ToTable("console");

                entity.HasIndex(e => e.IdMarque, "FK_Console_Marque");

                entity.Property(e => e.IdConsole)
                    .HasColumnType("int(11)")
                    .HasColumnName("idConsole");

                entity.Property(e => e.IdMarque)
                    .HasColumnType("int(11)")
                    .HasColumnName("idMarque");

                entity.Property(e => e.LibelleConsole)
                    .HasMaxLength(50)
                    .HasColumnName("libelleConsole");

                entity.HasOne(d => d.IdMarqueNavigation)
                    .WithMany(p => p.Consoles)
                    .HasForeignKey(d => d.IdMarque)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Console_Marque");
            });

            modelBuilder.Entity<Consoleaccessoire>(entity =>
            {
                entity.HasKey(e => e.IdConsoleAccessoire)
                    .HasName("PRIMARY");

                entity.ToTable("consoleaccessoire");

                entity.HasIndex(e => e.IdAccessoire, "FK_ConsoleAccessoire_Accessoire");

                entity.HasIndex(e => e.IdConsole, "FK_ConsoleAccessoire_Console");

                entity.Property(e => e.IdConsoleAccessoire)
                    .HasColumnType("int(11)")
                    .HasColumnName("idConsoleAccessoire");

                entity.Property(e => e.IdAccessoire)
                    .HasColumnType("int(11)")
                    .HasColumnName("idAccessoire");

                entity.Property(e => e.IdConsole)
                    .HasColumnType("int(11)")
                    .HasColumnName("idConsole");

                entity.HasOne(d => d.IdAccessoireNavigation)
                    .WithMany(p => p.Consoleaccessoires)
                    .HasForeignKey(d => d.IdAccessoire)
                    .HasConstraintName("FK_ConsoleAccessoire_Accessoire");

                entity.HasOne(d => d.IdConsoleNavigation)
                    .WithMany(p => p.Consoleaccessoires)
                    .HasForeignKey(d => d.IdConsole)
                    .HasConstraintName("FK_ConsoleAccessoire_Console");
            });

            modelBuilder.Entity<Consolejeu>(entity =>
            {
                entity.HasKey(e => e.IdConsoleJeu)
                    .HasName("PRIMARY");

                entity.ToTable("consolejeu");

                entity.HasIndex(e => e.IdConsole, "FK_ConsoleJeu_Console");

                entity.HasIndex(e => e.IdJeu, "FK_ConsoleJeu_Jeu");

                entity.Property(e => e.IdConsoleJeu)
                    .HasColumnType("int(11)")
                    .HasColumnName("idConsoleJeu");

                entity.Property(e => e.IdConsole)
                    .HasColumnType("int(11)")
                    .HasColumnName("idConsole");

                entity.Property(e => e.IdJeu)
                    .HasColumnType("int(11)")
                    .HasColumnName("idJeu");

                entity.HasOne(d => d.IdConsoleNavigation)
                    .WithMany(p => p.Consolejeus)
                    .HasForeignKey(d => d.IdConsole)
                    .HasConstraintName("FK_ConsoleJeu_Console");

                entity.HasOne(d => d.IdJeuNavigation)
                    .WithMany(p => p.Consolejeus)
                    .HasForeignKey(d => d.IdJeu)
                    .HasConstraintName("FK_ConsoleJeu_Jeu");
            });

            modelBuilder.Entity<Jeu>(entity =>
            {
                entity.HasKey(e => e.IdJeu)
                    .HasName("PRIMARY");

                entity.ToTable("jeu");

                entity.HasIndex(e => e.IdMarque, "FK_Jeu_Marque");

                entity.Property(e => e.IdJeu)
                    .HasColumnType("int(11)")
                    .HasColumnName("idJeu");

                entity.Property(e => e.IdMarque)
                    .HasColumnType("int(11)")
                    .HasColumnName("idMarque");

                entity.Property(e => e.LibelleJeu)
                    .HasMaxLength(50)
                    .HasColumnName("libelleJeu");

                entity.HasOne(d => d.IdMarqueNavigation)
                    .WithMany(p => p.Jeus)
                    .HasForeignKey(d => d.IdMarque)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Jeu_Marque");
            });

            modelBuilder.Entity<Marque>(entity =>
            {
                entity.HasKey(e => e.IdMarque)
                    .HasName("PRIMARY");

                entity.ToTable("marque");

                entity.Property(e => e.IdMarque)
                    .HasColumnType("int(11)")
                    .HasColumnName("idMarque");

                entity.Property(e => e.LibelleMarque)
                    .HasMaxLength(50)
                    .HasColumnName("libelleMarque");
            });

            modelBuilder.Entity<Profile>(entity =>
            {
                entity.HasKey(e => e.IdProfile)
                    .HasName("PRIMARY");

                entity.ToTable("profile");

                entity.HasIndex(e => e.IdAccessoire, "FK_Profile_Accessoire");

                entity.HasIndex(e => e.IdConsole, "FK_Profile_Console");

                entity.HasIndex(e => e.IdJeu, "FK_Profile_Jeu");

                entity.HasIndex(e => e.IdUtilisateur, "FK_Profile_Utilisateur");

                entity.Property(e => e.IdProfile)
                    .HasColumnType("int(11)")
                    .HasColumnName("idProfile");

                entity.Property(e => e.IdAccessoire)
                    .HasColumnType("int(11)")
                    .HasColumnName("idAccessoire");

                entity.Property(e => e.IdConsole)
                    .HasColumnType("int(11)")
                    .HasColumnName("idConsole");

                entity.Property(e => e.IdJeu)
                    .HasColumnType("int(11)")
                    .HasColumnName("idJeu");

                entity.Property(e => e.IdUtilisateur)
                    .HasColumnType("int(11)")
                    .HasColumnName("idUtilisateur");

                entity.HasOne(d => d.IdAccessoireNavigation)
                    .WithMany(p => p.Profiles)
                    .HasForeignKey(d => d.IdAccessoire)
                    .HasConstraintName("FK_Profile_Accessoire");

                entity.HasOne(d => d.IdConsoleNavigation)
                    .WithMany(p => p.Profiles)
                    .HasForeignKey(d => d.IdConsole)
                    .HasConstraintName("FK_Profile_Console");

                entity.HasOne(d => d.IdJeuNavigation)
                    .WithMany(p => p.Profiles)
                    .HasForeignKey(d => d.IdJeu)
                    .HasConstraintName("FK_Profile_Jeu");

                entity.HasOne(d => d.IdUtilisateurNavigation)
                    .WithMany(p => p.Profiles)
                    .HasForeignKey(d => d.IdUtilisateur)
                    .HasConstraintName("FK_Profile_Utilisateur");
            });

            modelBuilder.Entity<Utilisateur>(entity =>
            {
                entity.HasKey(e => e.IdUtilisateur)
                    .HasName("PRIMARY");

                entity.ToTable("utilisateur");

                entity.Property(e => e.IdUtilisateur)
                    .HasColumnType("int(11)")
                    .HasColumnName("idUtilisateur");

                entity.Property(e => e.EmailUtilisateur)
                    .HasMaxLength(50)
                    .HasColumnName("emailUtilisateur");

                entity.Property(e => e.MotDePasseUtilisateur)
                    .HasMaxLength(50)
                    .HasColumnName("motDePasseUtilisateur");

                entity.Property(e => e.PhotoCollection)
                    .HasMaxLength(50)
                    .HasColumnName("photoCollection");

                entity.Property(e => e.PseudoUtilisateur)
                    .HasMaxLength(50)
                    .HasColumnName("pseudoUtilisateur");

                entity.Property(e => e.Statue)
                    .HasMaxLength(50)
                    .HasColumnName("statue");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
